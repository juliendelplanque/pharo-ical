converting
asVCardString
	^String streamContents: [ :stream |
		stream
			nextPut: (self positive ifTrue: [ $+ ] ifFalse: [ $- ]);
			nextPutAll: (self hours printPaddedWith: $0 to: 2);
			nextPut: $:;
			nextPutAll: (self minutes printPaddedWith: $0 to: 2) ]