Class {
	#name : #ICImporter,
	#superclass : #Object,
	#instVars : [
		'fileContent',
		'components',
		'calendar'
	],
	#category : 'ICal-Core-IO'
}

{ #category : #importing }
ICImporter >> addComponentsToCalendar [
	self components do: [ :each |
			self calendar addComponent: each ]
]

{ #category : #accessing }
ICImporter >> calendar [
	^calendar
]

{ #category : #accessing }
ICImporter >> calendar: aCalendar [ 
	calendar := aCalendar
]

{ #category : #accessing }
ICImporter >> components [
	^components
]

{ #category : #accessing }
ICImporter >> components: aCollection [ 
	components := aCollection
]

{ #category : #synchronizing }
ICImporter >> deleteComponentsNotInFile: aCollection [

	| uids |
	uids := (self calendar components collect: [ :each | each uid ]) asOrderedCollection.
	aCollection do: [ :each | uids remove: each uid ifAbsent: [nil]].
	
	uids do: [ :uid | self calendar removeComponentWithUid: uid ].
]

{ #category : #accessing }
ICImporter >> fileContent [
	^fileContent
]

{ #category : #accessing }
ICImporter >> fileContent: aString [ 
	fileContent := aString
]

{ #category : #actions }
ICImporter >> import [
	self parseFile.
	self addComponentsToCalendar
]

{ #category : #actions }
ICImporter >> parseFile [
	| importedCalendar |
	importedCalendar := ICCalendarHandParser parseCalendarString: self fileContent.
	self components: importedCalendar components asOrderedCollection
]

{ #category : #actions }
ICImporter >> synchronize [
	self parseFile.

	"synchronize events with known ids"
	self synchronizeComponents: (self components select: [:item |
		item uid ~= 0 and: [ item uid notNil ]]).

	"add events with unknown ids"
	self components  do: [ :component |
		component uid = 0 ifTrue: [self calendar addComponent: component]].
]

{ #category : #synchronizing }
ICImporter >> synchronizeComponents: aCollection [
	
	self deleteComponentsNotInFile: aCollection.
	self updateOrAddComponentsInFile: aCollection.
]

{ #category : #synchronizing }
ICImporter >> updateOrAddComponentsInFile: aCollection [

	aCollection do: [ :each | 
		(self calendar includesComponentWithUid: each uid) 
			ifTrue: [ self calendar removeComponentWithUid: each uid ] .
		self calendar addComponent: each ]
]
