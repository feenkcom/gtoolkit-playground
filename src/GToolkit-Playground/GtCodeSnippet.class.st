Class {
	#name : #GtCodeSnippet,
	#superclass : #GtSnippet,
	#instVars : [
		'editor'
	],
	#category : 'GToolkit-Playground-Model'
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
	^ editor
]

{ #category : #initialization }
GtCodeSnippet >> initialize [
	super initialize.
	editor := BrTextEditor new.
	editor styler: self defaultStyler.
	self sourceCode: self defaultSourceCode.
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
	^ editor selectedText asString
]

{ #category : #accessing }
GtCodeSnippet >> sourceCode [
	<return: #String>

	^ editor text asString
]

{ #category : #accessing }
GtCodeSnippet >> sourceCode: aStringOrRope [
	self 
		assert: [ aStringOrRope notNil ] 
		description: [ 'The contents should be initialized (a string or rope)' ].
	editor text: aStringOrRope asRopedText.
]

{ #category : #accessing }
GtCodeSnippet >> text [
	<return: #BlText>
	^ self editor text
]
