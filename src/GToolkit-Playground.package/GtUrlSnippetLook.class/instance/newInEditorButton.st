initialization
newInEditorButton
	^ BrButton new
			look: BrIconLook 
				+ BrLayoutLook linearHorizontal fitContent alignCenterRight;
			icon: #down asIcon asElement;
			action: [ self snippet evaluate ]