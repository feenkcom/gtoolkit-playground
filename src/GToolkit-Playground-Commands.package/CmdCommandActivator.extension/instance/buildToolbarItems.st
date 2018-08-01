*GToolkit-Playground-Commands
buildToolbarItems
	self canExecuteCommand ifFalse: [ ^#() ].	
	^ command buildToolbarItemsUsing: self