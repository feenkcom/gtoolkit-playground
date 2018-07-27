accessing
bindingsStrategy: aBindingsStrategy
	self 
		assert: [ aBindingsStrategy notNil ] 
		description: [ 'Bindings strategy must be non-nil' ].
	bindingsStrategy := aBindingsStrategy