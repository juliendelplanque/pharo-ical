parsing
parseParameter
	"redefined for compatibility with ApplesAddress book"
	| paramName paramValue parameter |
	self stream next. "ignore $;"
	parameter := self stream upToAny: #($; $:).
	paramName := parameter copyUpTo: $=. 
	paramValue := parameter copyAfter: $=.
	paramName := (self unfold: paramName) asUppercase. "case insensitive"
	paramValue := (self unfold: paramValue) asUppercase. "case insensitive"
	self addParameter: paramName value: paramValue.
	self stream position: self stream position - 1.