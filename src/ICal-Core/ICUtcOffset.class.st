"
I am the representation of the UTC-OFFSET ical's type (RFC 2445).
"
Class {
	#name : #ICUtcOffset,
	#superclass : #Object,
	#instVars : [
		'hours',
		'minutes',
		'seconds',
		'positive'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #'instance creation' }
ICUtcOffset class >> fromICalString: aString [
	| totalSeconds |
	totalSeconds := aString size = 5
		ifTrue: [ aString allButFirst asInteger * 100 ] 
		ifFalse: [ aString allButFirst asInteger ].
	^self new
		hours: (totalSeconds quo: 10000);
		minutes: (totalSeconds quo: 100) \\ 100;
		seconds: totalSeconds \\ 100;
		positive: aString first = $+;
		yourself
]

{ #category : #'instance creation' }
ICUtcOffset class >> fromVCardString: aString [
	| hours minutes |
	hours := (aString copyFrom: 2 to: 3) asInteger.
	minutes := (aString copyFrom: 5 to: 6) asInteger.
	^self new
		hours: hours;
		minutes: minutes;
		seconds: 0;
		positive: aString first = $+;
		yourself
]

{ #category : #accessing }
ICUtcOffset class >> iCalType [
	^'UTC-OFFSET'
]

{ #category : #comparing }
ICUtcOffset >> = other [
	^(other isKindOf: ICUtcOffset)
		and: [ self positive = other positive
		and: [ self hours = other hours
		and: [ self minutes = other minutes
		and: [ self seconds = other seconds ] ] ] ]
]

{ #category : #converting }
ICUtcOffset >> asICalString [
	^String streamContents: [ :stream |
		stream
			nextPut: (self positive ifTrue: [ $+ ] ifFalse: [ $- ]);
			nextPutAll: (self hours printPaddedWith: $0 to: 2);
			nextPutAll: (self minutes printPaddedWith: $0 to: 2).
		self seconds isZero ifFalse: [
			stream nextPutAll: (self seconds printPaddedWith: $0 to: 2) ] ]
]

{ #category : #converting }
ICUtcOffset >> asVCardString [
	^String streamContents: [ :stream |
		stream
			nextPut: (self positive ifTrue: [ $+ ] ifFalse: [ $- ]);
			nextPutAll: (self hours printPaddedWith: $0 to: 2);
			nextPut: $:;
			nextPutAll: (self minutes printPaddedWith: $0 to: 2) ]
]

{ #category : #comparing }
ICUtcOffset >> hash [
	^((self positive
		ifTrue: [ 1 << (6 + 6 + 5) ]
		ifFalse: [ 0 ])
		bitOr: (self hours << (6 + 6)
		bitOr: self minutes << 6))
		bitOr: self seconds
]

{ #category : #accessing }
ICUtcOffset >> hours [
	^hours
]

{ #category : #accessing }
ICUtcOffset >> hours: anInteger [
	hours := anInteger
]

{ #category : #'initialize-release' }
ICUtcOffset >> initialize [
	super initialize.
	self positive: true.
	self hours: 0.
	self minutes: 0.
	self seconds: 0.
]

{ #category : #accessing }
ICUtcOffset >> minutes [
	^minutes
]

{ #category : #accessing }
ICUtcOffset >> minutes: anInteger [
	minutes := anInteger
]

{ #category : #accessing }
ICUtcOffset >> positive [
	^positive
]

{ #category : #accessing }
ICUtcOffset >> positive: aBoolean [
	positive := aBoolean
]

{ #category : #printing }
ICUtcOffset >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self asICalString;
		nextPut: $)
]

{ #category : #accessing }
ICUtcOffset >> seconds [
	^seconds
]

{ #category : #accessing }
ICUtcOffset >> seconds: anInteger [
	seconds := anInteger
]

{ #category : #accessing }
ICUtcOffset >> totalSeconds [
	| sum |
	sum := (self hours * 3600)+ (self minutes * 60) + self seconds.
	^self positive
		ifTrue: [ sum ]
		ifFalse: [ sum negated ]
]
