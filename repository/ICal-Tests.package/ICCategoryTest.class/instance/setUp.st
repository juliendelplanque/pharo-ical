running
setUp
	| categories |
	calendar := ICCalendar name: ' Test Calendar '.
	categories := OrderedCollection new.
	category1 := ICCategory summary: 'tennis club'.
	category1 textualDescription: 'this category is for tennis club events'.
	category1 color: 'red'.
	category2 := ICCategory summary: 'family'.
	category2 textualDescription: 'for family events'.
	category2 color: 'green'.
	categories := OrderedCollection with: category1 with: category2.
	calendar categories: categories