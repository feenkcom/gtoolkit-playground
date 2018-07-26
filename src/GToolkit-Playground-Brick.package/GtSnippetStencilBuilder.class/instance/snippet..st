accessing
snippet: aGtSnippet
	self 
		assert: [ aGtSnippet notNil ] 
		description: [ 'Snippet has to be initialized' ].
	snippet := aGtSnippet