todos
todosForDate: aDate 
	^self todos select: [ :each | each isValidForDate: aDate]