*ICal-GTInspector
gtEventsOn: aComposite
	<gtInspectorPresentationOrder: 1>

	aComposite table
		title: 'Events';
		display: [ self events ];
		column: 'Summary' evaluated: [ :each | each summary ] sortedBy: [ :x :y | x start < y start ];
		column: 'Start time' evaluated: [ :each | each start ];
		column: 'End time' evaluated: [ :each | each end ].