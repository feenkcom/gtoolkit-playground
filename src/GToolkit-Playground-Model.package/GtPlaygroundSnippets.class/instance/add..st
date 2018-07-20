adding
add: aGtPlaygroundSnippet 
	self 
		assert: [ aGtPlaygroundSnippet notNil ] 
		description: [ 'Only playground snippets can be added' ].
	collection add: aGtPlaygroundSnippet asPlaygroundSnippet