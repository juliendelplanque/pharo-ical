I am the representation of a RECUR ical's rule.

According to RFC 2445,
The purpose of this object is: 'This value type is used to identify properties that contain a recurrence rule specification.'

I have some class message to instanciate me with predefined frequency.
For example:

ICRecurrenceRule daily. "Create a daily reccurence rule."
ICRecurrenceRule minutely. "Create a minutely reccurence rule."

I can only take frequencies defined in the array returned bu the message ICRecurrenceRule>>possibleFrequencies and I have class message that wrap each frequency.