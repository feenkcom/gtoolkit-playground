accessing
snippet: aGtSnippet
	self
		assert: [ aGtSnippet notNil ] 
		description: [ 'Snippet must be non-nil' ].
	requestor := aGtSnippet.
	self sourceCode: aGtSnippet sourceCode.
	self variableBindings: aGtSnippet variableBindings.