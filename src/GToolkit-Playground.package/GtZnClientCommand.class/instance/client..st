accessing
client: aZnClient
	self 
		assert: [ aZnClient notNil ] 
		description: [ 'Zinc client must be non-nil' ].
	client := aZnClient