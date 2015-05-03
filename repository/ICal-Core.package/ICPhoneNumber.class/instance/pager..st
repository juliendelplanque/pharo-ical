accessing-types
pager: aBoolean
	^self
		setType: self class typePager
		toValue: aBoolean