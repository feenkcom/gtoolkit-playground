hooks
onMouseDown: anElement
	self widgetDo: [
		self widgetContent effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.5)) ]