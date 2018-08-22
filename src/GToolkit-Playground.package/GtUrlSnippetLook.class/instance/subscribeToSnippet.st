subscriptions
subscribeToSnippet
	self snippet
		subscribe: GtSnippetEvaluatedAnnouncement 
		send: #snippetEvaluated: 
		to: self
		for: self.
	self snippet
		subscribe: GtSnippetProgressAnnouncement 
		send: #snippetProgress: 
		to: self
		for: self