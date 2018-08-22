instance creation
fromHTTPProgress: anHTTPProgress
	^ self new
		amount: anHTTPProgress amount;
		total: anHTTPProgress total