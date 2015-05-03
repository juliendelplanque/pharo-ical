parsing
addParameter: paramName value: paramValue
	| values |
	(self needsHackForOldFormat: paramName value: paramValue) ifTrue: [
		^self parseHackForOldFormat: paramName value: paramValue ].
	(self isMultivalued: paramName)
		ifFalse: [ super addParameter: paramName value: paramValue ]
		ifTrue: [
				values := self parameters at: paramName ifAbsentPut: [ OrderedCollection new ].
				(paramValue includes: $,)
					ifFalse: [ values add: paramValue ]
					ifTrue: [ values addAll: (paramValue subStrings: #($,)) ] ]