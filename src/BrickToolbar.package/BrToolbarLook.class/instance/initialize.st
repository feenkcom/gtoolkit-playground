initialization
initialize
	super initialize.
	items := OrderedDictionary new.
	self flag: 'Material look should not be used in a general looks. Material looks should use general looks'.
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	self add: BrShadowLook.