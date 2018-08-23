initialization
newInEditorButton
	^ BrButton new
			look: BrIconLook 
				+ BrLayoutLook linearHorizontal fitContent alignCenterRight;
			icon: BrGlamorousIcons down asElement;
			action: [ self snippet evaluate ]