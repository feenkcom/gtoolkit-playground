accessing
variableBindings: aGtBindingsTrait
	self 
		assert: [ aGtBindingsTrait notNil ] 
		description: [ 'Variable bindings must be non-nil' ].

	variableBindings := aGtBindingsTrait.