"
1. Playground
Playground is the place to play with live code.

In the snippet below we see a simple example. If you evaluate the code with `PrimaryModifier+G`, you will get an inspector with the resulting object to the right. 

{{gtExample:GtPlaygroundExamples>>#pageWithCode|noCode|previewShow=#gtLiveFor:|previewHeight=100}}
1. # Snippets

Playgrounds can have multiple snippets. Each snippet provides a scope and allows you to manipulate the code in isolation from the rest of the code. At the same time, the overall page still behaves like one contiguous page sharing the same set of variables.

For example, in the page below we have two snippets. Evaluating the first one, initializes `aValue` with `42`. Evaluating the second snippet increases the value.

{{gtExample:GtPlaygroundExamples>>#pageWithTwoDependingPharoSnippets|noCode|previewShow=#gtLiveFor:|previewHeight=200}}
1. # Usages

The Playground is a versatile tool with many different kinds of applications. See a couple of them below.
1. ## Code queries

Any Playground is a code query box. For example, in the example below, inspect the result of the query.

{{gtExample:GtPlaygroundExamples>>#pageWithCodeQuery|noCode=|previewShow=#gtLiveFor:|previewHeight=100}}
1. ## Data exploration

Snippets are useful in various situations. For example, when analyzing data, we often want to retrieve the data and then to visualize it. These are different activities that benefit from distinct snippets. The playground below provides such a case.

{{gtExample:GtPlaygroundExamples>>#pageWithClassesAndMondrianView|noCode|previewShow=#gtLiveFor:|previewHeight=300}}



"
Class {
	#name : #BaselineOfGToolkitPlayground,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitPlayground
}

{ #category : #baseline }
BaselineOfGToolkitPlayground >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec postLoadDoIt: #'postLoadInitializeSettings:'.
		spec 
			baseline: 'GToolkitPager' with: [
				spec repository: 'github://feenkcom/gtoolkit-pager:main/src' ];
			baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter:main/src' ];
			baseline: 'GToolkitCompleter' with: [
				spec repository: 'github://feenkcom/gtoolkit-completer:main/src' ];
			baseline: 'GToolkit4Pharo' with: [
				spec repository: 'github://feenkcom/gt4pharo:main/src' ];
			baseline: 'GToolkitExamples' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:main/src' ];
			baseline: 'XdocClient' with: [
				spec repository: 'github://feenkcom/xdoc:main/src' ].
		spec 
			package: 'GToolkit-Playground' with: [
				spec requires: #('GToolkitPager' 'GToolkitCompleter' 'GToolkit4Pharo' ). ];
			package: 'GToolkit-Playground-XDoc' with: [
				spec requires: #('GToolkit-Playground' 'XdocClient' 'GToolkitExamples' 'GToolkitSpotter' ). ];
			package: 'GToolkit-Playground-Examples' with: [
				spec requires: #('GToolkitExamples' 'GToolkit-Playground' ). ]. ].

]

{ #category : #'post load' }
BaselineOfGToolkitPlayground >> postLoadInitializeSettings: spec [
	Smalltalk 
		at: #XdPlaygroundSettings 
		ifPresent: [ :aClass | aClass initializeSettings ]
]
