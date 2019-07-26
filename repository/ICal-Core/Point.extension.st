Extension { #name : #Point }

{ #category : #'*ICal-Core' }
Point >> asICalString [
	^String streamContents: [ :stream |
		stream
			nextPutAll: self x asICalString;
			nextPut: $;;
			nextPutAll: self y asICalString ]
]

{ #category : #'*ICal-Core' }
Point class >> fromICalString: aString [
	| coords |
	coords := aString subStringsFull: #($;).
	^self
		x: (Float fromICalString: coords first)
		y: (Float fromICalString: coords second)
]

{ #category : #'*ICal-Core' }
Point class >> iCalType [
	^ 'FLOAT'
]
