initialization
ensureInfoElement
	infoElement hasParent ifTrue: [ ^ self ].
	self widget addChild: infoElement at: 2.