testing
isOrganization
	^self organization notNil
		and: [ self fullname = self organization name ]
		