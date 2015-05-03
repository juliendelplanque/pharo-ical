comparing
hash
	^((self positive
		ifTrue: [ 1 << (6 + 6 + 5) ]
		ifFalse: [ 0 ])
		bitOr: (self hours << (6 + 6)
		bitOr: self minutes << 6))
		bitOr: self seconds