accessing
activeComponentOrCalendar
	^self activeComponent ifNil: [ self calendar ]