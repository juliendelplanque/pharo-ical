as yet unclassified
ordinalShrinkTestFor: eachDate


	^ self byValues
		anySatisfy: [ :eachValue | 
			eachValue isString
				ifTrue: [ eachValue = (self dayLetterCodeFor: eachDate)
					]
				ifFalse: [ eachValue key = (self dayLetterCodeFor: eachDate)
						and: [ (self ordinalIndexesFor: eachDate) includes: eachValue value ]  ] ]