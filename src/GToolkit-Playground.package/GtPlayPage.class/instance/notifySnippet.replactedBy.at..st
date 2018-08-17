notifying
notifySnippet: anOldGtSnippet replactedBy: aNewGtSnippet at: anIndex
	self announce: (GtPageSnippetReplacedAnnoucement new 
		page: self; 
		snippet: aNewGtSnippet; 
		previousSnippet: anOldGtSnippet;
		index: anIndex)