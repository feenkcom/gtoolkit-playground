printing
printOn: aStream
	aStream
		nextPutAll: 'evaluated-code: ';
		nextPutAll: self paint printString