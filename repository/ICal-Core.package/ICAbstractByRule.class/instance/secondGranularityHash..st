hashing
secondGranularityHash: aDateAndTime
	^ (self minuteGranularityHash: aDateAndTime) hashMultiply bitXor: aDateAndTime second