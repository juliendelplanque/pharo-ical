utilities
asSelector: aString
	| parts |
	parts := aString substrings: #($-).
	^ String
		streamContents: [ :stream | 
			parts do: [ :each | stream nextPutAll: each asLowercase ].
			stream nextPut: $: ]