Class {
	#name : #ICViewableCalendarEntry,
	#superclass : #ICCalendarEntry,
	#instVars : [
		'attachments',
		'categories',
		'classification',
		'created',
		'exclusionDates',
		'exclusionRules',
		'status',
		'recurrenceDates',
		'recurrenceRules',
		'lastModified',
		'sequenceNumber',
		'summary'
	],
	#category : 'ICal-Core-Abstract'
}

{ #category : #'accessing-classifications' }
ICViewableCalendarEntry class >> classificationConfidential [
	^'CONFIDENTIAL'
	
]

{ #category : #'accessing-classifications' }
ICViewableCalendarEntry class >> classificationPrivate [
	^'PRIVATE'
]

{ #category : #'accessing-classifications' }
ICViewableCalendarEntry class >> classificationPublic [
	^'PUBLIC'
	
]

{ #category : #'accessing-classifications' }
ICViewableCalendarEntry class >> possibleClassifications [
	^Array
		with: self classificationPublic
		with: self classificationPrivate
		with: self classificationConfidential
	
]

{ #category : #'accessing-stati' }
ICViewableCalendarEntry class >> possibleStati [
	^OrderedCollection with: self statusCanceled
	
]

{ #category : #'accessing-stati' }
ICViewableCalendarEntry class >> statusCanceled [
	^'CANCELLED'
	
]

{ #category : #'instance creation' }
ICViewableCalendarEntry class >> summary: aString [
	^self new
		summary: aString;
		yourself
]

{ #category : #adding }
ICViewableCalendarEntry >> addCategory: aCategory [
	^self categories add: aCategory
]

{ #category : #adding }
ICViewableCalendarEntry >> addExclusionDate: aRecurrenceDate [
	^ self exclusionDates add: aRecurrenceDate
]

{ #category : #adding }
ICViewableCalendarEntry >> addExclusionRule: aRecurrenceRule [
	^self exclusionRules add: aRecurrenceRule
]

{ #category : #adding }
ICViewableCalendarEntry >> addRecurrenceDate: aDateAndTime [
	^self recurrenceDates add: aDateAndTime
]

{ #category : #adding }
ICViewableCalendarEntry >> addRecurrenceRule: aRecurrenceRule [
	^self recurrenceRules add: aRecurrenceRule
]

{ #category : #accessing }
ICViewableCalendarEntry >> attachments [
	^attachments
]

{ #category : #accessing }
ICViewableCalendarEntry >> attachments: aCollection [ 
	attachments := aCollection
]

{ #category : #status }
ICViewableCalendarEntry >> beCanceled [
	self status: self class statusCanceled
]

{ #category : #classification }
ICViewableCalendarEntry >> beConfidential [
	self classification: self class classificationConfidential
]

{ #category : #classification }
ICViewableCalendarEntry >> bePrivate [
	self classification: self class classificationPrivate
]

{ #category : #classification }
ICViewableCalendarEntry >> bePublic [
	self classification: self class classificationPublic
]

{ #category : #accessing }
ICViewableCalendarEntry >> categories [
	^categories
]

{ #category : #accessing }
ICViewableCalendarEntry >> categories: aCollection [ 
	categories := aCollection
]

{ #category : #classification }
ICViewableCalendarEntry >> classification [
	^classification
]

{ #category : #classification }
ICViewableCalendarEntry >> classification: aString [ 
	"see #possibleClassification on class side"
	classification := aString
]

{ #category : #accessing }
ICViewableCalendarEntry >> created [
	^created
]

{ #category : #accessing }
ICViewableCalendarEntry >> created: aDateAndTime [ 
	created := aDateAndTime
]

{ #category : #accessing }
ICViewableCalendarEntry >> exclusionDates [
	^exclusionDates
]

{ #category : #accessing }
ICViewableCalendarEntry >> exclusionDates: aCollection [ 
	exclusionDates := aCollection
]

{ #category : #accessing }
ICViewableCalendarEntry >> exclusionRules [
	^exclusionRules
]

{ #category : #accessing }
ICViewableCalendarEntry >> exclusionRules: aCollection [ 
	exclusionRules := aCollection
]

{ #category : #exporting }
ICViewableCalendarEntry >> exportOn: anExporter [
	super exportOn: anExporter.
	anExporter exportAttachments: self attachments.
	anExporter exportCategories: self categories.
	anExporter exportClassification: self classification.
	anExporter exportCreated: self created.
	anExporter exportExclusionDates: self exclusionDates.
	anExporter exportExclusionRules: self exclusionRules.
	anExporter exportStatus: self status.
	anExporter exportRecurrenceDates: self recurrenceDates.
	anExporter exportRecurrenceRules: self recurrenceRules.
	anExporter exportLastModified: self lastModified.
	anExporter exportSequenceNumber: self sequenceNumber.
	anExporter exportSummary: self summary
]

{ #category : #testing }
ICViewableCalendarEntry >> hasExclusionDates [
	^ self exclusionDates notEmpty
]

{ #category : #testing }
ICViewableCalendarEntry >> hasExclusionRules [
	^ self exclusionRules notEmpty
]

{ #category : #testing }
ICViewableCalendarEntry >> hasRecurrenceDates [
	^ self recurrenceDates notEmpty
]

{ #category : #testing }
ICViewableCalendarEntry >> hasRecurrenceRules [
	^self recurrenceRules notEmpty
]

{ #category : #testing }
ICViewableCalendarEntry >> hasSummary [
	^self summary notNil
]

{ #category : #'initialize-release' }
ICViewableCalendarEntry >> initialize [
	super initialize.
	self created: self dateAndTimeClass now.
	self categories: OrderedCollection new.
	self recurrenceDates: OrderedCollection new.
	self exclusionDates: OrderedCollection new.
	self attachments: OrderedCollection new.
	self recurrenceRules: OrderedCollection new.
	self exclusionRules: OrderedCollection new.
	self sequenceNumber: 0
]

{ #category : #status }
ICViewableCalendarEntry >> isCanceled [
	^self status = self class statusCanceled
]

{ #category : #classification }
ICViewableCalendarEntry >> isConfidential [
	^self classification = self class classificationConfidential
]

{ #category : #classification }
ICViewableCalendarEntry >> isPrivate [
	^self classification = self class classificationPrivate
]

{ #category : #classification }
ICViewableCalendarEntry >> isPublic [
	^self classification = self class classificationPublic
]

{ #category : #testing }
ICViewableCalendarEntry >> isRecurrent [
	^self hasRecurrenceRules
		or: [ self recurrenceDates notEmpty ]
]

{ #category : #accessing }
ICViewableCalendarEntry >> lastModified [
	^lastModified
]

{ #category : #accessing }
ICViewableCalendarEntry >> lastModified: aDateAndTime [ 
	lastModified := aDateAndTime
]

{ #category : #updating }
ICViewableCalendarEntry >> modified [
	self lastModified: self dateAndTimeClass now.
	self sequenceNumber: self sequenceNumber + 1
]

{ #category : #printing }
ICViewableCalendarEntry >> printOn: aStream [
	super printOn: aStream.
	self hasSummary ifTrue: [
		aStream
			nextPut: $(;
			nextPutAll: self summary;
			nextPut: $) ]
]

{ #category : #accessing }
ICViewableCalendarEntry >> recurrenceDates [
	^recurrenceDates
]

{ #category : #accessing }
ICViewableCalendarEntry >> recurrenceDates: aCollection [ 
	recurrenceDates := aCollection
]

{ #category : #accessing }
ICViewableCalendarEntry >> recurrenceRules [
	^recurrenceRules
]

{ #category : #accessing }
ICViewableCalendarEntry >> recurrenceRules: aCollection [ 
	recurrenceRules := aCollection
]

{ #category : #accessing }
ICViewableCalendarEntry >> sequenceNumber [
	^sequenceNumber
]

{ #category : #accessing }
ICViewableCalendarEntry >> sequenceNumber: anInteger [ 
	sequenceNumber := anInteger
]

{ #category : #status }
ICViewableCalendarEntry >> status [
	^status
]

{ #category : #status }
ICViewableCalendarEntry >> status: anObject [
	status := anObject
]

{ #category : #accessing }
ICViewableCalendarEntry >> summary [
	^summary
]

{ #category : #accessing }
ICViewableCalendarEntry >> summary: aString [ 
	summary := aString
]

{ #category : #updating }
ICViewableCalendarEntry >> updateEventWith: anEventOrCommand [ 
	self created: anEventOrCommand  created.
	self status: anEventOrCommand  status.
	self lastModified: anEventOrCommand lastModified
]
