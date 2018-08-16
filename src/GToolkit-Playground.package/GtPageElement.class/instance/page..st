adding
page: aGtPage
	list dataSource page: aGtPage.
	aGtPage snippets do: [ :eachSnippet | 
		self registerToSnippet: eachSnippet ]