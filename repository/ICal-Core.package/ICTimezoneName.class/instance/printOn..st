printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	
	self language isNil ifFalse: [
		aStream
			nextPutAll: self language;
			nextPut: $: ].
	
	aStream
		nextPutAll: self text;
		nextPut: $)