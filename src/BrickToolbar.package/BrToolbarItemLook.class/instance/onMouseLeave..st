hooks
onMouseLeave: anElement
	self flag: 'Replace with #mouseLeaveEvent:'.
	self widgetDo: [
		self widgetContent effect: (BlNullEffect new) ]