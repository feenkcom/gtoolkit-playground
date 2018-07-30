*GToolkit-Playground-Commands
buildToolbarElements
	<return: #Array of: #BlElement>
	self isActive ifFalse: [ ^#()].
	^ contents flatCollect: [ :each | each buildToolbarElements ]