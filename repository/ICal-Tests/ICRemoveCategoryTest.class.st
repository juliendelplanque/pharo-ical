Class {
	#name : #ICRemoveCategoryTest,
	#superclass : #ICTest,
	#instVars : [
		'calendar',
		'category'
	],
	#category : 'ICal-Tests-Core'
}

{ #category : #testing }
ICRemoveCategoryTest >> remove: aString [
	| eventsForCategory |
	category := calendar categoryWithSummary: aString.
	calendar removeCategory: category.
	eventsForCategory := calendar events select: [:event | event categories anyOne = category ].
	eventsForCategory do: [:event | event categories: OrderedCollection new ].
]

{ #category : #running }
ICRemoveCategoryTest >> setUp [
	calendar := ICCalendar new.
	category := ICCategory summary: 'irishdance'.
	category
		color: 'SpringGreen';
		textualDescription: 'for irishdace events like trainings or dancing shows'.
	calendar addCategory: category.
]

{ #category : #testing }
ICRemoveCategoryTest >> testRemove [
	| numCats |
	numCats := calendar categories size.
	
	self assert: (calendar categories includes: category).
  	self remove: 'irishdance'.
  	self assert: (calendar categories size = (numCats - 1)).
	self deny: (calendar categories includes: category).
  	self should: [ calendar categoryWithSummary: 'irishdance' ] raise: Error
  
]
