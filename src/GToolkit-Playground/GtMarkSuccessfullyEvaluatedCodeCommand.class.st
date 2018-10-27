Class {
	#name : #GtMarkSuccessfullyEvaluatedCodeCommand,
	#superclass : #GtMarkEvaluatedCodeCommand,
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #execution }
GtMarkSuccessfullyEvaluatedCodeCommand >> execute [
	| aSubText |
	self clearTextAttributes.
	aSubText := self textToStyle.
	aSubText isEmpty ifTrue: [ ^ self ].
	aSubText
		attribute:
			(GtPlaygroundEvaluatedCodeHighlightedAttribute new
				paint: (Color fromHexString: #'90CAF9')).
	aSubText
		attributes:
			{(GtPlaygroundEvaluatedCodeButtonAttribute new
				result: self result;
				paint: (Color fromHexString: #'90CAF9'))}
		from: aSubText size
		to: aSubText size.
	self editor invalidateAll.
	self editor updateAll
]
