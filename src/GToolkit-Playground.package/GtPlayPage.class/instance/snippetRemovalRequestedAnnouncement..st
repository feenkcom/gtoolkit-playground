announcement handling
snippetRemovalRequestedAnnouncement: aGtSnippetRemovalRequestedAnnouncement 
	| anSnippet |
	anSnippet := aGtSnippetRemovalRequestedAnnouncement snippet.
	self
		assert: [ anSnippet notNil ] 
		description: [ 'Source snippet for new snippet request must be non-nil' ].
	self removeSnippet: anSnippet.