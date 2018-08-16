notifying
notifyPlaygroundChanged
	self dispatchEvent: (GtPlayBookChanged new playground: self playground)