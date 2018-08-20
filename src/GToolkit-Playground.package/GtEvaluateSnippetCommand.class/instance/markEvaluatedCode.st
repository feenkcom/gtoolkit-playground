private
markEvaluatedCode
	| anEditor aSubText |
	anEditor := self snippet editor.
	anEditor hasSelection 
		ifFalse: [ aSubText := anEditor text  ]
		ifTrue: [ aSubText := anEditor text from: anEditor selection from + 1 to: anEditor selection to ].
	aSubText isEmpty ifFalse: [ 
		aSubText attribute: (GtPlaygroundEvaluatedCodeHighlightedAttribute paint: (Color fromHexString: #'90CAF9')) ].
	aSubText 	
		attributes: {(GtPlaygroundEvaluatedCodeButtonAttribute new 
			result: result;
			paint: (Color fromHexString: #'90CAF9'))}
		from: aSubText size
		to: aSubText size.
	anEditor updateAll.
	anEditor invalidateAll