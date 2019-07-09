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

{ #category : #accessing }
GtCoderSnippet >> allImplicitVariables: aCollection [
	coder completionStrategy snippetVariables: aCollection
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

{ #category : #private }
GtCoderSnippet >> ast [
	^ GtPharoParser
		parseWithErrors: coder source
		startingAt: GtPharoParser startingStateForMethodSequence
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
	^ coder doItSelectionOrAll
]

{ #category : #actions }
GtCoderSnippet >> evaluateAndGo [
	shouldSpawn := true.
	^ [ coder doItSelectionOrAll ]
		ensure: [ shouldSpawn := false ]
]

{ #category : #accessing }
GtCoderSnippet >> implicitLocalVariables [
	^ self ast ifNotNil: [ :ast | ast implicitLocalVariables ]
]

{ #category : #initialization }
GtCoderSnippet >> initialize [
	coder := GtPharoSnippetCoder new.
	super initialize.
	coder completionStrategy: GtSnippetCompletionStrategy new.
	editor := coder sourceEditor.
	shouldSpawn := false.
	coder announcer weak when: GtCoderEvaluationAnnouncement send: #codeEvaluated: to: self.
	self variableBindings: GtSnippetBindings new.
	self subscribeToEditorChanges.
	coder addOns
		addDropDownAction: nil
			icon: BrGlamorousIcons eg 
			stencil: [ :selectedClass |
				| currentSource |
				currentSource := self text.
				self 
					requestSnippetReplacement: GtExampleSnippet
					initializedWith: [ :anExampleSnippet | 
						anExampleSnippet updateForCodeSnippet: currentSource inClass: selectedClass ] ];
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder primary backspace build);
				action: [ :aShortcut | self requestSnippetMerge ]);
		addShortcut:
			(BlShortcut new
			repeatable: false;
			combination: BlKeyCombination primaryR;
			action: [ :editorElement | self startRenameIn: editorElement ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						return;
						build);
				action: [ :aShortcut | self requestSnippetSplit ])
]

{ #category : #private }
GtCoderSnippet >> intervalsForRenameVariable: aString [
	| intervals |
	intervals := OrderedCollection new.
	self ast
		withAllNodesDo: [ :each | 
			((each isKindOf: GtPharoVariableNode)
				and: [ each name source = aString and: [ each whoDefines isNil ] ])
				ifTrue: [ intervals add: each sourceInterval ] ].
	^ intervals
]

{ #category : #testing }
GtCoderSnippet >> isInterestedInRename: aGtSnippetRenameRequestedAnnouncement [
	aGtSnippetRenameRequestedAnnouncement snippet == self
		ifTrue: [ ^ false ].
	^ (self
		intervalsForRenameVariable: aGtSnippetRenameRequestedAnnouncement variableName)
		notEmpty
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
GtCoderSnippet >> playAll [
	^ coder doItAll
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

{ #category : #actions }
GtCoderSnippet >> startRenameIn: aTextEditorElement [
	| announcement ast node renameAction |
	editor := aTextEditorElement editor.
	editor cursor cursorsCount = 1
		ifFalse: [ ^ nil ].
	ast := self ast.
	node := ast findVariableNodeAt: editor cursor first position.
	(node isNil or: [ node whoDefines notNil ])
		ifTrue: [ ^ coder renameVariableIn: aTextEditorElement ].
	announcement := GtSnippetRenameRequestedAnnoucement snippet: self.
	announcement variableName: node source.
	self announce: announcement.
	announcement interestedSnippets isEmpty
		ifTrue: [ ^ coder renameVariableIn: aTextEditorElement ].
	renameAction := GtCompositeRenameAction
		locations: (self intervalsForRenameVariable: node source)
		element: aTextEditorElement.
	announcement interestedSnippets
		do: [ :each | 
			renameAction
				addLocations:
					((each intervalsForRenameVariable: node source) collect: #first)
						asSortedCollection
				to: each textEditor ].
	renameAction install
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

{ #category : #private }
GtCoderSnippet >> textEditor [
	^ coder sourceEditor
]

{ #category : #accessing }
GtCoderSnippet >> variableBindings [
	^ coder variableBindings
]

{ #category : #accessing }
GtCoderSnippet >> variableBindings: aGtPlaygroundBindings [
	coder variableBindings: aGtPlaygroundBindings
]
