Class {
	#name : #BaselineOfGToolkitVariableBindings,
	#superclass : #BaselineOf,
	#category : 'BaselineOfGToolkitVariableBindings'
}

{ #category : #baseline }
BaselineOfGToolkitVariableBindings >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'GToolkitUtility' with: [ spec 
				repository: 'github://feenkcom/gtoolkit/src' ];
			package: 'GToolkit-VariableBindings' with: [
				spec requires: #( 'GToolkitUtility' ) ]
	]

]