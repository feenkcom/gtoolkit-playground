initialization
ensureProgressElement
	progressElement hasParent ifTrue: [ ^ self ].
	self widget addChild: progressElement at: 2 as: self constants progressElementName.