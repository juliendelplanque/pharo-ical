*ICal-Core
fromICalString: aString parameters: aDictinonary
	| result |
	result := self unescapeBackslashes: aString.
	(aDictinonary at: 'ENCODING' ifAbsent: [ '8BIT' ]) = 'QUOTED-PRINTABLE'
		ifTrue: [ result := self decodeQuotedPrintable: result ].
	^result