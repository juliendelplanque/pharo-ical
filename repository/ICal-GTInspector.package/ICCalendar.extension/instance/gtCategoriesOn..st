*ICal-GTInspector
gtCategoriesOn: aComposite
	<gtInspectorPresentationOrder: 5>

	aComposite table
		title: 'Categories';
		display: [ self categories ];
		column: 'Categories' evaluated: [ :each | each summary ].