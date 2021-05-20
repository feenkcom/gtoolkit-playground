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
			baseline: 'GToolkitPager' with: [
				spec repository: 'github://feenkcom/gtoolkit-pager:v0.8.338/src' ];
			baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter:v0.8.321/src' ];
			baseline: 'GToolkitCompleter' with: [
				spec repository: 'github://feenkcom/gtoolkit-completer:v0.8.332/src' ];
			baseline: 'GToolkit4Pharo' with: [
				spec repository: 'github://feenkcom/gt4pharo:v0.6.34/src' ];
			baseline: 'GToolkitExamples' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.22/src' ];
			baseline: 'XdocClient' with: [
				spec repository: 'github://feenkcom/xdoc:v0.8.351/src' ].
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
