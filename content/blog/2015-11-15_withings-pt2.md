---
date: 2015-11-15T10:24:32+01:00
media: /uploads/2015/08/02/_MG_3002.jpg
title: Three more months with Withings
vgwort: 24c07deb32664f45a344c28c1725f94b
---

On beginning August I already wrote a post about [my experiences with the Pulse Ox](https://ahlers.me/blog/my-experiences-with-the-pulse-ox). Since then there were three more months with experiences with Withings products, their support and also the attempt to integrate the data into the automation of my life.

Lets start with something positive: The broken widget on the web dashboard has been fixed! The reason for the widget to be broken was an error in the mobile app which didn't send the required data. (Don't ask me why one widget is able to show the data and one isn't. Obviously the app syncs data twice in different qualities...)

Now, back to those parts of my experiences I'm writing this post about. The mobile app ought to get background synchronization - or at least this was what I understood from a support ticket... Sadly even several versions later there is no background sync. So for me to have the step data synched from the Pulse Ox to the Withings server I need to wait for the Pulse to sync with my phone (or trigger a manual sync). Afterwards my phone knows about the data but even after days the data is not synched with the server. To get this sync I need to manually open the app and do a "refresh-pull" in the timeline. This will trigger a sync between the app and the server. For me this is a show stopper when its about automatically processing that data. Getting my data with several days delay or having to do manual actions for the process is just not acceptable.

Speaking about the API, Withings is using an API protected using OAuth 1.0. In general I don't like the 1.0 version of OAuth but I get around. What really pisses me is the fact Withings is requiring the OAuth parameters to be sent inside the query string. Sure, this is something the OAuth standard makes possible but its certainly not common practise.

After having found a way to convince the OAuth library to do this there are more issues: Either the documentation is deprecated or they just broke their API. There are some endpoints which just don't work. Sadly I wanted to use that endpoint but couldn't which then requires me to work around that broken endpoint and use more resources (including the time to build that workarounds) go get to the same results.

Before writing down everything else being wrong with that API I'd like to reference an article by Kate Jenkins: [Top Six Things You Need To Know About The Withings API](https://gist.github.com/katemonkeys/e17580777b57915f5068)

Having spoken about the support in my last article I'd like to mention their response times improved. Now they only need 8 days to respond to a ticket (instead of the previous 9 days) and they do respond with an answer instead of just asking whether the issue has been gone in the meantime. Sadly the answer they send me had nothing to do with my question. Maybe I need to phrase my tickets in french instead of english? Too bad my french isn't good enough for this...

After making the same bad experience over months now my support for their products isn't available anymore. Currently I'm strongly considering to switch back to FitBit products and even ditch and replace the Withings scale I had good experiences with in the last years.
