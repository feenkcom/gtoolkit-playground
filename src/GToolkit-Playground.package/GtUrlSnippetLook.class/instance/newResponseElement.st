initialization
newResponseElement
	^ responseElement := BrButton new
			look: BrLabelLook 
				"+ BrGlamorousButtonExteriorLook "
				+ BrLayoutLook linearHorizontal fitContent alignCenterLeft;
			label: '';
			action: [ self spawnResponse ]