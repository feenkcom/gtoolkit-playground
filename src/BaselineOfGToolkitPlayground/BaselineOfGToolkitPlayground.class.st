"
!Playground

Playground is the place to play with live code.

In the snippet below we see a simple example. If you evaluate the code with ==PrimaryModifier+G==, you will get an inspector with the resulting object to the right. 

${example:GtPlaygroundExamples>>#pageWithCode|noCode|show=#gtLiveFor:|previewHeight=100}$

!!Snippets

Playgrounds can have multiple snippets. Each snippet provides a scope and allows you to manipulate the code in isolation from the rest of the code. At the same time, the overall page still behaves like one contiguous page sharing the same set of variables.

For example, in the page below we have two snippets. Evaluating the first one, initializes ==aValue== with ==42==. Evaluating the second snippet increases the value.

${example:GtPlaygroundExamples>>#pageWithTwoDependingPharoSnippets|noCode|show=#gtLiveFor:|previewHeight=200}$



"
Class {
	#name : #BaselineOfGToolkitPlayground,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitPlayground
}

{ #category : #baseline }
BaselineOfGToolkitPlayground >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'TaskIt' with: [ spec 
				repository: 'github://sbragagnolo/taskit:dev-0.5' ];
			baseline: 'Brick' with: [ spec
				repository: 'github://pharo-graphics/Brick/src' ];
			baseline: 'GToolkitPhlow' with: [ spec
				repository: 'github://feenkcom/gtoolkit-phlow/src' ];
			baseline: 'GToolkitCompleter' with: [ spec
				repository: 'github://feenkcom/gtoolkit-completer/src' ];
			baseline: 'GToolkitUtility' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-utility/src' ];
			baseline: 'GToolkitVariableBindings' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-playground/src' ];
			baseline: 'GToolkitExamples' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-examples/src' ];
			baseline: 'XdocCore' with: [ spec 
				repository: 'github://feenkcom/xdoc/src' ];

			package: 'GToolkit-Playground' with: [ 
				spec requires: #( 
					#TaskIt
					#Brick 
					#GToolkitPhlow
					#GToolkitCompleter
					#GToolkitUtility
					#GToolkitVariableBindings ) ];
			package: 'GToolkit-Playground-XDoc' with: [ spec
				requires: #( 'GToolkit-Playground' 'XdocCore' 'GToolkitExamples' ) ];
			package: 'GToolkit-Playground-Examples' with: [ spec 
				requires: #( 
					#'GToolkitExamples' 
					#'GToolkit-Playground' ) ]
	]

]
