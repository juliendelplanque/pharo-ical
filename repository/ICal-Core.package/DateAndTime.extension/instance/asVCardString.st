*ICal-Core
asVCardString
	^String streamContents: [ :stream |
		stream 
			nextPutAll: self asDate asVCardString;
			nextPut: $T;
			nextPutAll: self asTime asVCardString ]