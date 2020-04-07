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
	| aCoderElement |
	
	aCoderElement := coder asElement.
	aCoderElement margin: (BlInsets all: 0).
	
	self announcer
		when: GtSnippetFocusRequestAnnouncement
		send: #requestFocus
		to: aCoderElement.
	
	^ BrFrame new
		vFitContent;
		hMatchParent;
		look: (GtSnippetContainerLook new snippet: self);
		addChild: aCoderElement
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

{ #category : #'api - cursor' }
GtCoderSnippet >> focusAndPlaceCursorAtBeginning [
	self textEditor moveCursorTo: 0.
	self requestSnippetFocus
]

{ #category : #'api - cursor' }
GtCoderSnippet >> focusAndPlaceCursorAtEnd [
	self textEditor moveCursorTo: self textEditor text size.
	self requestSnippetFocus
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
	coder announcer weak
		when: GtCoderEvaluationAnnouncement
		send: #codeEvaluated:
		to: self.
	self variableBindings: GtSnippetBindings new.
	self subscribeToEditorChanges.
	self initializeCoderAddOns
]

{ #category : #initialization }
GtCoderSnippet >> initializeCoderAddOns [
	coder addOns
		addDropDownAction: 'Create example'
			icon: BrGlamorousIcons eg
			stencil: [ :selectedClass | 
				| currentSource |
				currentSource := self text.
				self
					requestSnippetReplacement: GtExampleSnippet
					initializedWith: [ :anExampleSnippet | 
						anExampleSnippet
							updateForCodeSnippet: currentSource
							inClass: selectedClass ] ];
		addShortcut:
			(BlShortcut new
				combination: BlKeyCombination builder primary backspace build;
				action: [ self requestSnippetMerge ]);
		addShortcut:
			(BlShortcut new
				repeatable: false;
				combination: BlKeyCombination primaryR;
				action: [ :anEvent | self startRenameIn: anEvent currentTarget ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						return;
						build);
				action: [ self requestSnippetSplit ]);
		addShortcut:
			(BlShortcut new
				combination: BlKeyCombination arrowLeft;
				action: [ :anEvent | self moveLeft: anEvent currentTarget ]);
		addShortcut:
			(BlShortcut new
				combination: BlKeyCombination arrowRight;
				action: [ :anEvent | self moveRight: anEvent currentTarget ]);
		addShortcut:
			(BlShortcut new
				combination: BlKeyCombination arrowUp;
				action: [ :anEvent | self moveUp: anEvent currentTarget ]);
		addShortcut:
			(BlShortcut new
				combination: BlKeyCombination arrowDown;
				action: [ :anEvent | self moveDown: anEvent currentTarget ])
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
GtCoderSnippet >> moveDown: anElement [
	| textEditor position |
	textEditor := anElement editor.
	textEditor cursors cursorsCount = 1
		ifTrue: [ position := textEditor cursors first position ].
	textEditor navigator moveDown apply.
	(textEditor cursors cursorsCount = 1
		and: [ position = textEditor cursors first position ])
		ifTrue: [ self
				announce:
					(GtSnippetExternalCursorAnnouncement new
						snippet: self;
						direction: #down) ]
]

{ #category : #actions }
GtCoderSnippet >> moveLeft: anElement [
	| textEditor |
	textEditor := anElement editor.
	(textEditor cursors cursorsCount = 1
		and: [ textEditor cursors first position = 0 ])
		ifTrue: [ self
				announce:
					(GtSnippetExternalCursorAnnouncement new
						snippet: self;
						direction: #left) ]
		ifFalse: [ textEditor deselecter all deselect.
			textEditor navigator moveLeft apply ]
]

{ #category : #actions }
GtCoderSnippet >> moveRight: anElement [
	| textEditor |
	textEditor := anElement editor.
	(textEditor cursors cursorsCount = 1
		and: [ textEditor cursors first position >= textEditor text size ])
		ifTrue: [ self
				announce:
					(GtSnippetExternalCursorAnnouncement new
						snippet: self;
						direction: #right) ]
		ifFalse: [ textEditor deselecter all deselect.
			textEditor navigator moveRight apply ]
]

{ #category : #actions }
GtCoderSnippet >> moveUp: anElement [
	| textEditor position |
	textEditor := anElement editor.
	textEditor cursors cursorsCount = 1
		ifTrue: [ position := textEditor cursors first position ].
	textEditor navigator moveUp apply.
	(textEditor cursors cursorsCount = 1
		and: [ position = textEditor cursors first position ])
		ifTrue: [ self
				announce:
					(GtSnippetExternalCursorAnnouncement new
						snippet: self;
						direction: #up) ]
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

{ #category : #'as yet unclassified' }
GtCoderSnippet >> xDocLoadSavedContent [
	"Load the saved content from the XdKeyDocumentStore"

	coder xDocLoadSavedContent
]
