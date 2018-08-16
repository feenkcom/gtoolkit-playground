hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: GtPlayBookRequest reply: [ GtPlayBookChanged new playground: self playground ]