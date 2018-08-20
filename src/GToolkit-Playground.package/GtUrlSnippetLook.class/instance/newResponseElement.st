initialization
newResponseElement
	^ responseElement := BrButton new
			look: BrLabelLook + BrLayoutLook linearHorizontal fitContent;
			action: [ self spawnResponse ]