accessing
componentForDate: aDate
	^Array streamContents: [ :array |
		array
			nextPutAll: (self eventsForDate: aDate);
			nextPutAll: (self todosForDate: aDate) ]