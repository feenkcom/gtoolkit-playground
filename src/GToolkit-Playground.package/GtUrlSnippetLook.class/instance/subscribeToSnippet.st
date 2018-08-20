subscriptions
subscribeToSnippet
	self snippet
		subscribe: GtSnippetEvaluatedAnnouncement 
		send: #snippetEvaluated: 
		to: self
		for: self