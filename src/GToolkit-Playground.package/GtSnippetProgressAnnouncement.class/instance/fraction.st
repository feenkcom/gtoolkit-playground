accessing-computed
fraction
	^ (self amount isNil or: [ self total isNil ])
		ifFalse: [ self amount / self total ]
		ifTrue: [ 40 atRandom / 100 ]