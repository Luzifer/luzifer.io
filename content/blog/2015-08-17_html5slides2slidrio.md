---
date: 2015-08-17T00:13:45+02:00
media: /uploads/2015/08/17/slides.png
title: About converting HTML5-slides into PDFs…
---

Since the day [Ole](http://codestars.eu/), one of my colleagues, started promoting his service [slidr.io](http://slidr.io/) in the office, I was curious how to get the slides of the few talks I held into that service. Sadly I needed PDF files to get those slides into slidr.io and what did I have? Shiny HTML5 slides build using the [Google HTML5-slides library](https://code.google.com/p/html5slides/)…

Today I finally managed to convert my slides into a PDF suitable to upload to slidr.io and because I tried several methods and failed at all except one I want to share that knowledge with you, in case you also want to put your slides online as a PDF or upload them to a service only accepting PDFs.

## 1st attempt: [deck2pdf](https://github.com/melix/deck2pdf)

`deck2pdf` is a tool written in Java (yeah, I know…) promising to be able to convert several types of HTML5 slides into a PDF. Sadly it did not work for me as it spawned its built-in browser and then just sat there waiting for the end of the world… Even compiling from latest master myself (Java…) lead to no changes…

## 2nd attempt: Use [phantomjs](http://phantomjs.org/)

My second attempt already was that one finally leading to success: Use phantomjs to load the slides, save renderings of all slides and skip them forward one-by-one. Sadly I needed to put a small CSS sniplet into my slides in order to hide slides I did not want to see in my renderings:

```CSS
.slides > article.next, .slides > article.past, .slides > article.far-next {
  display: none !important;
  -webkit-transform: none;
}
```

This sniplet hides all but the current slide and ensures there is no transform done which will lead to really huge renderings with a lot of wasted space at the edges and you would need to cut them afterwards.

After manipulating my slides with that small sniplet the rest was just putting together a workflow using phantomjs to slide to the next slide every time and to save the renderings in the right order. I ended up with some lines of JavaScript code doing exactly this:

```javascript
var page = require('webpage').create(),
    system = require('system');

var address = system.args[1];
page.viewportSize = { width: 1024, height: 768 };

function pad(n, width) {
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

page.open(address, function (status) {
  if (status !== 'success') {
    console.log('Unable to load the address!');
    phantom.exit(1);
  } else {
    window.setTimeout(function () {
      var numSlides = page.evaluate(function() {
        return slideEls.length-1;
      })
      nextPage(0, numSlides);
    }, 2000);
  }
});

function nextPage(i, max_i) {
  page.render("output" + pad(i, 3) + ".png");
  page.evaluate(function() { nextSlide(); });

  if (i < max_i) {
    window.setTimeout(function(){ nextPage(i+1, max_i) }, 1000);
  } else {
    phantom.exit();
  }
}
```

Might look a bit confusing but in the end it just does the job without much overhead. Sure, you could include the CSS fix into the JavaScript in case you want to render slides you can't change locally but as I was able to edit every file locally I did not went that step and stopped at this state.

After you execute this script (saved as `render.js`) using `phantomjs render.js index.html` (`index.html` being the HTML file containing your slides) you will end with a bunch of PNG-images with your slides. If they look the way you want them to look you now can convert them into a PDF. For this task I used ImageMagick with just one simple command: `convert output*.png output.pdf`

Doing this might still be some manual work but the only other way I'm able to think about would be to do screenshots manually… Maybe this is not the way you want to convert your slides into a PDF… In my case the effort for the two slides I wanted to upload into [my slidr.io account](http://slidr.io/Luzifer) was maybe a bit too much but it worked and in case I'm holding talks in the future I'm able to use this method to convert them again…
