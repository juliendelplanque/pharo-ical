utilities
unfoldWhiteSpaces
	^ Array
		with: Character space asString
		with: Character tab asString
		with: (Character value: 9) asString
		with: (Character value: 32) asString
		with: String cr
		with: String lf