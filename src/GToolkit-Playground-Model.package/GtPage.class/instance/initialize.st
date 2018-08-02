initialization
initialize
	super initialize.
	snippets := GtSnippets new.
	bindings := GtPlaygroundBindings new.
	announcer := Announcer new.
	self addSnippet: GtPharoSnippet new.