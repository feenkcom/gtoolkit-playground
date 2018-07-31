initialization
initializeListeners
	super initializeListeners.
	self
		when: BrToolbarItemContentChanged 
		do: [ :anEvent | self onItemContentChanged: anEvent stencil ]