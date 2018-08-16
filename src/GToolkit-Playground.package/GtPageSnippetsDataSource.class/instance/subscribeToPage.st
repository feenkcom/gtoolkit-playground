private - subscriptions
subscribeToPage
	page 
		when: GtPageSnippetAddedAnnoucement 
		send: #snippetAdded: 
		to: self 
		for: self.
	page 
		when: GtPageSnippetRemovedAnnoucement 
		send: #snippetRemoved: 
		to: self 
		for: self.
