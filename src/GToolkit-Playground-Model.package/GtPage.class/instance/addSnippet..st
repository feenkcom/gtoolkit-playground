api - adding / removing
addSnippet: aGtSnippet 
	"Add a playground snippet"
	aGtSnippet bindings: self bindings.
	self snippets add: aGtSnippet.
	self notifySnippetAdded: aGtSnippet at: self snippets size.