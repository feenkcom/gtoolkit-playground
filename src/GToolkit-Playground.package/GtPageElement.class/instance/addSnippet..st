adding
addSnippet: aGtSnippet
	list dataSource addSnippet: aGtSnippet.
	aGtSnippet when: GtSnippetEvaluatedAnnouncement do: [ :announcement | 
			self fireEvent: (
				GLMBlocObjectToSelect new 
					toSelect: announcement result;
					fromElement: self) ]