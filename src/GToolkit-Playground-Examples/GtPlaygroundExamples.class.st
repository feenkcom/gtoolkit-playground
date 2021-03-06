Class {
	#name : #GtPlaygroundExamples,
	#superclass : #Object,
	#category : #'GToolkit-Playground-Examples'
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
	self assert: anElement childrenCount > 1.
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
	<noTest>
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
	<noTest>
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
	<noTest>
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
	<noTest>
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

{ #category : #'model - page and book' }
GtPlaygroundExamples >> page [
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := GtPlayPage newDefault.
	self assert: aPage snippets size equals: 1.
	self assert: aPage snippets first typeName equals: aPage newDefaultSnippet typeName.
	self assert: aPage bindings class equals: GtSnippetBindings.
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

{ #category : #todo }
GtPlaygroundExamples >> pageWithClassesAndMondrianView [
	<gtExample>
	| aPage | 
	aPage := aPage := self page.
	aPage replaceSnippet: aPage snippets first by: (self pharoSnippet sourceCode: 'classes := BrStencil withAllSubclasses.').
	aPage addSnippet: (self pharoSnippet sourceCode: 'view := GtMondrian new.
view nodes with: classes.
view edges connectFrom: #superclass.
view layout tree nodeDistance: 1.
view').
	^ aPage
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

{ #category : #todo }
GtPlaygroundExamples >> pageWithCodeQuery [
	<gtExample>
	| aPage | 
	aPage := aPage := self page.
	aPage replaceSnippet: aPage snippets first by: (self pharoSnippet sourceCode: '#gtView gtPragmas & #list gtReferences').
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

{ #category : #todo }
GtPlaygroundExamples >> pageWithFilesAndMondrianPharoSnippets [
	<gtExample>
	| aPage | 
	aPage := GtPageElement new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtCoderSnippet new sourceCode: 'files := FileLocation workingDirectory allChildren.').
	aPage addSnippet: (GtCoderSnippet new sourceCode: 'view := GtMondrian new.
view nodes with: files.
view edges connectFrom: #parent.
view layout tree nodeDistance: 1.
view').
	^ aPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> pageWithManySnippets [
	<gtExample>
	| aPage | 
	aPage := self page.
	10 timesRepeat: [  
		aPage addSnippet: (GtCoderSnippet new sourceCode: 'aValue := ', 100 atRandom asString ).
		aPage addSnippet: (GtCoderSnippet new sourceCode: 'aValue := aValue + 21 + ', 100 atRandom asString) ].
	self assert: aPage snippets size equals: 21.
	^ aPage
]

{ #category : #'model - page and book' }
GtPlaygroundExamples >> pageWithPharoSnippetWithTwoLinesAndSelectionAtTheEndOfTheFirstLine [
	<gtExample>
	<noTest>
	| aPage aPharoSnippet aSourceCode aCursorPosition |
	aPage := self page.
	aPharoSnippet := self pharoSnippet.
	aPage replaceSnippet: aPage snippets first by: aPharoSnippet.
	aSourceCode := self twoLinesPharoSnippetSourceCode.
	aPharoSnippet sourceCode: aSourceCode.
	aCursorPosition := aSourceCode lines first size + 1.
	aPharoSnippet editor moveCursorTo: aCursorPosition.
	self
		assert: (aPharoSnippet editor cursor allCursors collect: #position)
		equals: { aCursorPosition }.
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
	aSnippet := GtCoderSnippet new.
	self assert: aSnippet sourceCode equals: ''.
	self assert: aSnippet typeName equals: GtCoderSnippet typeName.
	^ aSnippet
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
	<noTest>
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
	aPlayBook := GtPlayBook newDefault.
	self assert: aPlayBook pages size equals: 1.
	self assert: aPlayBook pages first snippets size equals: 1.
	self assert: aPlayBook pages first snippets first sourceCode equals: ''.
	self assert: aPlayBook pages first snippets first typeName equals: GtCoderSnippet typeName.
	^ aPlayBook
]

{ #category : #'ui - model elements' }
GtPlaygroundExamples >> playBookElement [
	<gtExample>
	^ self playBook asElement
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> playBookSourceCodeChangedAnnouncementOnCodeDeletion [
	<gtExample>
	<noTest>
	| aPlayBook anAnnouncements aSnippet |
	aPlayBook := self playBook.
	anAnnouncements := OrderedCollection new.
	aPlayBook when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := aPlayBook pages first snippets first.
	aSnippet sourceCode: '1234'.
	aSnippet editor deleter from: 2 to: 4; delete.
	self assert: anAnnouncements size equals: 1.
	self assert: anAnnouncements first class equals: GtPageSnippetChangedAnnouncement.
	^ aPlayBook
]

{ #category : #'model - updates' }
GtPlaygroundExamples >> playBookSourceCodeChangedAnnouncementOnCodeInsertion [
	<gtExample>
	<noTest>
	| aPlayBook anAnnouncements aSnippet |
	aPlayBook := self playBook.
	anAnnouncements := OrderedCollection new.
	aPlayBook when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := aPlayBook pages first snippets first.
	aSnippet editor inserter atEnd; string: '"comment"'; insert.
	self assert: anAnnouncements size equals: 1.
	self assert: anAnnouncements first class equals: GtPageSnippetChangedAnnouncement.
	^ aPlayBook
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
GtPlaygroundExamples >> requestSnippetMerge [
	<gtExample>
	<noTest>
	| aPage anAnnouncements aSnippet theSnippets |
	aPage := self requestSnippetSplit.
	self assert: aPage snippets size equals: 2.
	anAnnouncements := OrderedCollection new.
	theSnippets := aPage snippets copy.
	aSnippet := aPage snippets second.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet requestSnippetMerge.
	self assert: aPage snippets size equals: 1.
	self assert: aPage snippets first equals: theSnippets first.
	self assert: (aPage snippets first = aSnippet) not.
	self assert: aPage snippets first class equals: GtCoderSnippet.
	self assert: aPage snippets first sourceCode equals: self twoLinesPharoSnippetSourceCode.
	self assert: anAnnouncements size equals: 3.
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
	<noTest>
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
	self assert: aPage snippets first class equals: GtCoderSnippet.
	self assert: aPage snippets second class equals: GtCoderSnippet.
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
