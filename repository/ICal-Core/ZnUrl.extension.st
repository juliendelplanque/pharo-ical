Extension { #name : #ZnUrl }

{ #category : #'*ICal-Core' }
ZnUrl >> asICalString [
	^self asString
		replaceStrings: (Array
			with: '%2D' -> '-'
			with: '%2E' -> '.'
			with: '%5F' -> '_'
			with: '%7E' -> '~')
]

{ #category : #'*ICal-Core' }
ZnUrl class >> fromICalString: aString [
	^self fromString: aString
]

{ #category : #'*ICal-Core' }
ZnUrl class >> iCalType [
	^'URI'
]
