// Register for Localytics
// 1. Register account if you do not already have one: http://analytics.localytics.com/login
// 2. Create a new application and copy the application key. 

var window = Ti.UI.createWindow({
	backgroundColor:'white'
});

// Require module
var Localytics = require('ti.localytics');

// Initialize logging by entering your application key (See step 2 above)
Localytics.initialize('5e2f144fdcdeb824f245cf5-a60a68f6-4815-11e1-a690-008545fe83d2');

// Turn debugging on or off (defaults to false)
//Localytics.debug(true);

// Log views
// NOTE: You should read the index.html in the /Documentation folder.
Localytics.logView("Home");

// Log events
// Events are logged using logEvent(title, parameters(not required)).
var logEvent = Ti.UI.createButton({
    title: 'Open view',
    top: 60, width: 200, height: 40
});

var logEventCount = 0;
logEvent.addEventListener('click', function() {
	// Event without any attributes
	Localytics.logEvent('Click');
	
	// Event with attributes
	// Attributes uses object literals
    Localytics.logEvent('click', { clickCount: ++logEventCount });
});

window.add(logEvent);

window.open();
