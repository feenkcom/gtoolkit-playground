announcement handling
snippetProgress: aGtSnippetProgressAnnouncement
	infoElement removeFromParent.
	self ensureProgressElement.
	responseElement label: aGtSnippetProgressAnnouncement asString.
	progressElement viewModel fraction: aGtSnippetProgressAnnouncement fraction.
	0.2 second wait.