initialization
initialize
	super initialize.

	editor := BrTextEditor new.
	editor styler: self defaultStyler.

	self content: ''.
	self bindings: GtPlaygroundBindings new.
	self classOrMetaClass: UndefinedObject