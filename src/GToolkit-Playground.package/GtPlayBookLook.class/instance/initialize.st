initialization
initialize
	super initialize.
	self add: BrLayoutLook linearHorizontal hMatchParent vFitContent.
	playBook := GtPlayBook new.
	tabGroup := BrTabGroup new
		look: BrMaterialTabGroupLook;
		constraintsDo: [ :c | 
			c vertical matchParent. 
			c horizontal matchParent ].
	self updateTabs.