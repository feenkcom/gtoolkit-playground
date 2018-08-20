private
notifyUserAboutResult: aGtSnippetEvaluatedAnnouncement 
	| aContentType aContentLength aUserMessage |
	aContentType := aGtSnippetEvaluatedAnnouncement result contentType asString.
	aContentLength := aGtSnippetEvaluatedAnnouncement result contentLength asString, ' bytes'.
	aUserMessage := aContentType, ', ', aContentLength.
	responseElement label: aUserMessage.