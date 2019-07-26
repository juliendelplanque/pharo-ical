"
This is the abstract event main class and provides generic functionality used by all kind of events.
It is the superClass of classes like Appointment, Todo or EventSerie.
We used here the composite pattern: an event can be an simple event or a collection of events called EventSerie.
On the class side, all the possible priorities are stored as strings. The user can select one of these priorities for every kind of event.
"
Class {
	#name : #ICJob,
	#superclass : #ICViewableCalendarEntry,
	#instVars : [
		'alarms',
		'duration',
		'geo',
		'location',
		'priority',
		'resources',
		'start',
		'textualDescription',
		'attendees'
	],
	#category : 'ICal-Core-Abstract'
}

{ #category : #'accessing-priorities' }
ICJob class >> highPriority [
	^1
]

{ #category : #'accessing-priorities' }
ICJob class >> lowPriority [
	^9
]

{ #category : #'accessing-priorities' }
ICJob class >> mediumPriority [
	^5
]

{ #category : #'accessing-priorities' }
ICJob class >> possiblePriorities [
	"Description: The priority is specified as an integer in the range
   zero to nine. A value of zero (US-ASCII decimal 48) specifies an
   undefined priority. A value of one (US-ASCII decimal 49) is the
   highest priority. A value of two (US-ASCII decimal 50) is the second
   highest priority. Subsequent numbers specify a decreasing ordinal
   priority. A value of nine (US-ASCII decimal 58) is the lowest
   priority.

   A CUA with a three-level priority scheme of 'HIGH', 'MEDIUM' and
   'LOW' is mapped into this property such that a property value in the
   range of one (US-ASCII decimal 49) to four (US-ASCII decimal 52)
   specifies 'HIGH' priority. A value of five (US-ASCII decimal 53) is
   the normal or 'MEDIUM' priority. A value in the range of six (US-
   ASCII decimal 54) to nine (US-ASCII decimal 58) is 'LOW' priority.

   A CUA with a priority schema of 'A1', 'A2', 'A3', 'B1', 'B2', ...,
   'C3' is mapped into this property such that a property value of one
   (US-ASCII decimal 49) specifies 'A1', a property value of two (US-
   ASCII decimal 50) specifies 'A2', a property value of three (US-ASCII
   decimal 51) specifies 'A3', and so forth up to a property value of 9
   (US-ASCII decimal 58) specifies 'C3'."
	^0 to: 9
]

{ #category : #'accessing-priorities' }
ICJob class >> undefinedPriority [
	^0
]

{ #category : #comparing }
ICJob >> <= aJob [
	^self start <= aJob start
]

{ #category : #accessing }
ICJob >> addAlarm: anAlarm [
	^self alarms add: anAlarm
]

{ #category : #accessing }
ICJob >> addAttendee: anAttendee [
	self attendees add: anAttendee
]

{ #category : #accessing }
ICJob >> addAttendees: someAttendees [
	self attendees addAll: someAttendees
]

{ #category : #accessing }
ICJob >> addTextualDescription: aString [
	"for polymorphism with ICJournal"
	self textualDescription: aString.
	^aString
]

{ #category : #accessing }
ICJob >> alarms [
	^alarms
]

{ #category : #accessing }
ICJob >> alarms: aCollection [ 
	alarms := aCollection
]

{ #category : #accessing }
ICJob >> attendees [
	^attendees ifNil:[attendees:=Set new]
]

{ #category : #priority }
ICJob >> beHighPriority [
	self priority: self class highPriority
]

{ #category : #priority }
ICJob >> beLowPriority [
	self priority: self class lowPriority
]

{ #category : #priority }
ICJob >> beMediumPriority [
	self priority: self class mediumPriority
]

{ #category : #accessing }
ICJob >> duration [
	^duration
]

{ #category : #accessing }
ICJob >> duration: aDuration [ 
	duration := aDuration
]

{ #category : #accessing }
ICJob >> end [
	self subclassResponsibility
]

{ #category : #exporting }
ICJob >> exportOn: anExporter [
	super exportOn: anExporter.
	anExporter exportPriority: self priority.
	anExporter exportDescription: self textualDescription.	
	anExporter exportGeo: self geo.
	anExporter exportLocation: self location.
	anExporter exportResources: self resources.
	anExporter exportStart: self start.
	anExporter exportDuration: self duration.
	self alarms do: [ :each |
		anExporter export: each ]
]

{ #category : #accessing }
ICJob >> geo [
	^geo
]

{ #category : #accessing }
ICJob >> geo: aPoint [
	"This property specifies information related to the global
   position for the activity specified by a calendar component."

 	"Description: The property value specifies latitude and longitude, in
   that order (i.e., 'LAT LON' ordering).

	aPoint is a point of floats"
	geo := aPoint
]

{ #category : #calculation }
ICJob >> hours [
	| diff |
	diff := self end - self start.
	^diff hours + (diff minutes / 60) asFloat.
]

{ #category : #'initialize-release' }
ICJob >> initialize [
	super initialize.
	self alarms: OrderedCollection new.	
	self resources: OrderedCollection new.
	self beMediumPriority.

	
	
]

{ #category : #priority }
ICJob >> isHighPriority [
	^self priority = self class highPriority
]

{ #category : #priority }
ICJob >> isLowPriority [
	^self priority = self class lowPriority
]

{ #category : #priority }
ICJob >> isMediumPriority [
	^self priority = self class mediumPriority
]

{ #category : #testing }
ICJob >> isValidForDate: aDate [
	self subclassResponsibility
]

{ #category : #accessing }
ICJob >> location [
	^location
]

{ #category : #accessing }
ICJob >> location: aString [ 
	location := aString
]

{ #category : #priority }
ICJob >> priority [
	^priority
]

{ #category : #priority }
ICJob >> priority: aString [
	"see #possiblePriorites on class side"
	priority := aString
]

{ #category : #accessing }
ICJob >> resources [
	^resources
]

{ #category : #accessing }
ICJob >> resources: aCollection [ 
	resources := aCollection
]

{ #category : #accessing }
ICJob >> start [
	^start
]

{ #category : #accessing }
ICJob >> start: aDateAndTime [ 
	start := aDateAndTime
]

{ #category : #testing }
ICJob >> startsInHour: aTimestamp [ 
	self subclassResponsibility 
]

{ #category : #accessing }
ICJob >> textualDescription [
	^textualDescription
]

{ #category : #accessing }
ICJob >> textualDescription: aString [ 
	textualDescription := aString
]

{ #category : #actions }
ICJob >> updateEventWith: anEventOrCommand [ 
	super updateEventWith: anEventOrCommand .
	
	self summary: anEventOrCommand summary.
	self categories: anEventOrCommand categories.
	self textualDescription: anEventOrCommand textualDescription.
	self status: anEventOrCommand status.
	self priority: anEventOrCommand priority.
]
