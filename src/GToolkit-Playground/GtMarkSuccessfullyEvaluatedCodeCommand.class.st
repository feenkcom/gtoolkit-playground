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
	aSubText isEmpty
		ifTrue: [ ^ self ].

	aSubText attributes: {
		GtPlaygroundEvaluatedCodeHighlightedAttribute new
			paint: (Color fromHexString: #'90CAF9').
		GtPlaygroundEvaluatedCodeButtonAttribute new
			result: self result;
			paint: (Color fromHexString: #'90CAF9')
	}.

	self editor updater all update
]
