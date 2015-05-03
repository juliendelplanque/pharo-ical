accessing-classifications
possibleClassifications
	^Array
		with: self classificationPublic
		with: self classificationPrivate
		with: self classificationConfidential
	