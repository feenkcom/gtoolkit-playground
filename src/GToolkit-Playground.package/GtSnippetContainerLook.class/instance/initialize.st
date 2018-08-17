initialization
initialize
	super initialize.
	self add: BrLayoutLook linearHorizontal vFitContent hMatchParent.
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	"self add: BrShadowLook."