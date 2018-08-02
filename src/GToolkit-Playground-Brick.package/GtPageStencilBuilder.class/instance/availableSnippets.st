accessing
availableSnippets
	^ GtSnippet allSubclasses reject: [ :eachClass | 
			eachClass isAbstract ]