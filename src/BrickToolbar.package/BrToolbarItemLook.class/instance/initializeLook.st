initialization
initializeLook
	super initializeLook.
	self flag: 'Refactor hovering and clicking visual feedback to an extra look'.
	self flag: 'Also check https://material.io/design/components/buttons.html#text-button'.
	self widget 
		addEventHandlerOn: BlMouseEnterEvent 
			do: [ :anEvent | self onMouseEnter: anEvent currentTarget ];
		addEventHandlerOn: BlMouseLeaveEvent 
			do: [ :anEvent | self onMouseLeave: anEvent currentTarget ];
		addEventHandlerOn: BlMouseDownEvent 
			do: [ :anEvent | self onMouseDown: anEvent currentTarget ];
		addEventHandlerOn: BlMouseUpEvent 
			do: [ :anEvent | self onMouseEnter: anEvent currentTarget ];
		constraintsDo: [ :c | 
			c padding: (BlInsets all: 3) ]