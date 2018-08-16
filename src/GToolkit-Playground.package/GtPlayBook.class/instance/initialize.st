initialization
initialize
	super initialize.
	pages := OrderedCollection new.
	self addPlayPage: GtPlayPage new.