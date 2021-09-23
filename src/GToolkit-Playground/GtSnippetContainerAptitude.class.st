Class {
	#name : 'GtSnippetContainerAptitude',
	#superclass : 'BrAptitude',
	#instVars : [
		'bottomToolbar',
		'snippet',
		'closeButton'
	],
	#pools : [
		'BrGlamorousColors'
	],
	#category : 'GToolkit-Playground-Snippet - Looks'
}

{ #category : 'initialization' }
GtSnippetContainerAptitude >> initialize [
	super initialize.
		
	closeButton := self newCloseElement
		action: [ self snippetRemoveRequested ];
		elevation: (BlRelativeElevation elevation: 10);
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c ignored horizontal alignRight.
			c ignored vertical alignTop.
			c margin: (BlInsets top: 4 right: 4) ].
		
	bottomToolbar := self newPlusElement
		action: [ self snippetBelowRequested ];
		elevation: (BlRelativeElevation elevation: 10);
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c ignored horizontal alignCenter.
			c ignored vertical alignBottom.
			c margin: (BlInsets bottom: 4) ].

	self addChangeAddChildAs: { GtSnippetRemoveButtonId asSymbol } with: [ closeButton ].
	self addChangeAddChildAs: { GtSnippetAddButtonId asSymbol } with: [ bottomToolbar ].
	
	self addChangeProperty: #(widget padding) with: [ BlInsets all: 12 ]
]

{ #category : 'initialization' }
GtSnippetContainerAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: GtSnippetChanged do: [ :anEvent | self snippet: anEvent snippet ]
]

{ #category : 'initialization' }
GtSnippetContainerAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: GtSnippetRequest new.
]

{ #category : 'instance creation' }
GtSnippetContainerAptitude >> newCloseElement [
	<return: #BlElement>

	^ GtInspectorRoundButtonStencil small asElement
		icon: (BrPlusIconStencil close thickness: 1; radius: 4; asElement);
		yourself
]

{ #category : 'instance creation' }
GtSnippetContainerAptitude >> newPlusElement [
	<return: #BlElement>

	^ GtInspectorRoundButtonStencil small asElement
		icon: (BrPlusIconStencil add thickness: 1; radius: 4; asElement);
		yourself
]

{ #category : 'accessing' }
GtSnippetContainerAptitude >> snippet [
	^ snippet
]

{ #category : 'accessing' }
GtSnippetContainerAptitude >> snippet: aGtSnippet [
	snippet := aGtSnippet.
]

{ #category : 'private' }
GtSnippetContainerAptitude >> snippetBelowRequested [
	self snippet ifNil: [ ^ self inform: 'A snippet must be attached' ].
	self snippet requestNewSnippetBelow.
]

{ #category : 'private' }
GtSnippetContainerAptitude >> snippetRemoveRequested [
	self snippet ifNil: [ ^ self inform: 'A snippet must be attached' ].
	self snippet requestSnippetRemoval.
]
