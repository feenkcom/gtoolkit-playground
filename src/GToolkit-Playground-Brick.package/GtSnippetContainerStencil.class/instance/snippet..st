accessing
snippet: aGtSnippet
	self 
		assert: [ aGtSnippet notNil ] 
		description: [ 'Playground snippet has to be initialized' ].
	snippet := aGtSnippet asPlaygroundSnippet