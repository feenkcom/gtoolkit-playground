accessing
sourceCode: aStringOrRope
	self 
		assert: [ aStringOrRope notNil ] 
		description: [ 'The contents should be initialized (a string or rope)' ].

	editor text: aStringOrRope asRopedText