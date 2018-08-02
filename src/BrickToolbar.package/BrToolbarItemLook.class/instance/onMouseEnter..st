hooks
onMouseEnter: anElement
	self flag: 'Replace with #mouseEnterEvent:'.
	self widgetDo: [
		self widgetContent effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.1)) ]