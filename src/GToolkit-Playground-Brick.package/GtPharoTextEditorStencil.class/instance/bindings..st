accessing
bindings: aGtBindingsTrait
	self 
		assert: [ aGtBindingsTrait notNil ] 
		description: [ 'Bindings must be non-nil' ].
	bindingsStrategy bindings: aGtBindingsTrait