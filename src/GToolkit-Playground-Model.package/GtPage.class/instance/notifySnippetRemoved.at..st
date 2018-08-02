notifying
notifySnippetRemoved: aGtSnippet at: anIndex
	self announce: (GtPageSnippetRemovedAnnoucement new page: self; snippet: aGtSnippet; index: anIndex)