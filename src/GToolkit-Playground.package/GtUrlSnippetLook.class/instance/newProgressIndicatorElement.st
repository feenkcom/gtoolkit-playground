initialization
newProgressIndicatorElement
	^ BlElement new
		background: (Color blue alpha: 0.2);
		geometry: (BlRectangle cornerRadius: 2);
		margin: (BlInsets top: 3 bottom: 3)