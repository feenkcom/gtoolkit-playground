Class {
	#name : #GtPlaygroundEvaluatedCodeButtonAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#traits : 'TBlEventTarget',
	#classTraits : 'TBlEventTarget classTrait',
	#instVars : [
		'eventDispatcher',
		'paint',
		'result'
	],
	#category : 'GToolkit-Playground-Commands'
}

{ #category : #initialization }
GtPlaygroundEvaluatedCodeButtonAttribute >> affect: aBrText in: anEditorElement [
	| aButton |
	aButton := BlElement new.
	^ aButton
		size: 6 @ 6;
		margin:
			(BlInsets
				top: 6
				right: 2
				bottom: 0
				left: 2);
		background: self paint;
		geometry: BlEllipse new;
		addEventHandlerOn: BlClickEvent do: [ :anEvent | 
			aButton fireEvent: (GtPhlowObjectToSpawn new 
				object: result;
				sourceElement: aButton) ];
		yourself
]

{ #category : #'event management accessing' }
GtPlaygroundEvaluatedCodeButtonAttribute >> eventDispatcher [
	"Return an object responsible for event dispatching"
	<return: #BlDirectEventDispatcher>

	^ eventDispatcher
]

{ #category : #initialization }
GtPlaygroundEvaluatedCodeButtonAttribute >> initialize [
	super initialize.
	
	eventDispatcher := BlBubblingEventDispatcher on: self.
	
	self beAppend
]

{ #category : #accessing }
GtPlaygroundEvaluatedCodeButtonAttribute >> paint [
	^ paint
]

{ #category : #accessing }
GtPlaygroundEvaluatedCodeButtonAttribute >> paint: anObject [
	paint := anObject
]

{ #category : #accessing }
GtPlaygroundEvaluatedCodeButtonAttribute >> result [
	^ result
]

{ #category : #accessing }
GtPlaygroundEvaluatedCodeButtonAttribute >> result: anObject [
	result := anObject
]
