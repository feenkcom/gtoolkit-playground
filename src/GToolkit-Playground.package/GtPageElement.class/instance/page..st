adding
page: aGtPage
	list dataSource page: aGtPage.
	self flag: 'refactor'.
	aGtPage snippets do: [ :eachSnippet | 
		eachSnippet when: GtSnippetEvaluatedAnnouncement do: [ :announcement | 
			self fireEvent: (
				GLMBlocObjectToSelect new 
					toSelect: announcement result;
					fromElement: self) ] ]