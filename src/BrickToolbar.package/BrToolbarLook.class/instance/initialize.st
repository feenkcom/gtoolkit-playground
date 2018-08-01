initialization
initialize
	super initialize.
	items := OrderedDictionary new.
	self add: (BrLayoutLook linearHorizontal hMatchParent vFitContent alignCenterLeft
		constraintsDo: [ :c | 
			c padding: (BlInsets top: 3 bottom: 3).
			c margin: (BlInsets all: 5) ]).
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	self add: BrShadowLook.