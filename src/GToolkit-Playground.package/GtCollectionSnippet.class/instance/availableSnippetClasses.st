accessing
availableSnippetClasses
	^ GtSnippet allSubclasses select: [ :eachClass | 
			eachClass isUserSnippet ]