todos
includesTodoWithUid: aString 
	^self todos anySatisfy: [:each | each uid = aString]