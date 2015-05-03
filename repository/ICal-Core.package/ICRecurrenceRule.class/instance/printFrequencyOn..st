private
printFrequencyOn: aStream
	aStream
		nextPutAll: 'FREQ=';
		nextPutAll: self frequency