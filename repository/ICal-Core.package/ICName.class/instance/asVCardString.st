converting
asVCardString
	^String streamContents: [ :stream |
		self familyName isNil ifFalse: [
			stream nextPutAll: self familyName asVCardString ].
		stream nextPut: $; .

		self givenName isNil ifFalse: [
			stream nextPutAll: self givenName asVCardString ].
		stream nextPut: $; .

		self additionalNames
			do: [ :each | stream nextPutAll: each asVCardString ]
			separatedBy: [ stream nextPut: $, ].
		stream nextPut: $; .

		self honorificPrefixes
			do: [ :each | stream nextPutAll: each asVCardString ]
			separatedBy: [ stream nextPut: $, ].
		stream nextPut: $; .

		self honorificSuffixes
			do: [ :each | stream nextPutAll: each asVCardString ]
			separatedBy: [ stream nextPut: $, ] ]