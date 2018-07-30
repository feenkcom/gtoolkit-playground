initialization
initialize
	super initialize.
	self add: BrLayoutLook linearVertical vFitContent hMatchParent.
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	self add: BrShadowLook.