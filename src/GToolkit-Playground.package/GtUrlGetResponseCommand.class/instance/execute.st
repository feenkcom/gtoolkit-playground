execution
execute
	"response := ZnEasy get: self snippet url"
	command 
		get: self snippet url;
		progressBlock: [ :anHTTPProgress | 
			self snippet announce: (GtSnippetProgressAnnouncement fromHTTPProgress: anHTTPProgress) ].
	command execute