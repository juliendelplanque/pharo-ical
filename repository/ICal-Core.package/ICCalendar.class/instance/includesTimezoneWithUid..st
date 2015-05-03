timezones
includesTimezoneWithUid: aString
	^self timezones anySatisfy: [ :each | each uid = aString ]