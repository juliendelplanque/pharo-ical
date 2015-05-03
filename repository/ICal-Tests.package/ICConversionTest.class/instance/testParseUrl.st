testing
testParseUrl
	| url string |
	string := 'mailto:mouse@squeakfoundation.org'.
	url := ZnUrl fromICalString: string.
	self assert: string  = url asICalString.
		
	string := 'http://host1.com/my-report.txt'.
	url := ZnUrl fromICalString: string.
	self assert: string  = url asICalString.
	