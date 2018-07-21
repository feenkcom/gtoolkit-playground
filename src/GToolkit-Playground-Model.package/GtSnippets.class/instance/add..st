adding
add: aGtSnippet 
	self 
		assert: [ aGtSnippet notNil ] 
		description: [ 'Only playground snippets can be added' ].
	collection add: aGtSnippet asPlaygroundSnippet