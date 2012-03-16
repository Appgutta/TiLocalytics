# Ti.Localytics Module

## Description
Module for using Localytics in your Titanium application

## Accessing the Localytics Module
To access this module from JavaScript, you would do the following:

	var Localytics = require("ti.localytics");

## Functions

### initialize(string apiKey)
Initializes your Localytics session. Get the application key from Localytics website.

	Localytics.initialize('55e5e5e5e5e5e5e5e5e5e5e5-6a6a6a6a-1111-22a2-k111-1111b111b1');

### debug(bool)
Turn debugging on or off. Defaults to false.

	Localytics.debug(true);
		
### logEvent(string event[, dictionary properties])
Log events fired in your application. 

#### This will be accessible under "Events" in the Localytics dashboard.
	
	var button = Ti.UI.createButton({
		title: "Open settings"
	});
	
	button.addEventListener("click", function() {
		// Without attributes
		Localytics.logEvent("click");
		
		// With attributes
		Localytics.logEvent("click", {action: "settings"});
	});

### logView(string view)
As localytics doesnt provide any automatic logging of views, this has to be fired on every view/window you are opening.
A good approach would be to add this to the eventlistener when opening a new view or window.

#### This will be accessible under "Screens" in the Localytics dashboard.
	
	// Main window
	var win = Ti.UI.createWindow({backgroundColor: "white", viewName: "Main"});
	Localytics.logView(win.viewName);
	
	var openView = Ti.UI.createButton({
		title: "Open settings view"
	});
	
	openView.addEventListener("click", function() {
		Localytics.logView("Settings");
		// ... Code for opening a new view
	});
	
	var openWindow = Ti.UI.createButton({
		title: "Open info window"
	});
	
	openWindow.addEventListener("click", function() {
		Localytics.logView("Information");
		// ... Code for opening a new window
	});
	
	win.add(openView, openWindow);
	win.open();
	
NOTE: This function requires PREMIUM membership at Localytics.

## Usage
See example.

## Author
Chris Magnussen

## Module History

View the [change log](changelog.md) for this module.

## Feedback and Support
Please direct all questions, feedback, and concerns to [chris@appgutta.no](mailto:chris@appgutta.no?subject=Localytics%20Module).

## License
Copyright(c) 2012 by Appgutta, DA. All Rights Reserved. Please see the LICENSE file included in the distribution for further details.

Localytics is Copyright(c) 2008-2012 by Char Software, Inc.

Usage of this module is subject to the Terms of Service agreement of Char Software, Inc.
as well as your Terms of Service agreement with Appcelerator, Inc.