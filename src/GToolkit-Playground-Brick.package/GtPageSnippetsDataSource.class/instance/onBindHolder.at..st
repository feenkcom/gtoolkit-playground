instance creation
onBindHolder: anElementHolder at: aPosition
	| aSnippet anElement |
	aSnippet := page snippetAt: aPosition.
	anElement := elements at: aSnippet ifAbsentPut: [ aSnippet asElement ].
	anElementHolder element: anElement