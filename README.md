# ICal
[![Build Status](https://travis-ci.org/juliendelplanque/pharo-ical.svg?branch=master)](https://travis-ci.org/juliendelplanque/pharo-ical)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

This project is a fork of http://smalltalkhub.com/#!/~pdebruic/iCal/ to create a full compatibility with the Pharo environments.

It provides objects to manipulate ICalendar objects (ie reading/writing).

Do not hesitate to check the wiki for examples, I'll try to make it usefull to get started with this lib!

## Load the package
To load the package in your image simply run:

```st
Metacello new
    baseline: 'ICal';
    repository: 'github://juliendelplanque/pharo-ical/src';
    load.
```

## Make this project a dependency of you project:
Simply add these lines to your Metacello configuration:

```st
spec baseline: 'ICal' with: [
    spec repository: 'github://juliendelplanque/pharo-ical/src' ].
```

# Development
To contribute to the project,

- Fork this repository and clone your fork somewhere on your computer.
- Switch to 'bleed' branch.
- Import ICal and ICal-Tests packages using filetree.
- Make some improvements.
- Commit your changes in Monticello.
- Commit your changes in the git repository.
- Propose a pull request on Github.

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
