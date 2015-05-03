ByRules are evaluated in the following order:  BYMONTH, BYWEEKNO, BYYEARDAY, BYMONTHDAY, BYDAY, BYHOUR,  BYMINUTE, BYSECOND and BYSETPOS as per rfc2445.

If the rule is applied to a ICRecurrenceFrequency of longer duration it will increase the number of occurrences and if it is applied to an ICRecurrenceFrequency of shorter duration it will decrease the number of occurrences.  

ByRules are applied after FREQ and INTERVAL and before UNTIL and COUNT.  Underspecified valeus are taken from the DSTART of the event.  