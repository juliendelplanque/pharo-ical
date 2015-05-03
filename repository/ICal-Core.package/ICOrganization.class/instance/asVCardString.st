converting
asVCardString
	^String streamContents: [ :stream |
		stream nextPutAll: self name asVCardString.
		self unitNames isEmpty ifFalse: [
			stream nextPut: $; ].
		self unitNames
			do: [ :each | stream nextPutAll: each asVCardString ]
			separatedBy: [ stream nextPut: $; ] ]