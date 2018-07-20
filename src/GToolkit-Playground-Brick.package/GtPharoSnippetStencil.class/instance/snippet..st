accessing
snippet: aGtPharoSnippet
	self 
		assert: [ aGtPharoSnippet notNil ] 
		description: [ 'Pharo snippet has to be initialized' ].
	snippet := aGtPharoSnippet asPlaygroundSnippet