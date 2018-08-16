accessing
variableBindings: aGtBindingsTrait
	self 
		assert: [ aGtBindingsTrait notNil ] 
		description: [ 'Variable bindings must be non-nil' ].

	editor styler workspace bindings: aGtBindingsTrait