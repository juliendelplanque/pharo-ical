time
asICalStringTime: aTime
	^String streamContents: [ :stream |
		stream
			nextPutAll: (aTime hour printPaddedWith: $0 to:  2);
			nextPutAll: (aTime minute printPaddedWith: $0 to:  2);
			nextPutAll: (aTime second asInteger printPaddedWith: $0 to:  2) ]