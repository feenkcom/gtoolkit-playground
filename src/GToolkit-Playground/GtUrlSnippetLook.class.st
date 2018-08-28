Class {
	#name : #GtUrlSnippetLook,
	#superclass : #GtCodeSnippetLook,
	#instVars : [
		'resultElement',
		'variableElement',
		'responseElement',
		'result',
		'progressElement',
		'infoElement',
		'inEditorToolbar'
	],
	#category : 'GToolkit-Playground-Snippet - Looks'
}

{ #category : #private }
GtUrlSnippetLook >> assignNewVariableName [
	self snippet responseVariableName: variableElement editor text asString.
]

{ #category : #defaults }
GtUrlSnippetLook >> defaultSnippet [
	^ GtUrlSnippet new
]

{ #category : #initialization }
GtUrlSnippetLook >> initialize [
	super initialize.
	editorElement background: Color transparent.
	progressElement := self newProgressElement.
	inEditorToolbar := self newInEditorToolbar.
	resultElement := self newResponseAndVariableElement.

]

{ #category : #initialization }
GtUrlSnippetLook >> initializeLook [
	super initializeLook.
	self widget addChild: progressElement at: 1 as: self constants progressElementName.
	self widget addChild: inEditorToolbar at: 3.
	self widget addChild: resultElement at: 4 as: self constants resultElementName.

]

{ #category : #initialization }
GtUrlSnippetLook >> newHorizontalContainerElement [
	^ BlElement new
		look: BrLayoutLook linearHorizontal hMatchParent vFitContent
]

{ #category : #initialization }
GtUrlSnippetLook >> newHorizontalFlexibleSpaceElement [
	^ BlElement new
		look: BrLayoutLook linearHorizontal vFitContent hMatchParent
]

{ #category : #initialization }
GtUrlSnippetLook >> newInEditorButton [
	^ BrButton new
			look: BrIconLook 
				+ BrLayoutLook linearHorizontal fitContent alignCenterRight;
			icon: BrGlamorousIcons down asElement;
			action: [ self snippet evaluate ]
]

{ #category : #initialization }
GtUrlSnippetLook >> newInEditorToolbar [
	^ BlOverlayElement new
		attachTo: editorElement;
		layout: BlLinearLayout horizontal;
		addChild: self newHorizontalFlexibleSpaceElement;
		addChild: (BrToolbar new
			look: BrToolbarLook + BrLayoutLook new alignCenterRight;
			constraintsDo: [ :c | 
				c vertical matchParent ];
			addChild: self newInEditorButton)
]

{ #category : #initialization }
GtUrlSnippetLook >> newProgressElement [
	^ BlOverlayElement new
		background: Color white;
		addChild: self newProgressIndicatorElement as: #progress;
		look: BrProgressLook;
		viewModel: BrProgressModel new;
		attachTo: editorElement.
]

{ #category : #initialization }
GtUrlSnippetLook >> newProgressIndicatorElement [
	^ BlElement new
		background: (Color blue alpha: 0.2);
		geometry: (BlRectangle cornerRadius: 2);
		margin: (BlInsets top: 3 bottom: 3)
]

{ #category : #initialization }
GtUrlSnippetLook >> newResponseAndVariableElement [
	^ self newHorizontalContainerElement
		margin: (BlInsets top: 3 left: 0 bottom: 0 right: 0);
		addChild: self newResponseElement
			as: self constants responseElementName;
		addChild: self newHorizontalFlexibleSpaceElement;
		addChild: self newVariableElement
			as: self constants variableElementName
]

{ #category : #initialization }
GtUrlSnippetLook >> newResponseElement [
	^ responseElement := BrButton new
			look: BrLabelLook 
				"+ BrGlamorousButtonExteriorLook "
				+ BrLayoutLook linearHorizontal fitContent alignCenterLeft;
			label: 'Response will appear in variable ';
			action: [ self spawnResponse ]
]

{ #category : #initialization }
GtUrlSnippetLook >> newVariableElement [
	variableElement := BrEditorElement new.
	variableElement look: BrGlamorousInputFieldLook.
	variableElement editor: (BrTextEditor new text: self snippet responseVariableName asRopedText).
	variableElement addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key return; build);
			action: [ :aShortcut | self assignNewVariableName ]).
	^ variableElement
]

{ #category : #private }
GtUrlSnippetLook >> notifyUserAboutException: aGtSnippetEvaluatedAnnouncement [ 
	| anErrorMessage |
	anErrorMessage := aGtSnippetEvaluatedAnnouncement result messageText.
	responseElement label: anErrorMessage asString, ' in'.
]

{ #category : #private }
GtUrlSnippetLook >> notifyUserAboutResult: aGtSnippetEvaluatedAnnouncement [ 
	| aContentType aContentLength aUserMessage |
	aContentType := aGtSnippetEvaluatedAnnouncement result contentType asString.
	aContentLength := aGtSnippetEvaluatedAnnouncement result contentLength asString, ' bytes'.
	aUserMessage := aContentType, ', ', aContentLength, ' in'.
	responseElement label: aUserMessage.
]

{ #category : #private }
GtUrlSnippetLook >> registerKeyBindings [
	editorElement 
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key return; build);
			action: [ :aShortcut | self snippet evaluate ])
]

{ #category : #'announcement handling' }
GtUrlSnippetLook >> snippetEvaluated: aGtSnippetEvaluatedAnnouncement [
	result := aGtSnippetEvaluatedAnnouncement result.
	aGtSnippetEvaluatedAnnouncement isException 
		ifTrue: [ self notifyUserAboutException: aGtSnippetEvaluatedAnnouncement ]
		ifFalse: [ self notifyUserAboutResult: aGtSnippetEvaluatedAnnouncement ].
	progressElement viewModel percentage: 0.
]

{ #category : #'announcement handling' }
GtUrlSnippetLook >> snippetProgress: aGtSnippetProgressAnnouncement [
	responseElement label: aGtSnippetProgressAnnouncement asString.
	progressElement viewModel fraction: aGtSnippetProgressAnnouncement fraction.
	self flag: 'remove the wait'.
	0.2 second wait.
]

{ #category : #private }
GtUrlSnippetLook >> spawnResponse [
	self widgetDo: [ :aWidget | 
		aWidget fireEvent: (GtPhlowObjectToSpawn new
				object: result;
				sourceElement: aWidget) ]
]

{ #category : #subscriptions }
GtUrlSnippetLook >> subscribeToSnippet: aGtSnippet [
	super subscribeToSnippet: aGtSnippet.
	aGtSnippet
		subscribe: GtSnippetEvaluatedAnnouncement 
		send: #snippetEvaluated: 
		to: self
		for: self.
	aGtSnippet
		subscribe: GtSnippetProgressAnnouncement 
		send: #snippetProgress: 
		to: self
		for: self
]
