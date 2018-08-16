initialization
initializeListeners
	super initializeListeners.
	
	self when: GtPlayBookChanged do: [ :anEvent | self playground: anEvent playground ]