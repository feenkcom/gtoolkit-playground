Class {
	#name : #GtPlaygroundDebugExceptionButtonAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#traits : 'TBlEventTarget',
	#classTraits : 'TBlEventTarget classTrait',
	#instVars : [
		'eventDispatcher',
		'result'
	],
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #initialization }
GtPlaygroundDebugExceptionButtonAttribute >> affect: aBrText in: anEditorElement [
	| container textElement text debugButton |
	text := self result printString asRopedText.
	container := BlElement new.
	textElement := BlTextElement new text: text.
	textElement background: (Color red muchLighter alpha: 0.8).
	textElement constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c padding: (BlInsets all: 3).
		c margin: (BlInsets all: 3) ].
	container layout: (BlGridLayout horizontal cellSpacing: 3).
	container addChild: textElement.
	debugButton := BrButton new.
	debugButton look: BrGlamorousButtonExteriorRectangularLook + BrGlamorousButtonLabelLook.
	debugButton label: 'Debug'.
	debugButton action: [ [ self result defaultAction] fork ].
	container addChild: debugButton.
	container constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal fitContent ].
	^ container
]

{ #category : #'event management accessing' }
GtPlaygroundDebugExceptionButtonAttribute >> eventDispatcher [
	"Return an object responsible for event dispatching"
	<return: #BlDirectEventDispatcher>

	^ eventDispatcher
]

{ #category : #initialization }
GtPlaygroundDebugExceptionButtonAttribute >> initialize [
	super initialize.
	
	eventDispatcher := BlBubblingEventDispatcher on: self.
	
	self beAppend
]

{ #category : #accessing }
GtPlaygroundDebugExceptionButtonAttribute >> result [
	^ result
]

{ #category : #accessing }
GtPlaygroundDebugExceptionButtonAttribute >> result: anObject [
	result := anObject
]