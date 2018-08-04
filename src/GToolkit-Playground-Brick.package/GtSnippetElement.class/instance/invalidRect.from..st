drawing cache
invalidRect: aBlBounds from: anElement
	super invalidRect: aBlBounds from: anElement.
	
	self releaseCaches