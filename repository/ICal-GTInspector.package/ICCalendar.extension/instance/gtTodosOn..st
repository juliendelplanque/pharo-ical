*ICal-GTInspector
gtTodosOn: aComposite
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