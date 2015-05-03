instance creation
parseVCardString: aString
	| parser |
	parser := self on: (ReadStream on: aString).
	parser generator: ICVCardGenerator new.
	parser parse.
	^parser product