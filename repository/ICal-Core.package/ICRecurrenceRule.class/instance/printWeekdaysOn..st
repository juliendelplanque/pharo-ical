private
printWeekdaysOn: aStream
	aStream nextPutAll: 'BYDAY='.
	self weekdays
		do: [ :each |
			each isString
				ifTrue: [ aStream nextPutAll: each ]
				ifFalse: [
					aStream
						nextPutAll: each value asICalString; "occurrence"
						nextPutAll: each key asICalString "day" ] ]
		separatedBy: [ aStream nextPut: $, ]