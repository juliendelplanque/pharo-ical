instance creation
parseCalendarStream: aStream
	"don't ask it's Squeak"
	| string |
	string := String streamContents: [ :stream |
			[ aStream atEnd ]
				whileFalse: [ stream nextPut: aStream next ] ].
	aStream close.
	^self parseCalendarString: string