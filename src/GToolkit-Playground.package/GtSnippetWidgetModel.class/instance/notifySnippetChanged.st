notifying
notifySnippetChanged
	self dispatchEvent: (GtSnippetChanged new snippet: self snippet)