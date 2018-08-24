Class {
	#name : #GtPageAnnoucement,
	#superclass : #Announcement,
	#traits : 'GtAssertingTrait',
	#classTraits : 'GtAssertingTrait classTrait',
	#instVars : [
		'page'
	],
	#category : 'GToolkit-Playground-Announcements'
}

{ #category : #accessing }
GtPageAnnoucement >> page [
	<return: #GtPlayPage>
	^ page
]

{ #category : #accessing }
GtPageAnnoucement >> page: aGtPage [
	self 
		assert: [ aGtPage notNil ] 
		description: [ 'Playground page must be non-nil' ].
	page := aGtPage
]
