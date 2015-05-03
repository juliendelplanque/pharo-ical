time
splitHourMinuteSecondICal: aString
	^Array
		with: (aString first: 2) asInteger
		with: (aString copyFrom: 3 to: 4) asInteger
		with: (aString copyFrom: 5 to: 6) asInteger.