initialization
initialize
	super initialize.
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	contentElement := BlElement new.
	contentElement look: BrLayoutLook linearHorizontal vFitContent hMatchParent.
	closeButton := self newCloseElement
		look: BrLayoutLook linearVertical alignTopRight;
		viewModel: (BrButtonModel new action: [ self snippetRemoveRequested ]);
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c ignored vertical alignTop.
			c ignored horizontal alignRight ].
	bottomToolbar := self newPlusElement
		look: BrLayoutLook linearVertical alignBottomCenter;
		viewModel: (BrButtonModel new action: [ self snippetBelowRequested ]).