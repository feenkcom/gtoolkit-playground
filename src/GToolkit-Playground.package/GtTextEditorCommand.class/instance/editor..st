accessing
editor: aBrTextEditor
	self
		assert: [ aBrTextEditor notNil ]
		description: [ 'Text editor must be non-nil' ].
	editor := aBrTextEditor