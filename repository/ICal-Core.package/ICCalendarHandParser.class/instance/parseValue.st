parsing
parseValue
	| crlf |
	crlf := Array with: Character cr with: Character lf.
	self stream next.	"ignore $:"
	self
		value:
			(String
				streamContents: [ :strm | 
					strm nextPutAll: (self stream upToAll: crlf).	"no unfolding needed"
					[ self whitespaces includes: self stream peek ]
						whileTrue: [ 
							self stream next.	"ignore whitespace"
							strm nextPutAll: (self stream upToAll: crlf) ] ])	"no unfolding needed"