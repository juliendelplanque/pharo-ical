private
printWeekStartdayOn: aStream
	aStream
		nextPutAll: 'WKST=';
		nextPutAll: self weekStartday