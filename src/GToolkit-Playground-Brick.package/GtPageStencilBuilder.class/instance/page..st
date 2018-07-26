accessing
page: aGtPage
	self 
		assert: [ aGtPage notNil ] 
		description: [ 'Playground page has to be initialized' ].
	page := aGtPage.