hooks
onMouseDown: anElement
	self flag: 'Replace with #mouseDownEvent:'.
	self widgetDo: [
		self widgetContent effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.5)) ]