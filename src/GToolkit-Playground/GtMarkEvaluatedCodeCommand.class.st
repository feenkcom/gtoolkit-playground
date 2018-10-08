Class {
	#name : #GtMarkEvaluatedCodeCommand,
	#superclass : #GtTextEditorCommand,
	#instVars : [
		'result'
	],
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #execution }
GtMarkEvaluatedCodeCommand >> execute [
	| aSubText |
	self editor text clearAttributes: [ :each | 
		(each isKindOf: GtPlaygroundEvaluatedCodeHighlightedAttribute) or: [ 
			each isKindOf: GtPlaygroundEvaluatedCodeButtonAttribute ] ]. 
	self editor hasSelection 
		ifFalse: [ aSubText := self editor text  ]
		ifTrue: [ aSubText := self editor text from: self editor selection from + 1 to: self editor selection to ].
	aSubText isEmpty ifTrue: [ ^ self ].
	aSubText 
		attribute: (GtPlaygroundEvaluatedCodeHighlightedAttribute new
			paint: (Color fromHexString: #'90CAF9')).
	aSubText 	
		attributes: {(GtPlaygroundEvaluatedCodeButtonAttribute new 
			result: self result;
			paint: (Color fromHexString: #'90CAF9'))}
		from: aSubText size
		to: aSubText size.
	self editor invalidateAll.
	self editor updateAll.
]

{ #category : #accessing }
GtMarkEvaluatedCodeCommand >> result [
	"Return a command execution result"
	<return: #Object>
	^ result
]

{ #category : #accessing }
GtMarkEvaluatedCodeCommand >> result: anObject [
	result := anObject
]
