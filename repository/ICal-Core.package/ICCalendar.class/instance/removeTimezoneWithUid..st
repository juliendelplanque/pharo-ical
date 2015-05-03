timezones
removeTimezoneWithUid: aString
	| timezone |
	timezone := self timezones detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeTimezone: timezone.
	