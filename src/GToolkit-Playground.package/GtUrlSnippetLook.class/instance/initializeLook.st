initialization
initializeLook
	super initializeLook.
	self widget addChild: progressElement at: 2 as: self constants progressElementName.
	self widget addChild: resultElement at: 3 as: self constants resultElementName