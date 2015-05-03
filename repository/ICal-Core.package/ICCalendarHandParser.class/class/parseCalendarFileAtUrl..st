instance creation
parseCalendarFileAtUrl: aUrl
	| response |
	response := ZnEasy get: aUrl.
	response isSuccess
		ifTrue: [ ^ self parseCalendarString: response contents ]
		ifFalse: [ (ZnHttpUnsuccessful response: response) signal ]