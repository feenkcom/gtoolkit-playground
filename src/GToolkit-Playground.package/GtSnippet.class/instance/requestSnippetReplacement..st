api - requests
requestSnippetReplacement: aClass
	self announce: (GtSnippetReplacementRequestedAnnouncement new
		snippet: self;
		requestedSnippetClass: aClass).