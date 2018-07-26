accessing
child: aStencil
	self 
		assert: [ aStencil notNil ] 
		description: [ 'Child stencil has to be initialized' ].
	child := aStencil