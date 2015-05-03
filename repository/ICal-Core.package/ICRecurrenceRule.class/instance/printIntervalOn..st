private
printIntervalOn: aStream
	aStream
		nextPutAll: 'INTERVAL=';
		nextPutAll: self interval asICalString