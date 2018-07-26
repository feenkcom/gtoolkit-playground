accessing
values: aGtSnippets
	self 
		assert: [ aGtSnippets notNil ] 
		description: [ 'Page stencil values should be initialized' ].
	values := aGtSnippets