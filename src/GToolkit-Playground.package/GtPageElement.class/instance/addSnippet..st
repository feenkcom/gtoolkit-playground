adding
addSnippet: aGtSnippet
	list dataSource addSnippet: aGtSnippet.
	aGtSnippet when: GtSnippetEvaluatedAnnouncement do: [ :announcement | 
			self fireEvent: (
				GLMBlocObjectToSelect new 
					toSelect: announcement result;
					fromElement: self).
			self fireEvent: (
				GtPhlowObjectToSpawn new
					object: announcement result;
					sourceElement: self). ]