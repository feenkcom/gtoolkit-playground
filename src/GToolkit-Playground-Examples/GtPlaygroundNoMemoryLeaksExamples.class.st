Class {
	#name : #GtPlaygroundNoMemoryLeaksExamples,
	#superclass : #Object,
	#category : #'GToolkit-Playground-Examples'
}

{ #category : #assertions }
GtPlaygroundNoMemoryLeaksExamples >> assertPanesCount: numberOfExpectedPanes andInstancesComputation: aBlock for: aStep [
	aStep do
		label: 'Clear recorded events';
		action: [ :theScripter | 
			theScripter events collection removeAll ];
		onScripter.
	aStep check 
		label: 'Check number of panes';
		satisfies: [ :aPager | 
			aPager pages size = numberOfExpectedPanes ].
	aStep do
		label: 'Run garbage collection';
		action: [ :aPager | 
			Smalltalk garbageCollect ].
	aStep check 
		label: 'Check instances count decreased';
		satisfies: [ :theScripter | 
			(theScripter userData at: 'instanceCount') = aBlock value ];
		onScripter 
]

{ #category : #utils }
GtPlaygroundNoMemoryLeaksExamples >> closePaneAndAssertNoMemoryLeaksFor: aScripter [
	aScripter substep: 'Close second inpector pane' do: [ :aStep |
		aStep click
			label: 'Click on evaluate all and inspect button';
			onBrPagerSecondPane;
			onGtPagerPaneCloseButton.
		aStep wait forEmptySpaceTaskQueue.
		self 
			assertPanesCount: 1 
			andInstancesComputation: [ self initialInstancesCount ] 
			for: aStep ].
	aScripter syncContinue.
]

{ #category : #utils }
GtPlaygroundNoMemoryLeaksExamples >> executeFirstSnippetAndAssertNoMemoryLeaksFor: aScripter [
	aScripter substep: 'Execute&inspect first snippet and check for leaks' do: [ :aStep |
		aStep click
			label: 'Click on inspect snippet button';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetInspectButton.
		aStep wait forEmptySpaceTaskQueue.
		self 
			assertPanesCount: 2 
			andInstancesComputation: [ self initialInstancesCount ] 
			for: aStep ].
	aScripter syncContinue.
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> firstSnippetCode [
	^ self targetClass name, ' new.'
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> initialInstancesCount [
	^ self targetClass allInstances size
]

{ #category : #'examples - setup' }
GtPlaygroundNoMemoryLeaksExamples >> playgroundElementWithCode [
	<gtExample>
	| book playground |
	book := GtPlayBook newWithCodeSnippetContent: self firstSnippetCode.
	book pages first addSnippet: GtCoderSnippet new.
	book pages last snippets last sourceCode: self secondSnippetCode.
	playground := GtPlayground createOn: book.
	^ playground
]

{ #category : #'examples - setup' }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter [
	<gtExample>
	| aScripter |
	aScripter := BlDevScripter new.
	aScripter substep: 'Initialize Playground' do: [ :aStep |
		aStep set 
			label: 'Initialize Playground Element';
			element: [ self playgroundElementWithCode ].
		aStep do
			label: 'Run garbage collection';
			action: [ :aPager | 
				Smalltalk garbageCollect ].
		aStep do 
			label: 'Set instances count';
			action: [ :theScripter | 
				theScripter userData 
					at: 'instanceCount' put: self initialInstancesCount ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter.
	aScripter substep: 'Evaluate first snippet and inspect' do: [ :aStep |
		aStep click
			label: 'Click on evaluate and inspect button';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetInspectButton.
		aStep wait forEmptySpaceTaskQueue.
		aStep check 
			label: 'Check two panes in pager';
			satisfies: [ :aPager | 
				aPager pages size = 2 ].
		aStep check 
			label: 'Check instances count increased';
			satisfies: [ :theScripter | 
				(theScripter userData at: 'instanceCount') + 1 =
					self initialInstancesCount ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet.
	aScripter substep: 'Change first snipper' do: [ :aStep |
		aStep click
			label: 'Click on snippet';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetEditor.
		aStep do
			label: 'Change code in snippet';
			action: [ :anEditor | 
				anEditor inserter 
					at: self firstSnippetCode size; 
					string: '1'; 
					insert ];
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetEditor;
			onBrTextEditor.
		aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange_ClosePane [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange.
	aScripter substep: 'Close second inpector pane' do: [ :aStep |
		aStep click
			label: 'Click on close pane button';
			onBrPagerSecondPane;
			onGtPagerPaneCloseButton.
		aStep wait forEmptySpaceTaskQueue.
		self 
			assertPanesCount: 1 
			andInstancesComputation: [ self initialInstancesCount - 1 ] 
			for: aStep ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange_ClosePane_ExecuteSecondSnippet [
	<noTest>
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange_ClosePane.
	aScripter substep: 'Evaluate second snippet and inspect' do: [ :aStep |
		aStep click
			label: 'Click on evaluate and inspect button';
			onGtPagerFirstPaneContent;
			onGtPlaygroundSecondSnippet;
			onGtPharoSnippetInspectButton.
		aStep wait forEmptySpaceTaskQueue.
		self 
			assertPanesCount: 2 
			andInstancesComputation: [ self initialInstancesCount ] 
			for: aStep  ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange_ExecuteAgain [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange.
	self executeFirstSnippetAndAssertNoMemoryLeaksFor: aScripter.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeReplacementChange [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet.
	aScripter substep: 'Change first snippet' do: [ :aStep |
		aStep click
			label: 'Click on snippet';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetEditor.
		aStep do
			label: 'Replace code in snippet';
			action: [ :anEditor | 
				anEditor deleter
					from: 0 to: self firstSnippetCode size;
					delete.
				anEditor inserter 
					at: 0; 
					string: '1'; 
					insert ];
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetEditor;
			onBrTextEditor.
		aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeReplacementChange_ExecuteAgain [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet_CodeReplacementChange.
	self executeFirstSnippetAndAssertNoMemoryLeaksFor: aScripter.
	^ aScripter
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> secondSnippetCode [
	^ '2.'
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> targetClass [
	^ GtInspectorExampleObject
]
