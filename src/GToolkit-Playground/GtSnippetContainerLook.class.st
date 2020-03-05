Class {
	#name : #GtSnippetContainerLook,
	#superclass : #BrLook,
	#instVars : [
		'contentElement',
		'bottomToolbar',
		'snippet',
		'closeButton'
	],
	#pools : [
		'BrGlamorousColors'
	],
	#category : #'GToolkit-Playground-Snippet - Looks'
}

{ #category : #initialization }
GtSnippetContainerLook >> initialize [
	super initialize.
	contentElement := BlElement new.
	contentElement
		look:
			BrMaterialRoundedLook
				+ BrLayoutLook linearHorizontal vFitContent hMatchParent.
	"contentElement border: (BlBorder paint: LightBorderColor width: 1)."
	"contentElement background: Color white."
	closeButton := self newCloseElement
		action: [ self snippetRemoveRequested ];
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c margin: (BlInsets top: -8 right: -8).
			c ignored horizontal alignRight.
			c ignored vertical alignTop ].
	bottomToolbar := self newPlusElement
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c margin: (BlInsets bottom: -8).
			c ignored horizontal alignCenter.
			c ignored vertical alignBottom ];
		action: [ self snippetBelowRequested ].
	self addChangeAddChildAs: #(content) with: [ contentElement ].
	self addChangeAddChildAs: #(bottomToolbar) with: [ bottomToolbar ].
	self addChangeAddChildAs: #(closeButton) with: [ closeButton ].
	self
		addChangeProperty: #(widget background)
		with: [ Color fromHexString: #f0f0f0 ].
	self
		addChangeProperty: #(widget border)
		with: [ BlBorder paint: Color veryLightGray width: 1 ].
	self
		addChangeProperty: #(widget margin)
		with: [ BlInsets
				top: 0
				left: 0
				bottom: 20
				right: 5 ].
	self addChangeProperty: #(widget padding) with: [ BlInsets all: 6 ]
]

{ #category : #initialization }
GtSnippetContainerLook >> initializeListeners [
	super initializeListeners.
	
	self when: GtSnippetChanged do: [ :anEvent | self snippet: anEvent snippet ]
]

{ #category : #initialization }
GtSnippetContainerLook >> initializeRequests [
	super initializeRequests.
	
	self request: GtSnippetRequest new.
]

{ #category : #'instance creation' }
GtSnippetContainerLook >> newCloseElement [
	<return: #BlElement>

	^ GtInspectorRoundButtonStencil small asElement
		icon: (GtInspectorPlusIconStencil close thickness: 0.5; radius: 4; asElement);
		yourself
]

{ #category : #'instance creation' }
GtSnippetContainerLook >> newPlusElement [
	<return: #BlElement>

	^ GtInspectorRoundButtonStencil small asElement
		icon: (GtInspectorPlusIconStencil add thickness: 0.5; radius: 4; asElement);
		yourself
]

{ #category : #accessing }
GtSnippetContainerLook >> snippet [
	^ snippet
]

{ #category : #accessing }
GtSnippetContainerLook >> snippet: aGtSnippet [
	snippet := aGtSnippet.
]

{ #category : #private }
GtSnippetContainerLook >> snippetBelowRequested [
	self snippet ifNil: [ ^ self inform: 'A snippet must be attached' ].
	self snippet requestNewSnippetBelow.
]

{ #category : #private }
GtSnippetContainerLook >> snippetRemoveRequested [
	self snippet ifNil: [ ^ self inform: 'A snippet must be attached' ].
	self snippet requestSnippetRemoval.
]
