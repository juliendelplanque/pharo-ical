productions
contentline: aName parameters: aCollection value: aString
	self calendar isNil
		ifFalse: [
			ICCalendarVersion
				use: self calendar version
				during: [ super contentline: aName parameters: aCollection value: aString ] ]
		ifTrue: [ super contentline: aName parameters: aCollection value: aString ]