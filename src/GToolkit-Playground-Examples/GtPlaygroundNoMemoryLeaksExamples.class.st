Class {
	#name : #GtPlaygroundNoMemoryLeaksExamples,
	#superclass : #Object,
	#category : #'GToolkit-Playground-Examples'
}

{ #category : #assertions }
GtPlaygroundNoMemoryLeaksExamples >> assertPanesCount: numberOfExpectedPanes andNoMemoryLeakFor: aStep [
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
			(theScripter userData at: 'instanceCount') =
				self targetInstancesCount ];
		onScripter 
]

{ #category : #utils }
GtPlaygroundNoMemoryLeaksExamples >> closePaneAndAssertNoMemoryLeaksFor: aScripter [
	aScripter substep: 'Close inpector pane' do: [ :aStep |
		aStep click
			label: 'Click on evaluate all and inspect button';
			onBrPagerSecondPane;
			onGtPagerPaneCloseButton.
		aStep wait forEmptySpaceTaskQueue.
		self assertPanesCount: 1 andNoMemoryLeakFor: aStep ].
	aScripter syncContinue.
]

{ #category : #utils }
GtPlaygroundNoMemoryLeaksExamples >> executeAllAndAssertNoMemoryLeaksFor: aScripter [
	aScripter substep: 'Evaluate all and check for leaks' do: [ :aStep |
		aStep click
			label: 'Click on Evaluate all button';
			onBrPagerFirstPane;
			onGtPlaygroundPlayAllButton.
		aStep wait forEmptySpaceTaskQueue.
		self assertPanesCount: 2 andNoMemoryLeakFor: aStep ].
	aScripter syncContinue.
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> playgroundCode [
	^ self targetClass name, ' new.'
]

{ #category : #'examples - setup' }
GtPlaygroundNoMemoryLeaksExamples >> playgroundElementWithCode [
	<gtExample>
	| book playground |
	book := GtPlayBook newWithCodeSnippetContent: self playgroundCode.
	playground := GtPlayground createOn: book.
	^ playground
]

{ #category : #'examples - setup' }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter [
	<gtExample>
	| aScripter |
	aScripter := BlDevScripter new.
	aScripter set 
		label: 'Initialize Playground Element';
		element: [ self playgroundElementWithCode ].
	aScripter do
		label: 'Run garbage collection';
		action: [ :aPager | 
			Smalltalk garbageCollect ].
	aScripter do 
		label: 'Set instances count';
		action: [ :theScripter | 
			theScripter userData 
				at: 'instanceCount' put: self targetInstancesCount ];
		onScripter.
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter.
	aScripter substep: 'Evaluate all and inspect' do: [ :aStep |
		aStep click
			label: 'Click on evaluate all and inspect button';
			onGtPagerFirstPaneContent;
			onGtPlaygroundPlayAllButton.
		aStep wait forEmptySpaceTaskQueue.
		aStep check 
			label: 'Check two panes in pager';
			satisfies: [ :aPager | 
				aPager pages size = 2 ].
		aStep check 
			label: 'Check instances count increased';
			satisfies: [ :theScripter | 
				(theScripter userData at: 'instanceCount') + 1 =
					self targetInstancesCount ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll_CodeAdditionChange [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteAll.
	aScripter substep: 'Change code' do: [ :aStep |
		aStep click
			label: 'Click on snippet';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetEditor.
		aStep do
			label: 'Change code in snippet';
			action: [ :anEditor | 
				anEditor inserter 
					at: self playgroundCode size; 
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
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll_CodeAdditionChange_ClosePane [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteAll_CodeAdditionChange.
	self closePaneAndAssertNoMemoryLeaksFor: aScripter.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll_CodeAdditionChange_ExecuteAgain [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteAll_CodeAdditionChange.
	self executeAllAndAssertNoMemoryLeaksFor: aScripter.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll_CodeReplacementChange [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteAll.
	aScripter substep: 'Change code' do: [ :aStep |
		aStep click
			label: 'Click on snippet';
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetEditor.
		aStep do
			label: 'Replace code in snippet';
			action: [ :anEditor | 
				anEditor deleter
					from: 0 to: self playgroundCode size;
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
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll_CodeReplacementChange_ExecuteAgain [
	<gtExample>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteAll_CodeReplacementChange.
	self executeAllAndAssertNoMemoryLeaksFor: aScripter.
	^ aScripter
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> targetClass [
	^ GtInspectorExampleObject
]

{ #category : #accessing }
GtPlaygroundNoMemoryLeaksExamples >> targetInstancesCount [
	^ self targetClass allInstances size
]
