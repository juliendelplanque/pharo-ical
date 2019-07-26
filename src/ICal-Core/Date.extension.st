Extension { #name : #Date }

{ #category : #'*ICal-Core' }
Date >> < comparand [
	"comparand conforms to protocol DateAndTime,
	or can be converted into something that conforms."

	| other |
	other := comparand asDate.
	^ start year = other start year
		ifTrue: [ 
			start month = other start month
				ifTrue: [ start dayOfMonth  < other start dayOfMonth ]
				ifFalse: [ start month  < other start month ] ]
		ifFalse: [ start year < other start year  ]
]

{ #category : #'*ICal-Core' }
Date >> = comparand [
	^ self species = comparand species 
		and: [ self start year = comparand start year
				and: [ self start  month = comparand start month 
					and:[self start day= comparand start day ]]]

]

{ #category : #'*ICal-Core' }
Date >> asICalString [
	^String streamContents: [ :stream |
		stream
			nextPutAll: (self year printPaddedWith: $0 to:  4);
			nextPutAll: (self monthIndex printPaddedWith: $0 to:  2);
			nextPutAll: (self dayOfMonth printPaddedWith: $0 to:  2) ]
	
]

{ #category : #'*ICal-Core' }
Date >> asICalUtcString [
	"shouldn't be sent to a date up they are Date and DateAndTime are somewhat 	polymorphic so a Date might end up somewhere where UTC time is needed"
	^self asICalString
]

{ #category : #'*ICal-Core' }
Date >> asVCardString [
	^self yyyymmdd
]

{ #category : #'*ICal-Core' }
Date class >> fromICalString: aString [
	^ICChronologyParser fromICalDateString: aString class: self
]

{ #category : #'*ICal-Core' }
Date class >> fromVCardString: aString [
	^ (aString includesSubstring: '-')
		ifFalse: [ self fromICalString: aString ]
		ifTrue: [ 
			self
				year: (aString first: 4) asInteger
				month: (aString copyFrom: 6 to: 7) asInteger
				day: (aString copyFrom: 9 to: 10) asInteger ]
]

{ #category : #'*ICal-Core' }
Date class >> iCalType [
	^'DATE'
]

{ #category : #'*ICal-Core' }
Date >> isDateOrNil [
	^true
]
