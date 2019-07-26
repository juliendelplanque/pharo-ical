Extension { #name : #String }

{ #category : #'*ICal-Core' }
String >> asICalParameterString [
	^(self includesAnyOf: #($, $; $\ $:))
		ifTrue: [ 
			'"' , self asString , '"' ]
		ifFalse: [ self asString ]
]

{ #category : #'*ICal-Core' }
String >> asICalString [
	^ICCalendarVersion value >= 2.0
		ifTrue: [ self asNewICalString ]
		ifFalse: [ self asOldICalString ]
]

{ #category : #'*ICal-Core' }
String >> asNewICalString [
	^self replaceStrings: (Array
		with: '\' -> '\\'
		with: ',' -> '\,'
		with: ';' -> '\;'
		with: (String with: Character cr) -> '\n')
]

{ #category : #'*ICal-Core' }
String >> asOldICalString [
	^self replaceStrings: (Array
		with: ',' -> '\,'
		with: ';' -> '\;'
		with: '\' -> '\\'
		with: (String cr) -> '=0D'
		with: (String lf) -> '=0A')
]

{ #category : #'*ICal-Core' }
String >> asVCardString [
	^ICCardVersion value >= 3.0
		ifTrue: [ self asNewICalString ]
		ifFalse: [ self asOldICalString ]
]

{ #category : #'*ICal-Core' }
String class >> decodeQuotedPrintable: aString [
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
]

{ #category : #'*ICal-Core' }
String class >> fromICalString: aString parameters: aDictinonary [
	| result |
	result := self unescapeBackslashes: aString.
	(aDictinonary at: 'ENCODING' ifAbsent: [ '8BIT' ]) = 'QUOTED-PRINTABLE'
		ifTrue: [ result := self decodeQuotedPrintable: result ].
	^result
]

{ #category : #'*ICal-Core' }
String class >> fromVCardString: aString parameters: aDictionary [
	^self fromICalString: aString parameters: aDictionary
]

{ #category : #'*ICal-Core' }
String class >> iCalType [
	^'TEXT'
]

{ #category : #'*ICal-Core' }
String >> replaceStrings: aCollection [
	| result |
	result := self.
	aCollection do: [ :each |
		(result includesSubstring: each key) ifTrue: [
				result := result copyReplaceAll: each key with: each value ] ].
	^result
]

{ #category : #'*ICal-Core' }
String >> splitAtCommas [
	| indices start parts |
	indices := OrderedCollection new.
	self withIndexDo: [ :each :index |
		(each = $,
			and: [ index > 1
			and: [ (self at: index - 1) ~= $\ ] ])
			ifTrue: [ indices add: index ] ].
	start := 1.
	parts := OrderedCollection new: indices size + 1.
	indices do: [ :each |
		parts add: (self copyFrom: start to: each - 1).
		start := each + 1 ].
	parts add: (self copyFrom: start to: self size).
	^parts
]

{ #category : #'*ICal-Core' }
String >> subStringsFull: separators [ 
	"Answer an array containing the substrings in the receiver separated 
	by the elements of separators."
	| char result sourceStream subString |
	sourceStream := ReadStream on: self.
	result := OrderedCollection new.
	subString := String new.
	[sourceStream atEnd]
		whileFalse: 
			[char := sourceStream next.
			(separators includes: char)
				ifTrue: [
					result add: subString.
					subString := String new ]
				ifFalse: [subString := subString , (String with: char)]].
	result add: subString.
	^ result
]

{ #category : #'*ICal-Core' }
String class >> unescapeBackslashes: aString [
	^aString replaceStrings: (Array
		with: '\n' -> (String with: Character cr)
		with: '\N' -> (String with: Character cr)
		with: '\,' -> ','
		with: '\;' -> ';'
		with: '\\' -> '\')
]
