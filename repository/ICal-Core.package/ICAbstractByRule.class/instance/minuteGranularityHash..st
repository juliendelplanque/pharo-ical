hashing
minuteGranularityHash: aDateAndTime
	^ (self hourGranularityHash: aDateAndTime) hashMultiply bitXor: aDateAndTime minute