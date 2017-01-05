// Initialize Highlight.js
hljs.initHighlightingOnLoad();

// Configure and activate Google Analytics
var gaProperty = 'UA-13186236-5';
var gaDisableStr = 'ga-disable-' + gaProperty;

if (document.cookie.indexOf(gaDisableStr + '=true') > -1) {
  window[gaDisableStr] = true;
}

var _gaq = _gaq || [];
_gaq.push(['_setAccount', gaProperty]);
_gaq.push(['_gat._anonymizeIp']);
_gaq.push(['_gat._forceSSL']);
_gaq.push(['_setSiteSpeedSampleRate', 100]);
_gaq.push(['_trackPageview']);
(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

// Opt-out function
function gaOptout() {
  document.cookie = gaDisableStr + '=true; expires=Thu, 31 Dec 2099 23:59:59 UTC; path=/';
  window[gaDisableStr] = true;
}

// Configure cookie-consent overlay
window.cookieconsent_options = {
  "message":"This website uses cookies to ensure you get the best experience on our website",
  "dismiss":"Got it!",
  "learnMore":"More info",
  "link":null,
  "theme":"light-floating"
};
