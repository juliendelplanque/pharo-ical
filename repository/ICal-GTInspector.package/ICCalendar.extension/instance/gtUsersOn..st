*ICal-GTInspector
gtUsersOn: aComposite
	<gtInspectorPresentationOrder: 6>

	aComposite table
		title: 'Users';
		display: [ self users ];
		column: 'Common name'
		evaluated: [ :each | each commonName ]
		sortedBy: [ :x :y | x commonName < y commonName ];
		column: 'Email address' evaluated: [ :each | each emailAddress ].