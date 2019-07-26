Extension { #name : #ICCalendar }

{ #category : #'*ICal-GTInspector' }
ICCalendar >> gtCategoriesOn: aComposite [
	<gtInspectorPresentationOrder: 5>

	aComposite table
		title: 'Categories';
		display: [ self categories ];
		column: 'Categories' evaluated: [ :each | each summary ].
]

{ #category : #'*ICal-GTInspector' }
ICCalendar >> gtEventsOn: aComposite [
	<gtInspectorPresentationOrder: 1>

	aComposite table
		title: 'Events';
		display: [ self events ];
		column: 'Summary' evaluated: [ :each | each summary ] sortedBy: [ :x :y | x start < y start ];
		column: 'Start time' evaluated: [ :each | each start ];
		column: 'End time' evaluated: [ :each | each end ].
]

{ #category : #'*ICal-GTInspector' }
ICCalendar >> gtFreeBusyOn: aComposite [
	<gtInspectorPresentationOrder: 4>

	aComposite table
		title: 'Free busy';
		display: [ self freeBusy ];
		column: 'Start time' evaluated: [ :each | each start ] sortedBy: [ :x :y | x start < y start ];
		column: 'End time' evaluated: [ :each | each end ].
]

{ #category : #'*ICal-GTInspector' }
ICCalendar >> gtJournalsOn: aComposite [
	<gtInspectorPresentationOrder: 3>

	aComposite table
		title: 'Journals';
		display: [ self journals ];
		column: 'Summary'
		evaluated: [ :each | each summary ]
		tags: [ :each | each isDraft ifTrue: [ 'Draft' ] ifFalse: [ 'Final' ] ]
]

{ #category : #'*ICal-GTInspector' }
ICCalendar >> gtTimezonesOn: aComposite [
	<gtInspectorPresentationOrder: 7>

	aComposite table
		title: 'Time zones';
		display: [ self timezones ];
		column: 'ID' evaluated: [ :each | each id ] sortedBy: [ :x :y | x id < y id ];
		column: 'Url' evaluated: [ :each | each url ];
		column: 'Last modified' evaluated: [ :each | each lastModified ].
]

{ #category : #'*ICal-GTInspector' }
ICCalendar >> gtTodosOn: aComposite [
	<gtInspectorPresentationOrder: 2>

	aComposite table
		title: 'Todos';
		display: [ self todos ];
		column: 'Summary' evaluated: [ :each | each summary ] sortedBy: [ :x :y | x due < y due ];
		column: 'Due time' evaluated: [ :each | each due ]
		tags: [ :each | each isCompleted
								ifTrue: [ 'Completed' ]
								ifFalse: [ 'Todo' ] ];
		column: 'Status' evaluated: [ :each |
			each isCompleted
				ifTrue: [ 'Done' ]
				ifFalse: [ 'Still to do' ] ]
]

{ #category : #'*ICal-GTInspector' }
ICCalendar >> gtUsersOn: aComposite [
	<gtInspectorPresentationOrder: 6>

	aComposite table
		title: 'Users';
		display: [ self users ];
		column: 'Common name'
		evaluated: [ :each | each commonName ]
		sortedBy: [ :x :y | x commonName < y commonName ];
		column: 'Email address' evaluated: [ :each | each emailAddress ].
]
