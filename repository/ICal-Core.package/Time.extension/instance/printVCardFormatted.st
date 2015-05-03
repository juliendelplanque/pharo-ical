*ICal-Core
printVCardFormatted

	^ String new: 11 streamContents: [ :aStream | 
		self printVCardFormattedOn: aStream ]