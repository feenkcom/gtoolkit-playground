notifying
notifySnipeptChanged
	self dispatchEvent: (GtSnippetChanged new snippet: self snippet)