execution
execute
	| aSubText |
	self editor hasSelection 
		ifFalse: [ aSubText := self editor text  ]
		ifTrue: [ aSubText := self editor text from: self editor selection from + 1 to: self editor selection to ].
	aSubText isEmpty ifTrue: [ ^ self ].
	aSubText 
		attribute: (GtPlaygroundEvaluatedCodeHighlightedAttribute 
			paint: (Color fromHexString: #'90CAF9')).
	aSubText 	
		attributes: {(GtPlaygroundEvaluatedCodeButtonAttribute new 
			result: self result;
			paint: (Color fromHexString: #'90CAF9'))}
		from: aSubText size
		to: aSubText size.
	self editor invalidateAll.
	self editor updateAll.