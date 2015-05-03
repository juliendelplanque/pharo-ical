converting
asICalString
	^String streamContents: [ :stream |
		stream
			nextPut: (self positive ifTrue: [ $+ ] ifFalse: [ $- ]);
			nextPutAll: (self hours printPaddedWith: $0 to: 2);
			nextPutAll: (self minutes printPaddedWith: $0 to: 2).
		self seconds isZero ifFalse: [
			stream nextPutAll: (self seconds printPaddedWith: $0 to: 2) ] ]