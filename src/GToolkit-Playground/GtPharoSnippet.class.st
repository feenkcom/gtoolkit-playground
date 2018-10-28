Class {
	#name : #GtPharoSnippet,
	#superclass : #GtCodeSnippet,
	#category : #'GToolkit-Playground-Model'
}

{ #category : #accessing }
GtPharoSnippet class >> typeName [
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	<return: #String>

	^ 'pharo'
]

{ #category : #visitor }
GtPharoSnippet >> accept: aVisitor [
	^ aVisitor visitGtPharoSnippet: self
]

{ #category : #binding }
GtPharoSnippet >> bindingOf: aSymbol [
	<return: #LiteralVariable or: nil>
	^ editor styler workspace bindingOf: aSymbol
]

{ #category : #accessing }
GtPharoSnippet >> classOrMetaClass [
	<return: #Behavior>

	^ editor styler classOrMetaClass
]

{ #category : #accessing }
GtPharoSnippet >> classOrMetaClass: aBehavior [
	self 
		assert: [ aBehavior notNil ] 
		description: [ 'Class or meta-class must be non-nil' ].

	editor styler classOrMetaClass: aBehavior
]

{ #category : #initialization }
GtPharoSnippet >> defaultStyler [
	^ BrRBTextStyler new workspace: GtHighlightingBindingStrategy new
]

{ #category : #'api - actions' }
GtPharoSnippet >> evaluate [
	| aCommand |
	aCommand := (GtEvaluateSnippetCommand snippet: self)
		asErrorCatchingCommand.
	aCommand execute.
	self styleEvaluatedCodeWithResult: aCommand result asException: aCommand isException.
	self
		notifyAboutResult: aCommand result
		exception: aCommand isException
		spawn: false.
	^ aCommand result
]

{ #category : #'api - actions' }
GtPharoSnippet >> evaluateAndGo [
	| aCommand |
	aCommand := (GtEvaluateSnippetCommand snippet: self)
		asErrorCatchingCommand.
	aCommand execute.
	self styleEvaluatedCodeWithResult: aCommand result asException: aCommand isException.
	self
		notifyAboutResult: aCommand result
		exception: aCommand isException
		spawn: true.
	^ aCommand result
]

{ #category : #initialization }
GtPharoSnippet >> initialize [
	super initialize.
	self variableBindings: GtPlaygroundBindings new.
	self classOrMetaClass: UndefinedObject
]

{ #category : #'api - modification' }
GtPharoSnippet >> mergeWith: anSnippet [
	"Subclasses can define merging mechanism"
	anSnippet class = self class ifFalse: [ ^ self ].
	anSnippet text isEmpty ifFalse: [
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
			text: anSnippet text; 
			insert ].
	anSnippet requestSnippetRemoval.
	self requestSnippetFocus.
]

{ #category : #'api - requests' }
GtPharoSnippet >> requestSnippetMerge [
	self announce: (GtSnippetMergeRequestedAnnouncement snippet: self)
]

{ #category : #'api - requests' }
GtPharoSnippet >> requestSnippetSplit [

	self editor cursor do: [ :aCursor |
		self requestSnippetSplitAt: aCursor position ]
]

{ #category : #'api - requests' }
GtPharoSnippet >> requestSnippetSplitAt: aSplitIndex [
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

{ #category : #accessing }
GtPharoSnippet >> sourceCode: aStringOrRope [
	super sourceCode: aStringOrRope.
	editor text attributes: {
		BlFontGenericFamilyAttribute monospace beNotOverwritableByStyler.
		(BlFontSizeAttribute size: 14) beNotOverwritableByStyler }.
]

{ #category : #converting }
GtPharoSnippet >> stencilBuilderClass [
	^ GtPharoSnippetStencilBuilder
]

{ #category : #'private - styling' }
GtPharoSnippet >> styleEvaluatedCodeWithResult: aResult asException: aBoolean [
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
GtPharoSnippet >> variableBindings [
	<return: #GtBindingsTrait>

	^ editor styler workspace bindings
]

{ #category : #accessing }
GtPharoSnippet >> variableBindings: aGtBindingsTrait [
	self 
		assert: [ aGtBindingsTrait notNil ] 
		description: [ 'Variable bindings must be non-nil' ].

	editor styler workspace bindings: aGtBindingsTrait
]
