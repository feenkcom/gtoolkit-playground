adding
add: aGtPlaygroundPage 
	self 
		assert: [ aGtPlaygroundPage notNil ] 
		description: [ 'Only playground page can be added' ].
	collection add: aGtPlaygroundPage asPlaygroundPage