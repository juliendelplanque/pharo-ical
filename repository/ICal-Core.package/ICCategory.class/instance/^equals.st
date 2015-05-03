comparing
= aCategory
	^(aCategory isKindOf: ICCategory)
		and: [ self summary = aCategory summary ]