converting
asVCardString
	^String streamContents: [ :stream |
		self poBox isNil ifFalse: [
			stream nextPutAll: self poBox asVCardString ].
		stream nextPut: $;.

		self extended isNil ifFalse: [
			stream nextPutAll: self extended asVCardString ].
		stream nextPut: $;.

		self street isNil ifFalse: [
			stream nextPutAll: self street asVCardString ].
		stream nextPut: $;.

		self locality isNil ifFalse: [
			stream nextPutAll: self locality asVCardString ].
		stream nextPut: $;.

		self region isNil ifFalse: [
			stream nextPutAll: self region asVCardString ].
		stream nextPut: $;.

		self postalcode isNil ifFalse: [
			stream nextPutAll: self postalcode asVCardString ].
		stream nextPut: $;.

		self country isNil ifFalse: [
			stream nextPutAll: self country asVCardString ] ]