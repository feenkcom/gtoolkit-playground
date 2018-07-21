accessing
page: aGtPage
	self 
		assert: [ aGtPage notNil ] 
		description: [ 'Pharo page has to be initialized' ].
	page := aGtPage asPlaygroundPage.