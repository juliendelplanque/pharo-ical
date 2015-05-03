accessing-types
possibleTypes
	^super possibleTypes
		add: self typeInternet;
		add: self typeX400;
		yourself