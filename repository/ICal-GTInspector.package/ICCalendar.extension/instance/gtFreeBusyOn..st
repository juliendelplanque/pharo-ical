*ICal-GTInspector
gtFreeBusyOn: aComposite
	<gtInspectorPresentationOrder: 4>

	aComposite table
		title: 'Free busy';
		display: [ self freeBusy ];
		column: 'Start time' evaluated: [ :each | each start ] sortedBy: [ :x :y | x start < y start ];
		column: 'End time' evaluated: [ :each | each end ].