accessing
snippet: aGtSnippet
	self unregisterFromSnippet: snippet.
	snippet := aGtSnippet.
	self registerToSnippet: aGtSnippet.
	self notifySnippetChanged.