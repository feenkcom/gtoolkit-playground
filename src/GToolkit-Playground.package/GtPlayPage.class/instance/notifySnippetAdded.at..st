notifying
notifySnippetAdded: aGtSnippet at: anIndex
	self announce: (GtPageSnippetAddedAnnoucement new page: self; snippet: aGtSnippet; index: anIndex)