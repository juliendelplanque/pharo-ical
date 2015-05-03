weeks
daysOfWeekFor: someDates
|limit daysOfWeek |

limit:=7 min: someDates size.
daysOfWeek :=Array new: limit. 
1 to: limit do:[:index | daysOfWeek at: index put: (self dayLetterCodeFor: (someDates at: index) )].
^	daysOfWeek asSet