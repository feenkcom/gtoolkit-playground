Class {
	#name : #GEmbeddedPlaygroundStencil,
	#superclass : #BrStencil,
	#instVars : [
		'playPage'
	],
	#category : #'GToolkit-Playground-Snippet - Stencils'
}

{ #category : #'api - instantiation' }
GEmbeddedPlaygroundStencil >> asChildIn: aParentElement [
	| aPlayBookContainer aResizer |
	aPlayBookContainer := self asElement.
	aResizer := self newResizerFor: aPlayBookContainer.
	aParentElement
		addChild: aResizer;
		addChild: aPlayBookContainer.
]

{ #category : #'api - instantiation' }
GEmbeddedPlaygroundStencil >> create [
	<return: #BlElement>
	^ self newPlayBookContainer
			addChild: self newPlayBookElement.
]

{ #category : #private }
GEmbeddedPlaygroundStencil >> ensurePlayBookForObject: anObject [
	playPage ifNotNil: [ ^ self ].
	playPage := GtPlayPage forObject: anObject.
]

{ #category : #'instance creation' }
GEmbeddedPlaygroundStencil >> newPlayBookContainer [
	^ BlElement new
		padding: (BlInsets all: 10);
		layout: BlLinearLayout new;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 0 ]
]

{ #category : #'instance creation' }
GEmbeddedPlaygroundStencil >> newPlayBookElement [
	<return: #BlElement>
	^ self playPage asElement
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		clipChildren: false.
]

{ #category : #'instance creation' }
GEmbeddedPlaygroundStencil >> newResizerFor: aPlaygroundContainer [
	^ GtEmbeddedPlaygroundResizer new
		layout: BlFrameLayout new;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 8.
			c margin: (BlInsets left: 40 right: 40).
			c padding: (BlInsets all: 0) ];
		addChild: self newResizerHandler;
		addEventHandler:
			(BlResizerTopListener new
				resizeTarget: aPlaygroundContainer;
				minimumExtent: 75 @ 0);
		when: BlDoubleClickEvent
			do: [ :e | aPlaygroundContainer height: 0 ]
]

{ #category : #'instance creation' }
GEmbeddedPlaygroundStencil >> newResizerHandler [
	^ BlElement new
		background: ((Color fromHexString: #BDBDBD) alpha: 0.5);
		geometry: (BlRectangle cornerRadius: 2);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 3.
			c frame horizontal weight: 0.2.
			c frame vertical alignTop.
			c frame horizontal alignCenter ]
]

{ #category : #accessing }
GEmbeddedPlaygroundStencil >> playPage [
	self 
		assert: [ playPage isNotNil ]
		description: [ 'PlayPage must be initialized before using it' ].
	^ playPage
]

{ #category : #accessing }
GEmbeddedPlaygroundStencil >> playPage: aPlayBook [
	playPage := aPlayBook
]

{ #category : #accessing }
GEmbeddedPlaygroundStencil >> receiver [
	^ self playPage receiver
]

{ #category : #accessing }
GEmbeddedPlaygroundStencil >> receiver: anObject [
	self ensurePlayBookForObject: anObject.
	self playPage receiver: anObject.
	self playPage xDocLoadSavedContent.
]
