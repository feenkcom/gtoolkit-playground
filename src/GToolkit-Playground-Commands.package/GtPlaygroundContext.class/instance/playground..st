accessing
playground: aGtPlayground
	self 
		assert: [ aGtPlayground notNil ] 
		description: [ 'Playground must be non-nil' ].
	self tool: aGtPlayground