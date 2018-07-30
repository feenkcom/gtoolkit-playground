*GToolkit-Playground-Commands
buildToolbarElements
	self canExecuteCommand ifFalse: [ ^#() ].	
	^ command buildToolbarElementsUsing: self