printing
printOn: aStream
	aStream 
		nextPutAll: 'Progress ';
		print: self amount;
		nextPutAll: ' out of ';
		print: self total.