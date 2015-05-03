events
includesEventWithUid: aString 
	^self events anySatisfy: [:each | each uid = aString]