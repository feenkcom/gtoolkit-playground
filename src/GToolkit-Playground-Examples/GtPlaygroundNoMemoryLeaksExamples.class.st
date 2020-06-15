Class {
	#name : #GtPlaygroundNoMemoryLeaksExamples,
	#superclass : #Object,
	#category : #'GToolkit-Playground-Examples'
}

{ #category : #'examples - setup' }
GtPlaygroundNoMemoryLeaksExamples >> playgroundElementWithCode [
	<gtExample>
	| book playground |
	book := GtPlayBook newWithCodeSnippetContent: 'GtInspectorExampleObject new.'.
	playground := GtPlayground createOn: book.
	^ playground
]

{ #category : #'examples - setup' }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter [
	<gtExample>
	| aScripter |
	aScripter := BlDevScripter new.
	aScripter do
		label: 'Run garbage collection';
		action: [ :aPager | 
			Smalltalk garbageCollect ].
	aScripter do 
		label: 'Set instances count';
		action: [ :theScripter | 
			theScripter userData 
				at: 'instanceCount' put: GtInspectorExampleObject allInstances size ];
		onScripter.
	aScripter set 
		label: 'Initialize Playground Element';
		element: [ self playgroundElementWithCode ].
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
		aStep do
			label: 'Clear recorded events';
			action: [ :theScripter | 
				theScripter events collection removeAll ];
			onScripter.
		aStep check 
			label: 'Check two panes in pager';
			satisfies: [ :aPager | 
				aPager pages size = 2 ].
		aStep check 
			label: 'Check instances count increased';
			satisfies: [ :theScripter | 
				(theScripter userData at: 'instanceCount') + 1 =
					GtInspectorExampleObject allInstances size  ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll_ChangeCode [
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
				anEditor deleter from: 0 to: 29; delete.
				anEditor inserter at: 0; string: '1'; insert ];
			onGtPagerFirstPaneContent;
			onGtPlaygroundFirstSnippet;
			onGtPharoSnippetEditor;
			onBrTextEditor.
		aStep wait forEmptySpaceTaskQueue.
		aStep check 
			label: 'Check two panes';
			satisfies: [ :aPager | 
				aPager pages size = 2 ].
		aStep check 
			label: 'Check instances count remains same';
			satisfies: [ :theScripter | 
				(theScripter userData at: 'instanceCount') + 1 =
					GtInspectorExampleObject allInstances size  ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll_ChangeCode_ClosePane [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteAll_ChangeCode.
	aScripter substep: 'Close inpector pane' do: [ :aStep |
		aStep click
			label: 'Click on evaluate all and inspect button';
			onGtPagerSecondPaneContent;
			onGtPagerPaneCloseButton.
		aStep wait forEmptySpaceTaskQueue.
		aStep check 
			label: 'Check one pane';
			satisfies: [ :aPager | 
				aPager pages size = 1 ].
		aStep do
			label: 'Run garbage collection';
			action: [ :aPager | 
				Smalltalk garbageCollect ].
		aStep check 
			label: 'Check instances count decreased';
			satisfies: [ :theScripter | 
				(theScripter userData at: 'instanceCount') =
					GtInspectorExampleObject allInstances size  ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]

{ #category : #examples }
GtPlaygroundNoMemoryLeaksExamples >> playgroundScripter_ExecuteAll_ChangeCode_ExecuteAgain [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self playgroundScripter_ExecuteAll_ChangeCode.
	aScripter substep: 'Close inpector pane' do: [ :aStep |
		aStep click
			label: 'Click on Evaluate all button';
			onBrPagerFirstPane;
			onGtPlaygroundPlayAllButton.
		aStep wait forEmptySpaceTaskQueue.
		aStep check 
			label: 'Check still two panes';
			satisfies: [ :aPager | 
				aPager pages size = 2 ].
		aStep do
			label: 'Clear recorded events';
			action: [ :theScripter | 
				theScripter events collection removeAll.
				Smalltalk garbageCollect ];
			onScripter.
		aStep do
			label: 'Run garbage collection';
			action: [ :aPager | 
				Smalltalk garbageCollect ].
		aStep check 
			label: 'Check instances count decreased';
			satisfies: [ :theScripter | 
				(theScripter userData at: 'instanceCount') =
					GtInspectorExampleObject allInstances size  ];
			onScripter ].
	aScripter syncContinue.
	^ aScripter
]
