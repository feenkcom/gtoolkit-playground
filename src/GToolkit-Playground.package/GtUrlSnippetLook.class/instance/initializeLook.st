initialization
initializeLook
	super initializeLook.
	self widget addChild: progressElement at: 1 as: self constants progressElementName.
	self widget addChild: infoElement at: 3.
	self widget addChild: resultElement at: 4 as: self constants resultElementName.
