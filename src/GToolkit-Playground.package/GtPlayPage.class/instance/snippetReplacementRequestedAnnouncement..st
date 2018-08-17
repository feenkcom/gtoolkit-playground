announcement handling
snippetReplacementRequestedAnnouncement: aGtSnippetReplacementRequestedAnnouncement 
	| anExistingSnippet aNewSnippetClass |
	anExistingSnippet := aGtSnippetReplacementRequestedAnnouncement snippet.
	aNewSnippetClass := aGtSnippetReplacementRequestedAnnouncement requestedSnippetClass.
	self
		assert: [ anExistingSnippet notNil ] 
		description: [ 'Source snippet for new snippet request must be non-nil' ].
	self
		assert: [ aNewSnippetClass notNil ] 
		description: [ 'New snippet class for new snippet request must be non-nil' ].
	self replaceSnippet: anExistingSnippet by: aNewSnippetClass new.