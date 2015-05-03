*ICal-Core
asICalParameterString
	^(self includesAnyOf: #($, $; $\ $:))
		ifTrue: [ 
			'"' , self asString , '"' ]
		ifFalse: [ self asString ]