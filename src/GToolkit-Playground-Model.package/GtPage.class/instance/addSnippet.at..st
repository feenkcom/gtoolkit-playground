api - adding / removing
addSnippet: aGtSnippet at: anIndex
	"Add a playground snippet"
	self 
		assert: [ aGtSnippet notNil ]
		description: [ 'Snippet must be non-nil' ].
	aGtSnippet bindings: self bindings.
	self snippets insert: aGtSnippet at: anIndex.
	self notifySnippetAdded: aGtSnippet at: anIndex.