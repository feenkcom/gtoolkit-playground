initialization
initialize
	super initialize.
	snippets := GtSnippets new.
	bindings := GtPlaygroundBindings new.
	announcer := Announcer new.
	title := 'Page'.
	self addSnippet: GtPharoSnippet new.