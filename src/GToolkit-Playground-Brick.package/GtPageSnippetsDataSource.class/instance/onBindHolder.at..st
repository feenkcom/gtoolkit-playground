instance creation
onBindHolder: anElementHolder at: aPosition
	| aStencil |
	aStencil := stencils at: aPosition.
	anElementHolder stencil: aStencil