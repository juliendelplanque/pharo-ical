Class {
	#name : #ICChronologySerializer,
	#superclass : #Object,
	#category : 'ICal-Core-IO'
}

{ #category : #duration }
ICChronologySerializer class >> asICalStringDuration: aDuration [
	^String streamContents: [ :stream |
		aDuration isNegative ifTrue: [ stream nextPut: $-. ].
		stream nextPut: $P.
		(self justWeeks: aDuration)
			ifTrue: [
				stream
					nextPutAll: aDuration weeks abs asString;
					nextPut: $W ]
			ifFalse: [
				aDuration days isZero ifFalse: [ 
					stream
						nextPutAll: aDuration days abs asString;
						nextPut: $D ].
				(self hasTime: aDuration) ifTrue: [
					stream
						nextPut: $T;
						"we could leave out those who are 0 but that's just cosmetic"
						nextPutAll: aDuration hours abs asString;
						nextPut: $H;
						nextPutAll: aDuration minutes abs asString;
						nextPut: $M;
						nextPutAll: aDuration seconds abs asString;
						nextPut: $S  ] ] ]
]

{ #category : #time }
ICChronologySerializer class >> asICalStringTime: aTime [
	^String streamContents: [ :stream |
		stream
			nextPutAll: (aTime hour printPaddedWith: $0 to:  2);
			nextPutAll: (aTime minute printPaddedWith: $0 to:  2);
			nextPutAll: (aTime second asInteger printPaddedWith: $0 to:  2) ]
]

{ #category : #duration }
ICChronologySerializer class >> daysWithoutWeeks: aDuration [
	^aDuration days - (7 * aDuration weeks)
]

{ #category : #time }
ICChronologySerializer class >> fractionString: nanoseconds [
	| string lastIndex |
	string := nanoseconds asString.
	lastIndex := string size.
	[ (string at: lastIndex) = $0 ] whileTrue: [
		lastIndex := lastIndex - 1].
	^string first: lastIndex
]

{ #category : #duration }
ICChronologySerializer class >> hasTime: aDuration [
	^aDuration hours isZero not
		or: [ aDuration minutes isZero not
		or: [ aDuration seconds isZero not ] ]
]

{ #category : #duration }
ICChronologySerializer class >> justWeeks: aDuration [
	^aDuration weeks isZero not
		and: [ (self daysWithoutWeeks: aDuration) isZero
		and: [ aDuration hours isZero
		and: [ aDuration minutes isZero
		and: [ aDuration seconds isZero ] ] ] ]
]
