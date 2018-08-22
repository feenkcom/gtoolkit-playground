execution
execute
	"response := ZnEasy get: self snippet url"
	command 
		client: (ZnClient new
			url: self snippet url;
			method: #GET);
		progressBlock: [ :anHTTPProgress | 
			self snippet announce: (GtSnippetProgressAnnouncement fromHTTPProgress: anHTTPProgress) ].
	command execute