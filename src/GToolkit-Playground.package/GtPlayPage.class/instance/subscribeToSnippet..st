announcement registration
subscribeToSnippet: aGtSnippet
	aGtSnippet 
		subscribe: GtSnippetBelowRequestedAnnouncement 
			send: #snippetBelowRequestedAnnouncement: 
			to: self 
			for: self;
		subscribe: GtSnippetRemovalRequestedAnnouncement 
			send: #snippetRemovalRequestedAnnouncement: 
			to: self 
			for: self