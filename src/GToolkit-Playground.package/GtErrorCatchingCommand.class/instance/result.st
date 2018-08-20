accessing
result
	"Return a command execution result"
	<return: #Object>
	^ self isException 
		ifTrue: [ self exception ] 
		ifFalse: [ self command result ]