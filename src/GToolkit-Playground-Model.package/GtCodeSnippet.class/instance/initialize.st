initialization
initialize
	super initialize.

	editor := BrTextEditor new.
	editor styler: self defaultStyler.

	self sourceCode: ''.
	self variableBindings: GtPlaygroundBindings new.
	self classOrMetaClass: UndefinedObject