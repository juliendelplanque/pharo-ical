printing
printOn: aStream
	super printOn: aStream.
	self hasSummary ifTrue: [
		aStream
			nextPut: $(;
			nextPutAll: self summary;
			nextPut: $) ]