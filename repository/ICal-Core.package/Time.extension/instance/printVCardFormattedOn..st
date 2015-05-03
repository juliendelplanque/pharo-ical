*ICal-Core
printVCardFormattedOn: aStream 

	| h m s |
	h := self hour. m := self minute. s := self second.
	h < 10 ifTrue: [ aStream nextPut: $0 ].
	h printOn: aStream.
	aStream nextPutAll: (m < 10 ifTrue: [ ':0' ] ifFalse: [ ':' ]).
	m printOn: aStream.
	aStream nextPutAll: (s < 10 ifTrue: [ ':0' ] ifFalse: [ ':' ]).
	s printOn: aStream.
	nanos = 0
		ifFalse: [ | n len |
			n := nanos. len := 9.
			[ n \\ 10 = 0 ] whileTrue: [ n := n / 10. len := len - 1 ].
			aStream nextPut: $..
			n printOn: aStream base: 10 length: len padded: true ].