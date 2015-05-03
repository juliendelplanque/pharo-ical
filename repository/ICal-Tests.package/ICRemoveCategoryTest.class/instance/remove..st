testing
remove: aString
	| eventsForCategory |
	category := calendar categoryWithSummary: aString.
	calendar removeCategory: category.
	eventsForCategory := calendar events select: [:event | event categories anyOne = category ].
	eventsForCategory do: [:event | event categories: OrderedCollection new ].