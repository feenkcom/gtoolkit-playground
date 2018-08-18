private
markEvaluatedCode
	| anEditor aSubText |
	anEditor := self snippet editor.
	anEditor hasSelection 
		ifFalse: [ aSubText := anEditor text  ]
		ifTrue: [ aSubText := anEditor text from: anEditor selection from + 1 to: anEditor selection to ].
	aSubText isEmpty ifFalse: [ 
		aSubText attributes: { 
			(GtPlaygroundEvaluatedCodeHighlightedAttribute paint: (Color fromHexString: #'90CAF9')) .
			(GtPlaygroundEvaluatedCodeButtonAttribute new paint: (Color fromHexString: #'90CAF9'))
		} ].
	anEditor updateAll
"	anEditor hasSelection 
		ifFalse: [ anEditor updateAll ]
		ifTrue: [ anEditor update: anEditor selection from + 1 to: anEditor selection to ]."