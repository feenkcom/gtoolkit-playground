accessing
snippet: aGtSnippet
	self 
		assert: [ aGtSnippet notNil ] 
		description: [ 'Snippet must be non-nil' ].
	snippet := aGtSnippet