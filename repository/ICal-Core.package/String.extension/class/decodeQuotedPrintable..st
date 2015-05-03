*ICal-Core
decodeQuotedPrintable: aString
	"String >> #decodeQuotedPrintable is borken, not really a surprise, is it?"
	^String streamContents: [ :writeStream |
		| readStream |
		readStream := aString readStream.
		[ readStream atEnd ] whileFalse: [
			| next |
			next := readStream next.
			writeStream nextPut: (next = $=
				ifTrue: [ Character value: (Integer readFrom: (readStream next: 2) readStream  base: 16) ]
				ifFalse: [ next ]) ] ]