hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: GtPlaygroundRequest reply: [ GtPlaygroundChanged new playground: self playground ]