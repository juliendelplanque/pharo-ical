instance creation
parseCalendarString: aString
	| parser |
	parser := self on: (ReadStream on: aString).
	parser generator: ICCalendarGenerator new.
	parser parse.
	^parser product