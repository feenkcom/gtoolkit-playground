initialization
newProgressElement
	^ BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 4.
			c margin: (BlInsets top: 1 bottom: 1) ];
		background: Color transparent;
		geometry: (BlRectangle cornerRadius: 2);
		addChild: self newProgressIndicatorElement as: #progress;
		look: BrProgressLook;
		viewModel: BrProgressModel new.