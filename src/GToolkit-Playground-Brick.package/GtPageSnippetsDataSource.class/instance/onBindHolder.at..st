instance creation
onBindHolder: anElementHolder at: aPosition
	| aSnippet aStencilOrElement |
	aSnippet := page snippetAt: aPosition.
	aStencilOrElement := elements at: aSnippet ifAbsentPut: [ Transcript show: aSnippet. aSnippet asElement ].
	anElementHolder stencil: aStencilOrElement