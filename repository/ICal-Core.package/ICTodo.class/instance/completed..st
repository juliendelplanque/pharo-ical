accessing
completed: aDateAndTime 
	completed := aDateAndTime.
	aDateAndTime ifNotNil: [
		self beCompleted ]