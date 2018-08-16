api - adding / removing
removeSnippet: aGtSnippet
	"Remove a playground snippet"
	| anIndex |
	self 
		assert: [ aGtSnippet notNil ]
		description: [ 'Snippet must be non-nil' ].
	anIndex := self snippets indexOf: aGtSnippet.
	self snippets remove: aGtSnippet at: anIndex.
	aGtSnippet variableBindings: GtNoBindings uniqueInstance.
	self notifySnippetRemoved: aGtSnippet at: anIndex.