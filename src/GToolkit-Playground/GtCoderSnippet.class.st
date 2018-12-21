Class {
	#name : #GtCoderSnippet,
	#superclass : #GtCodeSnippet,
	#instVars : [
		'coder',
		'shouldSpawn'
	],
	#category : #'GToolkit-Playground-Model'
}

{ #category : #accessing }
GtCoderSnippet class >> typeName [
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	<return: #String>

	^ 'pharo'
]

{ #category : #visitor }
GtCoderSnippet >> accept: aVisitor [
	^ aVisitor visitGtPharoSnippet: self
]

{ #category : #ui }
GtCoderSnippet >> asElement [
	| element coderElement |
	element := BlElement new.
	element
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	coderElement := coder asElement.
	coderElement margin: (BlInsets all: 0).
	element addChild: coderElement.
	element
		clipChildren: false;
		look: (GtSnippetContainerLook new snippet: self) + BrLayoutLook linearVertical vFitContent hMatchParent;
		border: BlBorder empty;
		padding: BlInsets empty;
		background: BlBackground transparent.
	^ element
]

{ #category : #converting }
GtCoderSnippet >> asStencilBuilder [
	^ self
]

{ #category : #ui }
GtCoderSnippet >> bind: aSnippet to: aSnippetElement [
]

{ #category : #private }
GtCoderSnippet >> codeEvaluated: anEvaluationAnnouncement [
	self
		notifyAboutResult: anEvaluationAnnouncement value
		exception: anEvaluationAnnouncement isException
		spawn: shouldSpawn
]

{ #category : #initialization }
GtCoderSnippet >> defaultStyler [
	^ BrRBTextStyler new workspace: GtHighlightingBindingStrategy new
]

{ #category : #actions }
GtCoderSnippet >> evaluate [
	^ coder doItSelection
]

{ #category : #actions }
GtCoderSnippet >> evaluateAndGo [
	shouldSpawn := true.
	^ [ coder doItSelection ]
		ensure: [ shouldSpawn := false ]
]

{ #category : #initialization }
GtCoderSnippet >> initialize [
	coder := GtPharoSnippetCoder new.
	super initialize.
	editor := coder sourceEditor.
	shouldSpawn := false.
	coder announcer weak when: GtCoderEvaluationAnnouncement send: #codeEvaluated: to: self.
	self variableBindings: GtPlaygroundBindings new.
	self subscribeToEditorChanges.
	coder addOns
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
