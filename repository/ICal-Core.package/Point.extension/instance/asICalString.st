*ICal-Core
asICalString
	^String streamContents: [ :stream |
		stream
			nextPutAll: self x asICalString;
			nextPut: $;;
			nextPutAll: self y asICalString ]