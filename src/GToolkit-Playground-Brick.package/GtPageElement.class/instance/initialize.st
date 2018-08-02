initialization
initialize
	super initialize.
	list := GtPageSnippetsElement new.
	list constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	self addChild: list as: #list.