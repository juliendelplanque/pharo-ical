private
scanForBeginningCharacterAt: anInteger in: aString
	| index codePoint |
	index := anInteger.
	codePoint := (aString at: index) asInteger.
	[ codePoint < 2r10000000 or: [ ((codePoint bitAnd: 2r11000000) bitShift: -6) = 2r10 ] ] whileFalse: [
		index := index - 1.
		codePoint := (aString at: index) asInteger ].
	^index