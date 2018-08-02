instance creation
onBindHolder: anElementHolder at: aPosition
	| aSnippet |
	aSnippet := page snippetAt: aPosition.
	anElementHolder stencil: aSnippet