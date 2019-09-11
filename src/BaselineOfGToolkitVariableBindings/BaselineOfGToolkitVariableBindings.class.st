Class {
	#name : #BaselineOfGToolkitVariableBindings,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitVariableBindings
}

{ #category : #baseline }
BaselineOfGToolkitVariableBindings >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.7.0/src' ];
			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc:v0.7.65/src' ].
		spec package: 'GToolkit-VariableBindings' with: [
				spec requires: #('GToolkitUtility' 'Bloc' ). ]. ].

]
