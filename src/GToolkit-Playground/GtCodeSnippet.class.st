Class {
	#name : #GtCodeSnippet,
	#superclass : #GtSnippet,
	#category : #'GToolkit-Playground-Model'
}

{ #category : #testing }
GtCodeSnippet class >> isAbstract [
	^ self name = #GtCodeSnippet 
]

{ #category : #initialization }
GtCodeSnippet >> defaultSourceCode [
	^ ''
]

{ #category : #initialization }
GtCodeSnippet >> defaultStyler [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtCodeSnippet >> editor [
	self halt.
	^ nil
]

{ #category : #'announcement handling' }
GtCodeSnippet >> handleEditorChanges: anAnnouncement [
	self announce: (GtPageSnippetChangedAnnouncement new snippet: self)
]

{ #category : #initialization }
GtCodeSnippet >> initialize [
	super initialize.
	self sourceCode: self defaultSourceCode.
	self subscribeToEditorChanges.
]

{ #category : #notifying }
GtCodeSnippet >> notifyAboutResult: aResult exception: isExceptionBoolean spawn: wantsToSpawn [
	self
		announce:
			(GtSnippetEvaluatedAnnouncement new
				snippet: self;
				result: aResult;
				isException: isExceptionBoolean;
				isSpawnResultRequested: wantsToSpawn)
]

{ #category : #accessing }
GtCodeSnippet >> selection [
	^ ''
]

{ #category : #accessing }
GtCodeSnippet >> sourceCode [
	<return: #String>

	^ ''
]

{ #category : #accessing }
GtCodeSnippet >> sourceCode: aStringOrRope [
	self 
		assert: [ aStringOrRope notNil ] 
		description: [ 'The contents should be initialized (a string or rope)' ].
	
]

{ #category : #subscriptions }
GtCodeSnippet >> subscribeToEditorChanges [
	"editor 
		addEventHandlerOn: BrTextEditorInsertedEvent 
		do: [ :anEvent | self handleEditorChanges: anEvent ].
	editor 
		addEventHandlerOn: BrTextEditorDeletedEvent 
		do: [ :anEvent | self handleEditorChanges: anEvent ].
"
]

{ #category : #accessing }
GtCodeSnippet >> text [
	<return: #BlText>
	^ '' asRopedText
]
