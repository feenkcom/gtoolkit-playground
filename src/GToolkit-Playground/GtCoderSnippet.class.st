Class {
	#name : #GtCoderSnippet,
	#superclass : #GtCodeSnippet,
	#instVars : [
		'coder'
	],
	#category : #'GToolkit-Playground-Model'
}

{ #category : #accessing }
GtCoderSnippet class >> typeName [
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	<return: #String>

	^ 'pharo-snippet'
]

{ #category : #visitor }
GtCoderSnippet >> accept: aVisitor [
	^ aVisitor visitGtPharoSnippet: self
]

{ #category : #converting }
GtCoderSnippet >> asStencilBuilder [
	^ coder
]

{ #category : #initialization }
GtCoderSnippet >> defaultStyler [
	^ BrRBTextStyler new workspace: GtHighlightingBindingStrategy new
]

{ #category : #actions }
GtCoderSnippet >> evaluateAndGo [
	| aCommand |
	aCommand := (GtEvaluateSnippetCommand snippet: self) asErrorCatchingCommand.
	aCommand execute.
	self styleEvaluatedCodeWithResult: aCommand result asException: aCommand isException.
	self notifyAboutResult: aCommand result exception: aCommand isException spawn: true.
	^ aCommand result
]

{ #category : #actions }
GtCoderSnippet >> evaluateAndGoIn: element [
	| result |
	result := self evaluateAndGo.
	element
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: result;
				sourceElement: element)
]

{ #category : #initialization }
GtCoderSnippet >> initialize [
	coder := GtPharoSnippetCoder new.
	super initialize.
	editor := coder sourceEditor.
	coder addOns
		addMainAction: 'Run' translated icon: BrGlamorousIcons play action: [ :aButton | self evaluateAndGoIn: aButton ];
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key g;
						build);
				action: [ :editorElement | self evaluateAndGoIn: editorElement ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key delete;
						build);
				action: [ :aShortcut | self requestSnippetMerge ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key return;
						build);
				action: [ :aShortcut | self requestSnippetSplit ])
]

{ #category : #actions }
GtCoderSnippet >> mergeWith: aSnippet [
	"Subclasses can define merging mechanism"
	aSnippet class = self class ifFalse: [ ^ self ].
	aSnippet text isEmpty ifFalse: [
		| anIndex |
		anIndex := self text finder
			startAtEnd;
			reversed;
			pattern: [ :aText :aCurrentIndex | 
				((aText at: aCurrentIndex) isSeparator not) ];
			search.
		(anIndex > 2 and: [ (self text at: anIndex) ~= $. ]) ifTrue: [ 
			self editor inserter 
				withoutSelectionDelete;
				withoutSelectionUpdate;
				withoutCursorUpdate;
				atEnd;
				string: '.';
				insert ].
		self editor inserter 
			withoutSelectionDelete;
			withoutSelectionUpdate;
			withoutCursorUpdate;
			atEnd;
			string: String cr;
			insert. 
		self editor inserter 
			withoutSelectionDelete;
			withoutSelectionUpdate;
			withoutCursorUpdate;
			atEnd;
			text: aSnippet text; 
			insert ].
	aSnippet requestSnippetRemoval.
	self requestSnippetFocus.
]

{ #category : #actions }
GtCoderSnippet >> requestSnippetMerge [
	self announce: (GtSnippetMergeRequestedAnnouncement snippet: self)
]

{ #category : #actions }
GtCoderSnippet >> requestSnippetSplit [
	| positions |
	positions := (self editor cursor cursors collect: [ :each | each position ]) asSortedCollection.
	positions reverseDo: [ :each | self requestSnippetSplitAt: each ].
	self editor moveCursorTo: self editor text size
]

{ #category : #actions }
GtCoderSnippet >> requestSnippetSplitAt: aSplitIndex [
	| aNewSnippet aRightPart aLeftPart |
	aNewSnippet := self class new.
	aLeftPart := self text copyFrom: 1 to: aSplitIndex.
	aLeftPart trimmer rightLineBreaks; trim.
	aRightPart := self text copyFrom: aSplitIndex + 1 to: self text size.
	aRightPart trimmer leftLineBreaks; trim.
	self editor text: aLeftPart.
	aNewSnippet sourceCode: aRightPart.
	self announce: (GtSnippetBelowRequestedAnnouncement 
		snippet: self second: aNewSnippet).
]

{ #category : #private }
GtCoderSnippet >> snippetType [
	^ GtCoderSnippetType of: self
]

{ #category : #accessing }
GtCoderSnippet >> sourceCode [
	^ self text asString
]

{ #category : #accessing }
GtCoderSnippet >> sourceCode: aString [
	coder source: aString
]

{ #category : #converting }
GtCoderSnippet >> stencilBuilderClass [
	"Return a stencil builder class that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ nil
]

{ #category : #'private - styling' }
GtCoderSnippet >> styleEvaluatedCodeWithResult: aResult asException: aBoolean [
	aBoolean 
		ifFalse: [ self editor styleTextAndAfterDo: [
			GtMarkSuccessfullyEvaluatedCodeCommand new
				editor: self editor;
				result: aResult;
				execute ] ]
		ifTrue: [ self editor styleTextAndAfterDo: [
			GtMarkUnsuccessfullyEvaluatedCodeCommand new
				editor: self editor;
				result: aResult;
				execute ] ]
]

{ #category : #accessing }
GtCoderSnippet >> text [
	^ coder sourceEditor text
]

{ #category : #accessing }
GtCoderSnippet >> variableBindings [
	^ coder variableBindings
]

{ #category : #accessing }
GtCoderSnippet >> variableBindings: aGtPlaygroundBindings [
	coder variableBindings: aGtPlaygroundBindings
]