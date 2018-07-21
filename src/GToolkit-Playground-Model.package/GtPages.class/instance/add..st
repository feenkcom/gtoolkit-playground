adding
add: aGtPage 
	self 
		assert: [ aGtPage notNil ] 
		description: [ 'Only playground page can be added' ].
	collection add: aGtPage asPlaygroundPage