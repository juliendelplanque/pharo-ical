testing
testTime
	| time |
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: time asVCardString = '10:22:00'.

	time := self timeClass hour: 10 minute: 22 second: 00 nanosecond: 330000000.
	self assert: time asVCardString = '10:22:00.33'.

	time :=self timeClass hour: 10 minute: 22 second: 33.
	self assert: time asVCardString = '10:22:33'.
