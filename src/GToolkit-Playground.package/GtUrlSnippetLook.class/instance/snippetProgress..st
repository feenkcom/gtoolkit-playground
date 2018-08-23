announcement handling
snippetProgress: aGtSnippetProgressAnnouncement
	responseElement label: aGtSnippetProgressAnnouncement asString.
	progressElement viewModel fraction: aGtSnippetProgressAnnouncement fraction.
	0.2 second wait.