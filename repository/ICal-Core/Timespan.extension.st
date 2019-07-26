Extension { #name : #Timespan }

{ #category : #'*ical-core' }
Timespan >> daysDo: aBlock [
	self datesDo: aBlock
]
