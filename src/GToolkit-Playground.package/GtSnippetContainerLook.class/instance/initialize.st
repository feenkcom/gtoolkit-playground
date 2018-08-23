initialization
initialize
	super initialize.

	contentElement := BlElement new.
	contentElement look: BrMaterialRoundedLook + BrLayoutLook linearHorizontal vFitContent hMatchParent.
	"contentElement border: (BlBorder paint: LightBorderColor width: 1)."
	"contentElement background: Color white."

	closeButton := self newCloseElement
		viewModel: (BrButtonModel new action: [ self snippetRemoveRequested ]);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c margin: (BlInsets top: -8 right: -8).
			c ignored horizontal alignRight.
			c ignored vertical alignTop ].
	
	bottomToolbar := self newPlusElement
		constraintsDo: [ :c |
			c ignoreByLayout.
			c margin: (BlInsets bottom: -8).
			c ignored horizontal alignCenter.
			c ignored vertical alignBottom ];
		viewModel: (BrButtonModel new action: [ self snippetBelowRequested ]).