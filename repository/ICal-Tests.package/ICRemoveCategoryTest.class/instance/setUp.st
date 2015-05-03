running
setUp
	calendar := ICCalendar new.
	category := ICCategory summary: 'irishdance'.
	category
		color: 'SpringGreen';
		textualDescription: 'for irishdace events like trainings or dancing shows'.
	calendar addCategory: category.