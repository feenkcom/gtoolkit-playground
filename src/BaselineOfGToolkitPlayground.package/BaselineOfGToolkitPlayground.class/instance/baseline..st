baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'Brick' with: [ spec
				repository: 'github://pharo-graphics/Brick/src';
				loads: #core ];
			baseline: 'GToolkitCompleter' with: [ spec
				repository: 'github://feenkcom/gtoolkit-completer/src' ];
			baseline: 'GToolkitUtility' with: [ spec 
				repository: 'github://feenkcom/gtoolkit/src' ];
			baseline: 'GToolkitVariableBindings' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-playground/src' ];
			baseline: 'GToolkitExamples' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-examples/src' ];
			"baseline: 'GToolkitInspector' with: [ spec
				repository: 'github://feenkcom/gtoolkit-inspector/src' ];"

			package: 'GToolkit-Playground-Model' with: [ 
				spec requires: #( #GToolkitUtility ) ];
			package: 'GToolkit-Playground-Brick' with: [ 
				spec requires: #( 
					#Brick #GToolkitCompleter
					#'GToolkit-Playground-Model' #'GToolkit-Playground-Commands' ) ];
			package: 'GToolkit-Playground-Commands' with: [ 
				spec requires: #( 
					#Brick #GToolkitVariableBindings #GToolkitUtility ) ];
			package: 'GToolkit-Playground-Examples' with: [ 
				spec requires: #( 
					#'GToolkitExamples' 
					#'GToolkit-Playground-Model' 
					#'GToolkit-Playground-Brick' ) ];
			package: 'BrickToolbar' with: [ 
				spec requires: #( #Brick ) ]
	]
