baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec
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
