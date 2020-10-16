Class {
	#name : #GtPlaygroundEvaluatedCodeButtonAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#instVars : [
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
	| aButton |
	
	aButton := BrButton new.

	^ aButton
		look: (
			(BrInteractiveCommonLook new
				default: [ :aWidget | aWidget background: BrGlamorousColors defaultButtonBorderColor ];
				hovered: [ :aWidget | aWidget background: BrGlamorousColors hoveredButtonBorderColor ])
			+ 
		
		((BrGlamorousWithTooltipLook2 content: [
			| aContainer |
			aContainer := BlElement new
				layout: BlFrameLayout new;
				constraintsDo: [ :c |
					c horizontal fitContent.
					c vertical fitContent ];
				when: GtPhlowObjectToSpawn do: [ :anEvent | aButton fireEvent: (GtPhlowObjectToSpawn new
					previousSpawnEvent: anEvent;
					object: anEvent object;
					sourceElement: anEvent target) ].
			(self result gtViewsFor: GtPhlowEmptyView new) asElementDo: [ :anInspectorElement |
				aContainer addChild: ((anInspectorElement exact: 400@400) asScalableElement size: 200@200)
			] ]) showDelay: 200 milliSeconds));
		size: 8@8;
		geometry: BlEllipse new;
		margin: (BlInsets left: 2 right: 2);
		action: [ :aButtonElement :aButtonModel :anEvent | self clickEvent: anEvent from: aButtonElement ];
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
	action := [ :aButton :anEvent | aButton phlow spawnObject: self result ]
]

{ #category : #testing }
GtPlaygroundEvaluatedCodeButtonAttribute >> mayHaveExternalReferences [
	^ true
]

{ #category : #accessing }
GtPlaygroundEvaluatedCodeButtonAttribute >> result [
	^ result
]

{ #category : #accessing }
GtPlaygroundEvaluatedCodeButtonAttribute >> result: anObject [
	result := anObject
]
