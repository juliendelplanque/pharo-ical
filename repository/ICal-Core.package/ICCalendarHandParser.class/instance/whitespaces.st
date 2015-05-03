parsing
whitespaces
	^ Array
		with: Character space
		with: Character tab
		with: (Character value: 9)
		with: (Character value: 32)