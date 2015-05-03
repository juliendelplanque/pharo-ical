enumerating
enumeratingEndDateConsidering: anEnd
	^ self isInfinite
		ifTrue: [ anEnd ]
		ifFalse: [ self end min: anEnd ]