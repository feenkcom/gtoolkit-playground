execution
execute
	self 
		assert: [ self client notNil ]
		description: [ 'Zinc client must be initialized before execution' ].
	ZnSignalProgress 
		value: true
		during: [ 
			[ response := self client execute; response ]
			on: HTTPProgress 
			do: [ :anHTTPProgress | 
				self progressBlock cull: anHTTPProgress. 
				shouldContinue ifTrue: [ anHTTPProgress resume ] ] ]