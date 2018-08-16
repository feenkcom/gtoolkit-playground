initialization
initializeListeners
	super initializeListeners.
	
	self when: GtPlayBookChanged do: [ :anEvent | self playBook: anEvent playBook ]