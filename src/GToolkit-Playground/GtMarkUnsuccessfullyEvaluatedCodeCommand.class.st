Class {
	#name : #GtMarkUnsuccessfullyEvaluatedCodeCommand,
	#superclass : #GtMarkEvaluatedCodeCommand,
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #'api - execution' }
GtMarkUnsuccessfullyEvaluatedCodeCommand >> execute [
	| aSubText |
	self clearTextAttributes.
	aSubText := self textToStyle.
	aSubText isEmpty ifTrue: [ ^ self ].
	aSubText
		attribute:
			(GtPlaygroundEvaluatedCodeHighlightedAttribute new
				paint: (Color red)).
	aSubText
		attributes:
			{(GtPlaygroundEvaluatedCodeButtonAttribute new
				result: self result;
				paint: (Color red))}
		from: aSubText size
		to: aSubText size.
	self editor invalidateAll.
	self editor updateAll
]
