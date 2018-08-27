Class {
	#name : #GtPlaygroundExamples,
	#superclass : #Object,
	#category : 'GToolkit-Playground-Examples'
}

{ #category : #'model - updates' }
GtPlaygroundExamples >> addSnippet [
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := self pharoSnippet sourceCode: 'aValue'.
	aPage addSnippet: aSnippet.
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets third equals: aSnippet.
	self assert: anAnnouncements size equals: 1.
	^ aPage
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> addSnippetAtTheBeginning [
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := self pharoSnippet sourceCode: 'aValue'.
	aPage addSnippet: aSnippet at: 1.
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets first equals: aSnippet.
	self assert: anAnnouncements size equals: 1.
	^ aPage
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> addSnippetInTheMiddle [
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := self pharoSnippet sourceCode: 'aValue'.
	aPage addSnippet: aSnippet at: 2.
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets second equals: aSnippet.
	self assert: anAnnouncements size equals: 1.
	^ aPage
]

{ #category : #'model - snippets' }
GtPlaygroundExamples >> collectionSnippet [
	<gtExample>
	<label: 'A Collection snippet'>
	| aSnippet |
	aSnippet := GtCollectionSnippet new.
	self assert: aSnippet availableSnippetClasses notEmpty.
	self assert: aSnippet typeName equals: 'collection'.
	^ aSnippet
]

{ #category : #'ui - model elements' }
GtPlaygroundExamples >> collectionSnippetElement [ 
	<gtExample>
	| anElement |
	anElement := self collectionSnippet asElement.
	self assert: anElement childrenCount equals: 3.
	^ anElement
]

{ #category : #completer }
GtPlaygroundExamples >> completer [
	<gtExample>
	^ self pharoSnippet asElement
]

{ #category : #actions }
GtPlaygroundExamples >> evaluateAndGoPharo [
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
	| aSnippet aResult theAnnouncements |
	theAnnouncements := OrderedCollection new.
	aSnippet := self pharoSnippet.
	aSnippet sourceCode: 'aVariable := 42'.
	aSnippet 
		when: GtSnippetEvaluatedAnnouncement 
		do: [ :anAnnouncement | theAnnouncements add: anAnnouncement ].
	aResult := aSnippet evaluateAndGo.
	self assert: aResult equals: 42.
	self assert: theAnnouncements size equals: 1.
	self assert: theAnnouncements first result equals: 42.
	self assert: theAnnouncements first isException not.
	self assert: theAnnouncements first isSpawnResultRequested.
	^ aSnippet
]

{ #category : #actions }
GtPlaygroundExamples >> evaluatePharo [
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
		| aSnippet aResult theAnnouncements |
	theAnnouncements := OrderedCollection new.
	aSnippet := self pharoSnippet.
	aSnippet sourceCode: 'aVariable := 42'.
	aSnippet 
		when: GtSnippetEvaluatedAnnouncement 
		do: [ :anAnnouncement | theAnnouncements add: anAnnouncement ].
	aResult := aSnippet evaluate.
	self assert: aResult equals: 42.
	self assert: theAnnouncements size equals: 1.
	self assert: theAnnouncements first result equals: 42.
	self assert: theAnnouncements first isException not.
	self assert: theAnnouncements first isSpawnResultRequested not.
	^ aSnippet
]

{ #category : #actions }
GtPlaygroundExamples >> evaluatePharoSnippetWithSelection [
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
		| aSnippet aResult aText |
	aSnippet := self pharoSnippetWithSelection.
	aResult := aSnippet evaluate.
	self assert: aResult equals: 7.
	aText := aSnippet editor selectedText.
	^ aSnippet
]

{ #category : #actions }
GtPlaygroundExamples >> evaluateTwoPharoSnippets [
	<gtExample>
	<label: 'Evaluate Pharo snippets'>
	| aPage aResult |
	aPage := self pageWithTwoDependingPharoSnippets.
	aResult := aPage snippets second evaluate.
	self assert: aResult class equals: MessageNotUnderstood.
	aResult := aPage snippets first evaluate.
	self assert: aResult equals: 42.
	aResult := aPage snippets second evaluate.
	self assert: aResult equals: 63.
	^ aPage
]

{ #category : #actions }
GtPlaygroundExamples >> evaluateUrl [
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
		| aSnippet aResult theAnnouncements |
	theAnnouncements := OrderedCollection new.
	aSnippet := self urlSnippet.
	aSnippet url: 'https://feenk.com'.
	aSnippet 
		when: GtSnippetEvaluatedAnnouncement 
		do: [ :anAnnouncement | theAnnouncements add: anAnnouncement ].
	aResult := aSnippet evaluate.
	self assert: aResult class equals: ZnResponse.
	self assert: theAnnouncements size equals: 1.
	self assert: theAnnouncements first result class equals: ZnResponse.
	self assert: theAnnouncements first isException not.
	self assert: theAnnouncements first isSpawnResultRequested not.
	^ aSnippet
]

{ #category : #todo }
GtPlaygroundExamples >> modrianClassesView [
	<gtExample>
	| aPage | 
	aPage := GtPageElement new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtPharoSnippet new sourceCode: 'classes := Collection withAllSubclasses.').
	aPage addSnippet: (GtPharoSnippet new sourceCode: 'view := GtMondrian new.
view nodes with: classes.
view edges connectFrom: #superclass.
view layout tree nodeDistance: 1.
view').
	^ aPage
]

{ #category : #todo }
GtPlaygroundExamples >> modrianFileSnippetView [
	<gtExample>
	| aPage | 
	aPage := GtPageElement new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (#GtFileSnippet new content: FileLocator workingDirectory fullPath).
	aPage addSnippet: (#GtMondrianSnippet new content: 'mondrian nodes with: files.
mondrian edges connectFrom: #parent.
mondrian layout tree nodeDistance: 1').
	^ aPage
]

{ #category : #todo }
GtPlaygroundExamples >> modrianFilesView [
	<gtExample>
	| aPage | 
	aPage := GtPageElement new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtPharoSnippet new sourceCode: 'files := FileLocation workingDirectory allChildren.').
	aPage addSnippet: (GtPharoSnippet new sourceCode: 'view := GtMondrian new.
view nodes with: files.
view edges connectFrom: #parent.
view layout tree nodeDistance: 1.
view').
	^ aPage
]

{ #category : #todo }
GtPlaygroundExamples >> modrianUrlJsonSnippetView [
	<gtExample>
	| aPage | 
	aPage := GtPageElement new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtUrlSnippet new content: (ZnEasy get: 'http://example.com/file.json')).
	aPage addSnippet: (#GtJsonSnippet new content: '''{"key":"value"}''').	
	aPage addSnippet: (#GtMondrianSnippet new content: 'mondrian nodes with: files.
mondrian edges connectFrom: #parent.
mondrian layout tree nodeDistance: 1').
	^ aPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> page [
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := GtPlayPage new.
	self assert: aPage snippets size equals: 1.
	self assert: aPage snippets first typeName equals: aPage newDefaultSnippet typeName.
	self assert: aPage bindings class equals: GtObjectBindings.
	^ aPage
]

{ #category : #'ui - model elements' }
GtPlaygroundExamples >> pageElementWithManySnippets [ 
	<gtExample>
	^ self pageWithManySnippets asElement
]

{ #category : #'ui - model elements' }
GtPlaygroundExamples >> pageElementWithTwoPharoSnippets [ 
	<gtExample>
	^ self pageWithTwoPharoSnippets asElement
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> pageWithCode [
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := self page.
	aPage snippets first sourceCode: 'aValue := 42.'.
	self assert: aPage snippets first sourceCode equals: 'aValue := 42.'.
	^ aPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> pageWithDefinedReceiver [
	<gtExample>
	| anObject aPlayPage |
	anObject := Object new.
	aPlayPage := GtPlayPage forObject: anObject.
	self assert: aPlayPage bindings receiver equals: anObject.
	^ aPlayPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> pageWithManySnippets [
	<gtExample>
	| aPage | 
	aPage := self page.
	10 timesRepeat: [  
		aPage addSnippet: (GtPharoSnippet new sourceCode: 'aValue := ', 100 atRandom asString ).
		aPage addSnippet: (GtPharoSnippet new sourceCode: 'aValue := aValue + 21 + ', 100 atRandom asString) ].
	self assert: aPage snippets size equals: 21.
	^ aPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> pageWithPharoSnippetWithTwoLinesAndSelectionAtTheEndOfTheFirstLine [
	<gtExample>
	| aPage aPharoSnippet aSourceCode aCursorPosition |
	aPage := self page.
	aPharoSnippet := self pharoSnippet.
	aPage replaceSnippet: aPage snippets first by: aPharoSnippet.
	aSourceCode := self twoLinesPharoSnippetSourceCode.
	aPharoSnippet sourceCode: aSourceCode.
	aCursorPosition := aSourceCode lines first size + 1.
	aPharoSnippet editor moveCursorTo: aCursorPosition.
	self
		assert: aPharoSnippet editor cursor position
		equals: aCursorPosition.
	self assert: aPage snippets size equals: 1.
	self assert: aPage snippets first equals: aPharoSnippet.
	^ aPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> pageWithTwoDependingPharoSnippets [
	<gtExample>
	<label: 'A playground page with two Pharo snippets'>
	| aPage |
	aPage := self page.
	aPage replaceSnippet: aPage snippets first by: (self pharoSnippet sourceCode: 'aValue := 42.').
	aPage addSnippet: (self pharoSnippet sourceCode: 'aValue := aValue + 21').
	self assert: aPage snippets size equals: 2.
	self assert: aPage snippets second sourceCode equals: 'aValue := aValue + 21'.
	^ aPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> pageWithTwoPharoSnippets [
	<gtExample>
	<label: 'A playground page with two Pharo snippets'>
	| aPage |
	aPage := self page.
	aPage snippets first sourceCode: 'aValue := 42.'.
	aPage addSnippet: (self pharoSnippet sourceCode: 'aValue := 72.').
	self assert: aPage snippets size equals: 2.
	self assert: aPage snippets first sourceCode equals: 'aValue := 42.'.
	self assert: aPage snippets second sourceCode equals: 'aValue := 72.'.
	^ aPage
]

{ #category : #'model - snippets' }
GtPlaygroundExamples >> pharoSnippet [
	<gtExample>
	<label: 'A basic Pharo snippet'>
	| aSnippet |
	aSnippet := GtPharoSnippet new.
	self assert: aSnippet sourceCode equals: ''.
	self assert: aSnippet typeName equals: 'pharo'.
	^ aSnippet
]

{ #category : #'ui - model elements' }
GtPlaygroundExamples >> pharoSnippetElementWithCode [ 
	<gtExample>
	| anElement |
	anElement := self pharoSnippetWithCode asElement.
	self assert: anElement childrenCount equals: 1.
	self assert: anElement children first class equals: BrEditorElement.
	self assert: anElement children first editor text asString equals: 'aValue := 42 + 7'.
	^ anElement
]

{ #category : #'model - snippets' }
GtPlaygroundExamples >> pharoSnippetWithCode [
	<gtExample>
	<label: 'A Pharo snippet with a code'>
	| aSnippet |
	aSnippet := self pharoSnippet.
	aSnippet sourceCode: 'aValue := 42 + 7'.
	self assert: aSnippet sourceCode equals: 'aValue := 42 + 7'.
	^ aSnippet
]

{ #category : #'model - snippets' }
GtPlaygroundExamples >> pharoSnippetWithSelection [
	<gtExample>
	<label: 'A Pharo snippet with a code'>
	| aSnippet |
	aSnippet := self pharoSnippetWithCode.
	aSnippet editor select: aSnippet sourceCode size - 1 to: aSnippet sourceCode size.
	self assert: aSnippet selection equals: '7'.
	^ aSnippet
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> playBook [
	<gtExample>
	<label: 'A basic play book'>
	| aPlayBook |
	aPlayBook := GtPlayBook new.
	self assert: aPlayBook pages size equals: 1.
	self assert: aPlayBook pages first snippets size equals: 1.
	self assert: aPlayBook pages first snippets first sourceCode equals: ''.
	self assert: aPlayBook pages first snippets first typeName equals: 'pharo'.
	^ aPlayBook
]

{ #category : #'ui - model elements' }
GtPlaygroundExamples >> playBookElement [
	<gtExample>
	^ self playBook asElement
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> removeSnippetAtTheBeginning [
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := aPage snippets first.
	aPage removeSnippet: aSnippet.
	self assert: aPage snippets size equals: 1.
	self assert: (aPage snippets first = aSnippet) not.
	self assert: anAnnouncements size equals: 1.
	^ aPage
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> requestSnippetBelow [
	<gtExample>
	| aPage anAnnouncements aSnippet theSnippets |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	theSnippets := aPage snippets copy.
	aSnippet := aPage snippets first.
	aSnippet requestNewSnippetBelow.
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets first equals: theSnippets first.
	self assert: (theSnippets includes: aPage snippets second) not.
	self assert: aPage snippets third equals: theSnippets second.
	self assert: anAnnouncements size equals: 1.
	^ aPage
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> requestSnippetRemoval [
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := aPage snippets first.
	aSnippet requestSnippetRemoval.
	self assert: aPage snippets size equals: 1.
	self assert: (aPage snippets first = aSnippet) not.
	self assert: anAnnouncements size equals: 1.
	^ aPage
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> requestSnippetReplacement [
	<gtExample>
	| aPage anAnnouncements aSnippet theSnippets |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	theSnippets := aPage snippets copy.
	aSnippet := aPage snippets first.
	aSnippet requestSnippetReplacement: GtCollectionSnippet.
	self assert: aPage snippets size equals: 2.
	self assert: (aPage snippets first = aSnippet) not.
	self assert: aPage snippets first class equals: GtCollectionSnippet.
	self assert: aPage snippets second equals: theSnippets second.
	self assert: anAnnouncements size equals: 1.
	^ aPage
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> requestSnippetSplit [
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithPharoSnippetWithTwoLinesAndSelectionAtTheEndOfTheFirstLine.
	self assert: aPage snippets size equals: 1.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := aPage snippets first.
	aSnippet requestSnippetSplit.
	self assert: aPage snippets size equals: 2.
	self assert: aPage snippets first equals: aSnippet.
	self assert: (aPage snippets second = aSnippet) not.
	self assert: aPage snippets first class equals: GtPharoSnippet.
	self assert: aPage snippets second class equals: GtPharoSnippet.
	self assert: aPage snippets first sourceCode asString trimRight equals: self twoLinesPharoSnippetSourceCode lines first.
	self assert: aPage snippets second sourceCode equals: self twoLinesPharoSnippetSourceCode lines second.
	self assert: anAnnouncements size equals: 1.
	^ aPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> twoLinesPharoSnippetSourceCode [
	<gtExample>
	^ 'aVariable := 3.
aMultiplication := aVariable * 7'
]

{ #category : #'model - snippets' }
GtPlaygroundExamples >> urlSnippet [
	<gtExample>
	<label: 'A basic URL snippet'>
	| aSnippet |
	aSnippet := GtUrlSnippet new.
	self assert: aSnippet url equals: 'https://feenk.com'.
	self assert: aSnippet typeName equals: 'url'.
	^ aSnippet
]
