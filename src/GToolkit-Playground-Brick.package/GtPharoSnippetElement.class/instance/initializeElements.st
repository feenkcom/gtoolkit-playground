initialization
initializeElements
	self
		assert: [ editorElement isNil ]
		description: [ 'Editor element must be nil' ].
	editorElement := self newEditorElement: self example.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent.
		"since parent is horizontal, I will take 50% of the available width"
		c linear weight: 0.5 ].