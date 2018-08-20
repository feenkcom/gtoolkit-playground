initialization
initializeListeners
	super initializeListeners.
	
	self when: GtSnippetChanged do: [ :anEvent | self snippet: anEvent snippet ]