initialization
newResponseElement
	^ responseElement := BrButton new
			look: BrLabelLook + BrLayoutLook linearHorizontal fitContent;
			label: '';
			action: [ self spawnResponse ]