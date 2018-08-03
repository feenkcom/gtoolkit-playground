accessing
activationClass: aCmdCommandActivationStrategy
	self 
		assert: [ aCmdCommandActivationStrategy notNil ] 
		description: [ 'Toolbar activation class must be non-nil' ].
	activationClass := aCmdCommandActivationStrategy