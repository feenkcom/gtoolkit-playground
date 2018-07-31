initialization
initialize
	super initialize.
	items := OrderedDictionary new.
	self add: (BrLayoutLook linearHorizontal
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ]).
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	self add: BrShadowLook.