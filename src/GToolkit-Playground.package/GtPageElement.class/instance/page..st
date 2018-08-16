adding
page: aGtPage
	list dataSource page: aGtPage.
	self flag: 'refactor'.
	aGtPage snippets do: [ :eachSnippet | 
		eachSnippet when: GtSnippetEvaluatedAnnouncement do: [ :announcement | 
			self fireEvent: (
				GLMBlocObjectToSelect new 
					toSelect: announcement result;
					fromElement: self).
			self fireEvent: (
				GtPhlowObjectToSpawn new
					object: announcement result;
					sourceElement: self). ] ]