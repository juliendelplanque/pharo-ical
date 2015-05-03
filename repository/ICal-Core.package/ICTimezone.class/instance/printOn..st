accessing
printOn: aStream
	super printOn: aStream.
	self id isNil ifFalse: [
		aStream
			nextPut: $(;
			nextPutAll: self id;
			nextPut: $) ]