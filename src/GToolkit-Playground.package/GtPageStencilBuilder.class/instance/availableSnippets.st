accessing
availableSnippets
	^ GtSnippet allSubclasses select: [ :eachClass | 
			eachClass isUserSnippet ]