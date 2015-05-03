hashing
hourGranularityHash: aDateAndTime
	^ aDateAndTime year * 100000 + (aDateAndTime dayOfYear * 100) + aDateAndTime hour