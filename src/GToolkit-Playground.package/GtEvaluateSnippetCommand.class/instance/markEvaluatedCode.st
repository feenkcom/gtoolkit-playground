private
markEvaluatedCode
	| anEditor aSubText |
	anEditor := self snippet editor.
	anEditor hasSelection 
		ifFalse: [ aSubText := anEditor text  ]
		ifTrue: [ aSubText := anEditor text from: anEditor selection from + 1 to: anEditor selection to ].
	aSubText isEmpty ifFalse: [ 
		aSubText attribute: (GtPlaygroundEvaluatedSourceCodeAttribute paint: (Color blue alpha: 0.4)) ].
	anEditor hasSelection 
		ifFalse: [ anEditor updateAll ]
		ifTrue: [ anEditor update: anEditor selection from + 1 to: anEditor selection to ].