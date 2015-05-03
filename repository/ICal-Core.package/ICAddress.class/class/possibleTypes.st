accessing-types
possibleTypes
	^super possibleTypes
		add: self typeDomestic;
		add: self typeInternational;
		add: self typeParcel;
		add: self typePostal;
		yourself