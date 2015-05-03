time
splitHourMinuteSecondVCard: aString
	^self splitHourMinuteSecondICal: ((aString copyUpTo: $.) reject: [ :each | each = $: ])