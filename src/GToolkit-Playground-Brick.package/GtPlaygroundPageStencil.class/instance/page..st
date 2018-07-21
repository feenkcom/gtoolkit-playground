accessing
page: aGtPlaygroundPage
	self 
		assert: [ aGtPlaygroundPage notNil ] 
		description: [ 'Pharo page has to be initialized' ].
	page := aGtPlaygroundPage asPlaygroundPage.