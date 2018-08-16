keyboard handlers
keysPressedEvent: anEvent
	self inform: anEvent printString.
	self action
		cull: anEvent currentTarget text
		cull: anEvent currentTarget
		cull: anEvent