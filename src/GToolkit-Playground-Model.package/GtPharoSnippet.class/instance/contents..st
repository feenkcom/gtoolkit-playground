accessing
contents: aStringOrRope
	self 
		assert: [ aStringOrRope notNil ] 
		description: [ 'The contents should be initialized (a string or rope)' ].
	contents := aStringOrRope asRopedText