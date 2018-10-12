"
!Playground

Playground is the place to play with code. For example, 

${example:GtPlaygroundExamples>>#pageWithCode|noCode|show=#gtLiveFor:|previewHeight=100}$


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
				repository: 'github://feenkcom/gtoolkit/src' ];
			baseline: 'GToolkitVariableBindings' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-playground/src' ];
			baseline: 'GToolkitExamples' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-examples/src' ];

			package: 'GToolkit-Playground' with: [ 
				spec requires: #( 
					#TaskIt
					#Brick 
					#GToolkitPhlow
					#GToolkitCompleter
					#GToolkitUtility
					#GToolkitVariableBindings ) ];
			package: 'GToolkit-Playground-Examples' with: [ 
				spec requires: #( 
					#'GToolkitExamples' 
					#'GToolkit-Playground' ) ]
	]

]
