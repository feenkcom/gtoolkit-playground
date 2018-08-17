announcement handling
snippetBelowRequestedAnnouncement: aGtSnippetBelowRequestedAnnouncement 
	| anSnippet anIndex |
	anSnippet := aGtSnippetBelowRequestedAnnouncement snippet.
	self
		assert: [ anSnippet notNil ] 
		description: [ 'Source snippet for new snippet request must be non-nil' ].
	anIndex := self snippets indexOf: anSnippet.
	self addSnippet: self newDefaultSnippet at: anIndex + 1.