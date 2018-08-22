accessing
get: aStringOrZnUrl
	self 
		assert: [ aStringOrZnUrl notNil ] 
		description: [ 'URL must be non-nil' ].
	self client: (ZnClient new
		url: aStringOrZnUrl asZnUrl;
		method: #GET)