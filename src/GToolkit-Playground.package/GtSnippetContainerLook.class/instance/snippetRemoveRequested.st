private
snippetRemoveRequested
	self snippet ifNil: [ ^ self inform: 'A snippet must be attached' ].
	self snippet requestSnippetRemoval.