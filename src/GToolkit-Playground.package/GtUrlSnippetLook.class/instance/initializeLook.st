initialization
initializeLook
	super initializeLook.
	self ensureInfoElement.
	self widget addChild: resultElement at: 3 as: self constants resultElementName.
