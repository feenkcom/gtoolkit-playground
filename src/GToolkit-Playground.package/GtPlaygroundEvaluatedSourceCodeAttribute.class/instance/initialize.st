initialization
initialize
	super initialize.
	self action: [ :aText :aCurrentTarget :anEvent | 
		aText clearAttributes: [ :aTextAttribute | self = aTextAttribute ] ].