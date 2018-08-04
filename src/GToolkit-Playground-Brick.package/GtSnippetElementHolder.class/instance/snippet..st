api - accessing
snippet: aGtSnippet
	"Change the snippet behind the snippet element.
	Snippet must be of the same type as the type if a snippet element"
	self
		assert: [ aGtSnippet snippetType = snippetType ]
		description: [ 'Must bind the same snippet type' ].

	snippetType stencilBuilder bind: aGtSnippet to: itemElement