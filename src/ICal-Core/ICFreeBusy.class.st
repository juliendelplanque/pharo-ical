"
I am the representation of a VFREEBUSY ical's object.

According to RFC 2445,
The purpose of this object is: ""The property defines one or more free or busy time intervals.""
"
Class {
	#name : #ICFreeBusy,
	#superclass : #ICCalendarEntry,
	#instVars : [
		'end',
		'start',
		'duration'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #accessing }
ICFreeBusy class >> iCalType [
	^'VFREEBUSY'
]

{ #category : #'double-dispatch' }
ICFreeBusy >> addToCalendar: aCalendar [
	aCalendar addFreeBusy: self
]

{ #category : #accessing }
ICFreeBusy >> duration [
	^duration
]

{ #category : #accessing }
ICFreeBusy >> duration: aDuration [ 
	duration := aDuration
]

{ #category : #accessing }
ICFreeBusy >> end [
	^end
]

{ #category : #accessing }
ICFreeBusy >> end: aDateAndTime [ 
	end := aDateAndTime
]

{ #category : #exporting }
ICFreeBusy >> exportOn: anExporter [
	super exportOn: anExporter.
	anExporter exportStart: self start.
	anExporter exportEnd: self end.	
	anExporter exportDuration: self duration
]

{ #category : #accessing }
ICFreeBusy >> start [
	^start
]

{ #category : #accessing }
ICFreeBusy >> start: aDateAndTime [ 
	start := aDateAndTime
]
