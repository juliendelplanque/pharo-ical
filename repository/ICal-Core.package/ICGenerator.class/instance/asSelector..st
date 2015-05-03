utilities
asSelector: aString
	| parts |
	parts := aString subStrings: #($-).
	^String streamContents: [ :stream |
		parts do: [ :each |
			stream nextPutAll: each asLowercase ].
		stream nextPut: $: ]