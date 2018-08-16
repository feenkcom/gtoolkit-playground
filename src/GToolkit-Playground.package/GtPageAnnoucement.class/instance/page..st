accessing
page: aGtPage
	self 
		assert: [ aGtPage notNil ] 
		description: [ 'Playground page must be non-nil' ].
	page := aGtPage