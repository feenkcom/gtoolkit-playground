hooks
onMouseLeave: anElement
	self widgetDo: [
		self widgetContent effect: (BlNullEffect new) ]