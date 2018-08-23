initialization
initializeLook
	super initializeLook.
	self widget addChild: progressElement at: 1 as: self constants progressElementName.
	self widget addChild: inEditorToolbar at: 3.
	self widget addChild: infoElement at: 4.
	self widget addChild: resultElement at: 5 as: self constants resultElementName.
