printing
printOn: aStream
	super printOn: aStream.
	self name isNil ifFalse: [
		aStream
			nextPut: $(;
			nextPutAll: self name;
			nextPut: $) ]