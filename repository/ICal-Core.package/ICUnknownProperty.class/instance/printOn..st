printing
printOn: aStream
	super printOn: aStream.
	self name ifNotNil: [
		aStream
			nextPut: $(;
			nextPutAll: self name;
			nextPut: $) ]