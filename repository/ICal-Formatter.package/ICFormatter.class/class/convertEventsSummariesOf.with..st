conversion
convertEventsSummariesOf: iCalendar with: conversionDictionnary
	"This message modify the summary of iCalendar events collection using the conversionDictionnary.
	 The conversionDictionnary keys are regular expressions and its value are string to use in case
	 the regex matches with the summary."
	
	^self convert: #events
		  	of: iCalendar with: conversionDictionnary
		  	accessor: #summary mutator: #summary: