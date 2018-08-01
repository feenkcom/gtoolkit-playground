initialization
initializeLook
	super initializeLook.
	self widgetDo: [ 
		self widget 
			addEventHandlerOn: BlMouseEnterEvent do: [ :anEvent | self onMouseEnter: anEvent target ];
			addEventHandlerOn: BlMouseLeaveEvent do: [ :anEvent | self onMouseLeave: anEvent target ];
			addEventHandlerOn: BlMouseDownEvent do: [ :anEvent | self onMouseDown: anEvent target ];
			addEventHandlerOn: BlMouseUpEvent do: [ :anEvent | self onMouseEnter: anEvent target ];
			constraintsDo: [ :c | 
				c padding: (BlInsets all: 3) ] ]