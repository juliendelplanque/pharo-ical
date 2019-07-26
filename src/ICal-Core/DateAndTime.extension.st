Extension { #name : #DateAndTime }

{ #category : #'*ICal-Core' }
DateAndTime >> asICalString [
	^String streamContents: [ :stream |
		stream 
			nextPutAll: self asDate asICalString;
			nextPut: $T;
			nextPutAll: self asTime asICalString ]
]

{ #category : #'*ICal-Core' }
DateAndTime >> asICalUtcString [
	^self asUTC asICalString , 'Z'
]

{ #category : #'*ICal-Core' }
DateAndTime >> asUTCWithOffsetAdded [
	^self asUTC + self offset
]

{ #category : #'*ICal-Core' }
DateAndTime >> asVCardString [
	^String streamContents: [ :stream |
		stream 
			nextPutAll: self asDate asVCardString;
			nextPut: $T;
			nextPutAll: self asTime asVCardString ]
]

{ #category : #'*ICal-Core' }
DateAndTime >> atStartOfDay [
	^ self
]

{ #category : #'*ICal-Core' }
DateAndTime class >> fromICalString: aString [
	^ICChronologyParser fromICalDateAndTimeString: aString class: self
]

{ #category : #'*ICal-Core' }
DateAndTime class >> fromVCardString: aString [
	^ICChronologyParser fromVCardDateAndTimeString: aString class: self
]

{ #category : #'*ICal-Core' }
DateAndTime class >> iCalType [
	^'DATE-TIME'
]

{ #category : #'*ICal-Core' }
DateAndTime >> itsYear [
	^ Year year: self year
]

{ #category : #'*ICal-Core' }
DateAndTime >> weekOfYear [
	^ self dayOfYear // 7
]
