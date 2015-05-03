testing
testWeeks
	| duration |
	0 to: 10 do: [ :week |
		0 to: 6 do: [ :day |
			duration := self durationClass days: week * 7 + day.
			self assert: duration weeks = week ] ]