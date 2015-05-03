duration
asICalStringDuration: aDuration
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