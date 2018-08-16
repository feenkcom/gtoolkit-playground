notifying
notifyPlaygroundChanged
	self dispatchEvent: (GtPlaygroundChanged new playground: self playground)