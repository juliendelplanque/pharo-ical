private
createTodo
	^(ICTodo summary: 'todo1')
				textualDescription: 'testest';
				due: (self dateAndTimeClass
							year: 2005
							month: 6
							day: 14
							hour: 12
							minute: 9
							second: 00);
				lastModified: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31);
				created: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31);
				completed: (self dateAndTimeClass 
							year: 2005
							month:6
							day: 14
							hour: 11
							minute: 2
							second: 31);
				beHighPriority;
				beCompleted;
				yourself.