private
printRepetitonOn: aStream
	self repetition isInteger
		ifTrue: [
			aStream
				nextPutAll: 'COUNT=';
				nextPutAll: self repetition asICalString ]
		ifFalse: [
			aStream
			nextPutAll: 'UNTIL=';
				nextPutAll: self repetition asICalUtcString ]