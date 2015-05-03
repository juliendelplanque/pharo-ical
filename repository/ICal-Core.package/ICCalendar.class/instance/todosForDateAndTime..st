todos
todosForDateAndTime: aDateAndTime 
	^self todos select: [ :each | each startsInHour: aDateAndTime]