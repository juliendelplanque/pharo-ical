Extension { #name : #Time }

{ #category : #'*ICal-Core' }
Time >> asICalString [
	^ICChronologySerializer asICalStringTime: self
]

{ #category : #'*ICal-Core' }
Time >> asICalUtcString [
	^self asICalString , 'Z'
]

{ #category : #'*ICal-Core' }
Time >> asVCardString [
	^self printVCardFormatted
	
]

{ #category : #'*ICal-Core' }
Time >> asVCardUtcString [
	^self asVCardString, 'Z'
]

{ #category : #'*ICal-Core' }
Time class >> fromICalString: aString [
	^ICChronologyParser fromICalTimeString: aString class: self
]

{ #category : #'*ICal-Core' }
Time class >> fromVCardString: aString [
	^ICChronologyParser fromVCardStringTime: aString class: self
]

{ #category : #'*ICal-Core' }
Time class >> hour: hour minute: minute second: second  nanosecond: nanosecondsSinceSecond [
	^self hour: hour minute: minute second: second  nanoSecond: nanosecondsSinceSecond
]

{ #category : #'*ICal-Core' }
Time class >> iCalType [
	^'TIME'
]

{ #category : #'*ICal-Core' }
Time >> printVCardFormatted [

	^ String new: 11 streamContents: [ :aStream | 
		self printVCardFormattedOn: aStream ]
]

{ #category : #'*ICal-Core' }
Time >> printVCardFormattedOn: aStream [ 

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
]
