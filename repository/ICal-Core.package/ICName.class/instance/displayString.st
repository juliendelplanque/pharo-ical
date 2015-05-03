converting
displayString
	^String streamContents: [ :stream |
		| writeBlock |
		writeBlock := [ :each | stream nextPutAll: each; space ].
		self honorificPrefixes do: writeBlock.
		self givenName isNil ifFalse: [
			writeBlock value: self givenName ].
		self additionalNames do: writeBlock.
		self familyName isNil ifFalse: [
			writeBlock value: self familyName ].
		self honorificSuffixes do: writeBlock ]
	