*GToolkit-Playground-Commands
gtAccept: aCommandVisitor
	self canExecuteCommand
		ifFalse: [ ^ self ].

	aCommandVisitor visitCommandActivator: self.
	command gtAccept: aCommandVisitor