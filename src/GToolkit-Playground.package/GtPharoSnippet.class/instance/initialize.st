initialization
initialize
	super initialize.
	self variableBindings: GtPlaygroundBindings new.
	self classOrMetaClass: UndefinedObject