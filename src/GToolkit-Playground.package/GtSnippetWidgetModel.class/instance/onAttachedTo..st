hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: GtSnippetRequest reply: [ GtSnippetChanged new snippet: self snippet ].
	self registerToSnippet: self snippet.