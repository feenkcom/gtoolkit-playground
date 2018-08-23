announcement handling
snippetProgress: aGtSnippetProgressAnnouncement
	responseElement label: aGtSnippetProgressAnnouncement asString.
	progressElement viewModel fraction: aGtSnippetProgressAnnouncement fraction.
	self flag: 'remove the wait'.
	0.2 second wait.