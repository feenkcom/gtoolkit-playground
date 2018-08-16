hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: GtPlayBookRequest reply: [ GtPlayBookChanged new playBook: self playBook ]