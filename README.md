ICal
====

This project is a fork of http://smalltalkhub.com/#!/~pdebruic/iCal/ to create a full compatibility with the Pharo environments.

## Compatibility
The project currently works on:

- Pharo 3
- Pharo 4

## Load the package
To load the package in your image simply run:

~~~
Metacello new
    baseline: 'ICal';
    repository: 'github://juliendelplanque/pharo-ical/repository';
    load.
~~~

## Load the tests package
To run unit tests on your images you need to load ICal-Tests package.
To load it with all the dependencies needed, run:

~~~
Metacello new
    baseline: 'ICalTests';
    repository: 'github://juliendelplanque/pharo-ical/repository';
    load.
~~~

## Make this project a dependency of you project:
Simply add these lines to your Metacello configuration:

~~~
spec baseline: 'ICal' with: [
    spec repository: 'github://juliendelplanque/pharo-ical/repository' ].
~~~

# Misc
## Smalltalkhub's README (supported features)
iCalendar import and export. iCalendar is supported by Mozilla products, Apple iCal and even Microsoft Outlook.

Support for freebusy time is limited, the rest should work.

Based on work done by David Röthlisberger and Vera Fischer for SW2Calendar

- RFC 2445
- RFC 2446
- RFC 2447
- Wikipedia article
- broken clients

### vCalendar
iCalendar is Version 2 of vCalendar, so it's supported too. Status is same as iCalendar.

### vCard

- importing of versions 3.0 is 2.1 are supported
- exporting of verion 3.0 is supported
- RFC 2425
- RFC 2426
- Wikipedia Article
