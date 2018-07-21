accessing
snippet: aPlaygroundSnippet
	self 
		assert: [ aPlaygroundSnippet notNil ] 
		description: [ 'Playground snippet has to be initialized' ].
	snippet := aPlaygroundSnippet asPlaygroundSnippet