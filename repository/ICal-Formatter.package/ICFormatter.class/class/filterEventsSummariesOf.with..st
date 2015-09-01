filtering
filterEventsSummariesOf: iCalendar with: regexList
	"This message modify the summary of iCalendar events collection using the conversionDictionnary.
	 The conversionDictionnary keys are regular expressions and its value are string to use in case
	 the regex matches with the summary."
	
	^self filter: #events
		  	of: iCalendar with: regexList
		  	accessor: #summary