notifying
notifyPlayBookChanged
	self dispatchEvent: (GtPlayBookChanged new playBook: self playBook)