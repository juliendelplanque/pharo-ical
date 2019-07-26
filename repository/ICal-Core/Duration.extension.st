Extension { #name : #Duration }

{ #category : #'*ICal-Core' }
Duration >> asICalString [
	^ICChronologySerializer asICalStringDuration: self
]

{ #category : #'*ICal-Core' }
Duration class >> fromICalString: aString [
	^ICChronologyParser fromICalDuractionString: aString class: self
]

{ #category : #'*ICal-Core' }
Duration class >> iCalType [
	^'DURATION'
]

{ #category : #'*ICal-Core' }
Duration >> isNegative [
	^self isPositive not
]

{ #category : #'*ICal-Core' }
Duration >> isOneDayLong [
	^ self seconds = 86400
]

{ #category : #'*ICal-Core' }
Duration >> isPositive [
	^seconds > 0
	 	or: [ seconds = 0
			and: [ nanos > 0 ] ]
]

{ #category : #'*ICal-Core' }
Duration >> weeks [
	^self days quo: 7
]
