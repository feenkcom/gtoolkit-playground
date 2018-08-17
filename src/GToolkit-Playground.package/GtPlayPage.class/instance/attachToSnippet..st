announcement registration
attachToSnippet: aGtSnippet
	aGtSnippet variableBindings: self bindings.
	aGtSnippet
		subscribe: GtSnippetBelowRequestedAnnouncement
			send: #snippetBelowRequestedAnnouncement:
			to: self
			for: self;
		subscribe: GtSnippetRemovalRequestedAnnouncement
			send: #snippetRemovalRequestedAnnouncement:
			to: self
			for: self;
		subscribe: GtSnippetReplacementRequestedAnnouncement
			send: #snippetReplacementRequestedAnnouncement:
			to: self
			for: self