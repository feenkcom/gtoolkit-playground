execution
execute
	[ 
		command execute.
		exception := nil.
	] on: self catchingErrors do: [ :anException |
		exception := anException.
	].