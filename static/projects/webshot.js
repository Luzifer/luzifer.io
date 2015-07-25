var page = require('webpage').create(),
    system = require('system');

browser_width = 1920

page.viewportSize = { width: browser_width, height: browser_width/(4/3) };
page.settings.webSecurityEnabled = false
page.settings.resourceTimeout = 5000
page.settings.localToRemoteUrlAccessEnabled = true

if (system.args.length === 1) {
  console.log('Usage: webshot.js <some URL>');
  phantom.exit();
}

page.open(system.args[1], function(status) {
  if (status !== 'success') {
    console.log('Unable to load the address!');
    phantom.exit();
  } else {
    window.setTimeout(function () {
      page.render('webshot.png');
      phantom.exit();
    }, 5000); // Change timeout as required to allow sufficient time
  }
});
