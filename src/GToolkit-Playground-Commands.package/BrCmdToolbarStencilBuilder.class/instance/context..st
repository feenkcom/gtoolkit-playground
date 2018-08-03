accessing
context: aCmdToolContext
	self 
		assert: [ aCmdToolContext notNil ] 
		description: [ 'Toolbar tool context must be non-nil' ].
	context := aCmdToolContext