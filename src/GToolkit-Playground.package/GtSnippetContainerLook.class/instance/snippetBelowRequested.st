private
snippetBelowRequested
	self snippet ifNil: [ ^ self inform: 'A snippet must be attached' ].
	self snippet requestNewSnippetBelow.
	self inform: 'Requested'.