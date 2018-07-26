accessing
stencil: aStencil
	self 
		assert: [ aStencil notNil ] 
		description: [ 'Page stencil has to be initialized' ].
	stencil := aStencil