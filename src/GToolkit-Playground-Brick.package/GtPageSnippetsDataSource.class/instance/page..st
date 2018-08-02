adding
page: aGtPage
	page ifNotNil: [ self unsubscribeFromPage ].
	page := aGtPage.
	self subscribeToPage.