*ICal-GTInspector
gtTimezonesOn: aComposite
	<gtInspectorPresentationOrder: 48>

	aComposite table
		title: 'Time zones';
		display: [ self timezones ];
		column: 'ID' evaluated: [ :each | each id ] sortedBy: [ :x :y | x id < y id ];
		column: 'Url' evaluated: [ :each | each url ];
		column: 'Last modified' evaluated: [ :each | each lastModified ].