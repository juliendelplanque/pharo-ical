accessing-types
defaultTypes
	^Set
		with: self typeInternational 
		with: self typePostal 
		with: self typeParcel 
		with: self typeWork