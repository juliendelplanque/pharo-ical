generating
generateUid
	^String streamContents: 
			[:stream | 
			stream
				nextPutAll: self now;
				nextPut: $-.
			self randomParts do: [:each | stream nextPutAll: each]
				separatedBy: [stream nextPut: $-].
			stream
				nextPut: $@;
				nextPutAll: self hostName]