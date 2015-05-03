hashing
weekGranularityHash: aDateAndTime
	^ aDateAndTime year * 100 + (aDateAndTime dayOfYear / 7.0) ceiling