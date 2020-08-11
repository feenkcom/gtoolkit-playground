"
!Playground
Playground is the place to play with live code.

In the snippet below we see a simple example. If you evaluate the code with ==PrimaryModifier+G==, you will get an inspector with the resulting object to the right. 

${example:GtPlaygroundExamples>>#pageWithCode|noCode|previewShow=#gtLiveFor:|previewHeight=100}$
!!Snippets
Playgrounds can have multiple snippets. Each snippet provides a scope and allows you to manipulate the code in isolation from the rest of the code. At the same time, the overall page still behaves like one contiguous page sharing the same set of variables.

For example, in the page below we have two snippets. Evaluating the first one, initializes ==aValue== with ==42==. Evaluating the second snippet increases the value.

${example:GtPlaygroundExamples>>#pageWithTwoDependingPharoSnippets|noCode|previewShow=#gtLiveFor:|previewHeight=200}$
!!Usages
The Playground is a versatile tool with many different kinds of applications. See a couple of them below.
!!!Code queries
Any Playground is a code query box. For example, in the example below, inspect the result of the query.

${example:GtPlaygroundExamples>>#pageWithCodeQuery|noCode=|previewShow=#gtLiveFor:|previewHeight=100}$
!!!Data exploration
Snippets are useful in various situations. For example, when analyzing data, we often want to retrieve the data and then to visualize it. These are different activities that benefit from distinct snippets. The playground below provides such a case.

${example:GtPlaygroundExamples>>#pageWithClassesAndMondrianView|noCode|previewShow=#gtLiveFor:|previewHeight=300}$



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
			baseline: 'Brick' with: [
				spec repository: 'github://feenkcom/Brick:v0.8.18/src' ];
			baseline: 'GToolkitPager' with: [
				spec repository: 'github://feenkcom/gtoolkit-pager:v0.8.19/src' ];
			baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter:v0.8.19/src' ];
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.19/src' ];
			baseline: 'GToolkitCompleter' with: [
				spec repository: 'github://feenkcom/gtoolkit-completer:v0.8.20/src' ];
			baseline: 'GToolkitUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.8.1/src' ];
			baseline: 'GToolkitVariableBindings' with: [
				spec repository: 'github://feenkcom/gtoolkit-playground:v0.8.21/src' ];
			baseline: 'GToolkitExamples' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.0/src' ];
			baseline: 'XdocClient' with: [
				spec repository: 'github://feenkcom/xdoc:v0.8.20/src' ].
		spec 
			package: 'GToolkit-Playground' with: [
				spec requires: #('Brick' 'GToolkitPhlow' 'GToolkitCompleter' 'GToolkitUtility' 'GToolkitVariableBindings' 'GToolkitPager' ). ];
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
