initialization
initialize
	super initialize.
	snippets := GtSnippets new.
	bindings := GtPlaygroundBindings new.
	self addSnippet: GtPharoSnippet new.