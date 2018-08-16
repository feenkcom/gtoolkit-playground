adding
addPlayPage: aGtPlayPage
	self 
		assert: [ aGtPlayPage notNil ] 
		description: [ 'Play page must be non-nil' ].
	pages addLast: aGtPlayPage