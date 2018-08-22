private
notifyUserAboutException: aGtSnippetEvaluatedAnnouncement 
	| anErrorMessage |
	anErrorMessage := aGtSnippetEvaluatedAnnouncement result messageText.
	responseElement label: anErrorMessage asString, ' in'.