This is the abstract event main class and provides generic functionality used by all kind of events.
It is the superClass of classes like Appointment, Todo or EventSerie.
We used here the composite pattern: an event can be an simple event or a collection of events called EventSerie.
On the class side, all the possible priorities are stored as strings. The user can select one of these priorities for every kind of event.