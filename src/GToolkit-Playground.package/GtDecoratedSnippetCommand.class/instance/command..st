accessing
command: aGtCommand
	self 

		assert: [ aGtCommand notNil ] 
		description: [ 'Command to execute must be non-nil' ].
	command := aGtCommand