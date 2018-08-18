initialization
initialize
	super initialize.
	
	eventDispatcher := BlBubblingEventDispatcher on: self.
	
	self beAppend