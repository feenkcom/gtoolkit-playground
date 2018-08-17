initialization
initialize
	super initialize.
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	contentElement := BlElement new.
	contentElement look: BrLayoutLook linearHorizontal vFitContent hMatchParent.
	bottomToolbar := self newBottomToolbarPlusElement
		look: BrLayoutLook linearVertical alignBottomCenter.