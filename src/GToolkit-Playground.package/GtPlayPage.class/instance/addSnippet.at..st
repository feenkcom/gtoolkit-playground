api - adding / removing
addSnippet: aGtSnippet at: anIndex
	"Add a playground snippet"
	self 
		assert: [ aGtSnippet notNil ]
		description: [ 'Snippet must be non-nil' ].
	self 
		assert: [ anIndex > 0 and: [ anIndex <= (self snippets size + 1) ] ]
		description: [ 'Insert index ', anIndex asString, ' is out of bounds' ].
	aGtSnippet variableBindings: self bindings.
	self subscribeToSnippet: aGtSnippet.
	self snippets add: aGtSnippet beforeIndex: anIndex.
	self notifySnippetAdded: aGtSnippet at: anIndex.