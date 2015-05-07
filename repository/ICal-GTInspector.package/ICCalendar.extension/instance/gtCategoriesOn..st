*ICal-GTInspector
gtCategoriesOn: aComposite
	<gtInspectorPresentationOrder: 44>

	aComposite table
		title: 'Categories';
		display: [ self categories ];
		column: 'Categories' evaluated: [ :each | each summary ].