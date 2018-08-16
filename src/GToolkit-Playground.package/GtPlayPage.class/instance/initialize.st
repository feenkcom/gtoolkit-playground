initialization
initialize
	super initialize.
	snippets := OrderedCollection new.
	bindings := GtPlaygroundBindings new.
	announcer := Announcer new.
	title := 'Page'.
	self addSnippet: GtPharoSnippet new.