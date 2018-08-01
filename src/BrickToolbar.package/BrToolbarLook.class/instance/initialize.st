initialization
initialize
	super initialize.
	items := OrderedDictionary new.
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	self add: BrShadowLook.