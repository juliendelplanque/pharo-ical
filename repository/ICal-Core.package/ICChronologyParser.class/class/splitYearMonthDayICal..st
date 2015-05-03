date
splitYearMonthDayICal: aString
	^Array
		with: (aString first: 4) asInteger
	     with: (aString copyFrom: 5 to: 6) asInteger
	     with: (aString copyFrom: 7 to: 8) asInteger