Class {
	#name : #GtSnippetReplacementRequestedAnnouncement,
	#superclass : #GtSnippetAnnoucement,
	#instVars : [
		'requestedSnippetClass'
	],
	#category : #'GToolkit-Playground-Announcements'
}

{ #category : #accessing }
GtSnippetReplacementRequestedAnnouncement >> requestedSnippetClass [
	^ requestedSnippetClass
]

{ #category : #accessing }
GtSnippetReplacementRequestedAnnouncement >> requestedSnippetClass: anObject [
	requestedSnippetClass := anObject
]
