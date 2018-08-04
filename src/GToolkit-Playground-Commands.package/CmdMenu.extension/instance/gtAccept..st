*GToolkit-Playground-Commands
gtAccept: aCommandVisitor
	aCommandVisitor visitMenu: self.
	rootGroup gtAccept: aCommandVisitor