initialization
initializeListeners
	super initializeListeners.
	
	self when: GtPlaygroundChanged do: [ :anEvent | self playground: anEvent playground ]