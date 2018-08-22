initialization
newResponseElement
	^ responseElement := BrButton new
			look: BrLabelLook 
				"+ BrGlamorousButtonExteriorLook "
				+ BrLayoutLook linearHorizontal fitContent alignCenterLeft;
			label: 'Response will appear in variable ';
			action: [ self spawnResponse ]