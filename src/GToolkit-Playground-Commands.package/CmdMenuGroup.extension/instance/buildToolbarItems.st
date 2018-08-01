*GToolkit-Playground-Commands
buildToolbarItems
	<return: #Array of: #BlElement>
	self isActive ifFalse: [ ^#()].
	^ contents flatCollect: [ :each | each buildToolbarItems ]