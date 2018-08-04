*GToolkit-Playground-Commands
gtAccept: aCommandVisitor
	self isActive
		ifFalse: [ ^ self ].

	aCommandVisitor visitMenuGroup: self.
	contents do: [ :each | each gtAccept: aCommandVisitor ]