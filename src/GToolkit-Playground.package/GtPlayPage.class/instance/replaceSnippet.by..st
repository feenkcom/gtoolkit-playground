api - adding / removing
replaceSnippet: anExistingGtSnippet by: aNewGtSnippet
	"Replace a snippet by a new one"
	| anIndex |
	self 
		assert: [ anExistingGtSnippet notNil ]
		description: [ 'Existing snippet must be non-nil' ].
	self 
		assert: [ aNewGtSnippet notNil ]
		description: [ 'New snippet must be non-nil' ].
	anIndex := self snippets indexOf: anExistingGtSnippet.
	self snippets at: anIndex put: aNewGtSnippet.
	self detachFromSnippet: anExistingGtSnippet.
	self attachToSnippet: aNewGtSnippet.
	self notifySnippet: anExistingGtSnippet replactedBy: aNewGtSnippet at: anIndex.