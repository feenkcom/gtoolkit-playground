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
GtPlaygroundEvaluatedCodeButtonAttribute >> affect: aTBrTextEditorTextualPiece in: anEditorElement [
	<return: #BlElement>

	^ BlElement new
		size: 6 @ 6;
		background: self paint;
		geometry: BlEllipse new;
		when: BlClickEvent do: [ :anEvent |
			anEvent consumed: true.
			self clickEvent: anEvent from: anEvent currentTarget ];
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
