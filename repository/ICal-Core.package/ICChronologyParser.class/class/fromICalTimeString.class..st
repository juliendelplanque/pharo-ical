time
fromICalTimeString: aString class: aClass
	| hourMinuteSecond |
	self flag: #todo. "last = z utc"
	hourMinuteSecond := self splitHourMinuteSecondICal: aString.
	^aClass
		hour: hourMinuteSecond first
		minute: hourMinuteSecond second
		second: hourMinuteSecond third.