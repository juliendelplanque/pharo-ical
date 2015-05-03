accessing-types
fax: aBoolean
	^self
		setType: self class typeFax
		toValue: aBoolean