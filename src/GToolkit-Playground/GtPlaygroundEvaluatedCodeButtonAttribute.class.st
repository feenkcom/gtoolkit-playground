Class {
	#name : #GtPlaygroundEvaluatedCodeButtonAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#instVars : [
		'paint',
		'result',
		'action'
	],
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #accessing }
GtPlaygroundEvaluatedCodeButtonAttribute >> action [
	^ action
]

{ #category : #accessing }
GtPlaygroundEvaluatedCodeButtonAttribute >> action: aBlock [
	action := aBlock
]

{ #category : #initialization }
GtPlaygroundEvaluatedCodeButtonAttribute >> affect: aBrText in: anEditorElement [
	| aButton |
	aButton := BlElement new.
	^ aButton
		size: 6 @ 6;
		margin: (BlInsets top: 6 right: 2 bottom: 0 left: 2);
		background: self paint;
		geometry: BlEllipse new;
		addEventHandlerOn: BlClickEvent do: [ :anEvent | 
			self clickEvent: anEvent from: aButton ];
		yourself
]

{ #category : #'event handling' }
GtPlaygroundEvaluatedCodeButtonAttribute >> clickEvent: anEvent from: aButton [
	self action cull: aButton cull: anEvent
]

{ #category : #initialization }
GtPlaygroundEvaluatedCodeButtonAttribute >> initialize [
	super initialize.
	self beAppend.
	paint := (Color fromHexString: #'90CAF9').
	action := [ :aButton :anEvent | aButton phlow spawnObject: self result ]
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
