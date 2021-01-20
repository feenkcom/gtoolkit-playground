Class {
	#name : #GtPlaygroundNoMemoryLeaksExamples,
	#superclass : #Object,
	#category : #'GToolkit-Playground-Examples'
}

{ #category : #assertions }
GtPlaygroundNoMemoryLeaksExamples >> assertPanesCount: numberOfExpectedPanes andInitialInstancesComputation: aBlock for: aStep [
	aStep do
		label: 'Clear recorded events';
		action: [ :theScripter | 
			theScripter events collection removeAll ];
		onScripter.

	aStep check 
		label: 'Check number of panes';
		value: [ :aPager | aPager pages size ] equals: numberOfExpectedPanes.

	aStep do
		label: 'Run garbage collection';
		action: [ :aPager | Smalltalk garbageCollect ].

	aStep check 
		label: 'Check instances count decreased';
		satisfies: [ :theScripter | aBlock value <= (theScripter userData at: 'instanceCount') ];
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
			andInitialInstancesComputation: [ self currentInstancesCount ] 
			for: aStep ].

	aScripter syncContinue
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> currentInstancesCount [
	^ self targetClass allInstances size
]

{ #category : #utils }
GtPlaygroundNoMemoryLeaksExamples >> executeFirstSnippetAndAssertNoMemoryLeaksFor: aScripter [
	aScripter substep: 'Execute&inspect first snippet and check for leaks' do: [ :aStep |
		aStep click
			label: 'Click on inspect snippet button';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippetCoder;
			onGtPharoSnippetInspectButton.

		aStep wait forEmptySpaceTaskQueue.

		self 
			assertPanesCount: 2 
			andInitialInstancesComputation: [ self currentInstancesCount ] 
			for: aStep ]
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> firstSnippetCode [
	^ self targetClass name, ' new.'
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
					at: 'instanceCount' put: self currentInstancesCount ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter.
	aScripter substep: 'Evaluate first snippet and inspect' do: [ :aStep |
		aStep click
			label: 'Click on evaluate and inspect button';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippetCoder;
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
					self currentInstancesCount ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet.
	aScripter substep: 'Change first snipper' do: [ :aStep |
		aStep click
			label: 'Click on snippet';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippetCoder;
			onGtPharoSnippetEditor.
		aStep do
			label: 'Change code in snippet';
			action: [ :anEditor | 
				anEditor inserter 
					at: self firstSnippetCode size; 
					string: '1'; 
					insert ];
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippetCoder;
			onGtPharoSnippetEditor;
			onBrTextEditor.
		aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange_ClosePane [
	<gtExample>
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
			andInitialInstancesComputation: [ self currentInstancesCount - 1 ] 
			for: aStep ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange_ClosePane_ExecuteSecondSnippet [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange_ClosePane.
	aScripter substep: 'Evaluate second snippet and inspect' do: [ :aStep |
		aStep click
			label: 'Click on evaluate and inspect button';
			onGtPagerFirstPaneContent;
			onGtPlaygroundSecondSnippetCoder;
			onGtPharoSnippetInspectButton.
		aStep wait forEmptySpaceTaskQueue.
		self 
			assertPanesCount: 2 
			andInitialInstancesComputation: [ self currentInstancesCount ] 
			for: aStep  ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange_ExecuteAgain [
	<gtExample>
	| aScripter |

	aScripter := self playgroundScripter_ExecuteFirstSnippet_CodeAdditionChange.
	self executeFirstSnippetAndAssertNoMemoryLeaksFor: aScripter.

	^ aScripter syncContinue
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeReplacementChange [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteFirstSnippet.
	aScripter substep: 'Change first snippet' do: [ :aStep |
		aStep click
			label: 'Click on snippet';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippetCoder;
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
			onGtPlaygroundFirstSnippetCoder;
			onGtPharoSnippetEditor;
			onBrTextEditor.
		aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteFirstSnippet_CodeReplacementChange_ExecuteAgain [
	<gtExample>
	| aScripter |

	aScripter := self playgroundScripter_ExecuteFirstSnippet_CodeReplacementChange.
	self executeFirstSnippetAndAssertNoMemoryLeaksFor: aScripter.

	^ aScripter syncContinue
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteInPlaceFirstSnippet [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter.
	aScripter substep: 'Evaluate first snippet without inspecting it' do: [ :aStep |
		aStep click
			label: 'Click on evaluat button';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippetCoder;
			onGtPharoSnippetEvaluateButton.
		aStep wait forEmptySpaceTaskQueue.
		aStep check 
			label: 'Check still one pane in pager';
			satisfies: [ :aPager | 
				aPager pages size = 1 ].
		aStep check 
			label: 'Check instances count increased';
			satisfies: [ :theScripter | 
				(theScripter userData at: 'instanceCount') + 1 =
					self currentInstancesCount ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteInPlaceFirstSnippet_CodeAdditionChange [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteInPlaceFirstSnippet.
	aScripter substep: 'Change first snippet' do: [ :aStep |
		aStep click
			label: 'Click on snippet';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippetCoder;
			onGtPharoSnippetEditor.
		aStep do
			label: 'Change code in snippet';
			action: [ :anEditor | 
				anEditor inserter 
					at: self firstSnippetCode size; 
					string: '1'; 
					insert ];
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippetCoder;
			onGtPharoSnippetEditor;
			onBrTextEditor.
		aStep wait forEmptySpaceTaskQueue.
		self 
			assertPanesCount: 1 
			andInitialInstancesComputation: [ self currentInstancesCount ] 
			for: aStep ].
	aScripter syncContinue.
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
