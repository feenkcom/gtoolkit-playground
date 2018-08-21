initialization
initialize
	super initialize.
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	contentElement := BlElement new.
	contentElement look: BrLayoutLook linearHorizontal vFitContent hMatchParent.
	closeButton := self newCloseElement
		viewModel: (BrButtonModel new action: [ self snippetRemoveRequested ]);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c margin: (BlInsets top: -4 left: 0 bottom: 0 right: -4).
			c ignored horizontal alignRight.
			c ignored vertical alignTop ].
	bottomToolbar := self newPlusElement
		look: BrLayoutLook linearVertical alignBottomCenter;
		viewModel: (BrButtonModel new action: [ self snippetBelowRequested ]).