---
date: 2017-09-29T16:10:00+02:00
title: Sorry, I did not understand the request
media: /uploads/2017/09/29/engineer_robot.jpg
vgwort: 59ca4ecc6042477eaae9f7439bd7ea96
---

As a huge fan of automating things (I'd automate everything if it would be possible) I'm using a chat-bot for quite a time doing something like "chat-ops" but for my home automation. Back when I heared about Amazon releasing Alexa together with the [Echo device series](http://amzn.to/2fDE7bT) I was amazed: Now I would no longer need to type my requests and use a format my bot understands (it does not have natural language processing)...

Now fast forward 7 months to the present day I've got more than half a year of experience with Alexa, not only using the Echo but also using [Reverb](https://play.google.com/store/apps/details?id=agency.rain.android.alexa) on my Android device and I think it's time to recap my experiences.

Lets start with porting my chat-bot to Alexa: That should be fairly easy, right? Or at least Alexa should be able to understand my keywords and trigger my bot to execute the appropriate actions, right? Nope. Just a plain nope. Sure, you can write own skills for Alexa: They have to exist on Lambda, they are summed up under the skill so you probably could tell "Alexa, tell ava to turn on the phone charger!" and Alexa might understand that...

Well, then lets at least use the existent skills to control my stuff. For example Alexa can control my lights (LifX bulbs). Most of the time this works sufficiently but in the end I do have "scenes" inside my chat-bot (called "Ava") which controls not just one bulb or one room but multiple rooms with different light settings. As an example there is the scene "beforesleep" which adjust light colors, dims lights, switches off the lights in the living room and turns on those in the bedroom... Okay this might be possible through Alexa but then there is a more advanced functionality: My lights are also controlled through location boundaries. I leave my flat, lights are switched off... I'm entering, lights are adjusted and switched on. So do I really trigger scenes myself? Rarely.

But then I do have remote controlled power outlets. Those I do need to trigger manually so yay, finally a usecase for Alexa! And again a disappointing "Nope!". I'm using a combination of FS20 outlets and [EdiPlug](http://www.edimax.com/edimax/merchandise/merchandise_detail/data/edimax/me/home_automation_smart_plug/sp-2101w/)s... You might already guess: Both are not supported by Alexa. The FS20 are controlled using [FHEM](https://fhem.de/) and a CUL attached to my home server. The EdiPlugs do have an XML API which is then controlled through a [Go daemon I wrote myself](https://github.com/Luzifer/ediplug_ctrl). Are those wrappers attachable to Alexa? Maybe, when writing an own skill for it...

As the support for Phillips Hue raised (which uses a bridge to control the Hue light bulbs) there finally was a chance to attach those outlets to Alexa: I wrote [another daemon](https://github.com/Luzifer/fhemhue) to expose FHEM switches to Alexa. So now I'm able to tell Alexa to turn on my electric kettle! (Then Alexa triggers the "bridge", which triggers FHEM, which triggers the CUL, which sends a radio signal to the FS20 outlet attached to the kettle...)

Now everything is fine? Sadly again another "Nope!"... I'm using Alexa in German language. So calling the dashboard I do have set up here "Dashboard" does not work: When set to german Alexa does not understand a single word english... And though I'm using the word "dashboard" in daily conversations with other german speaking people it's still an english word. So lets call the device "Bildschirm" (german for screen) because in the end a screen is switched on and off. Now every time I tell Alexa to switch on the screen she asks me "Which device?"... Yeah, great. I just told you? Maybe listen to me? Well repeating "Bildschirm" for her to understand... Suddenly my bathroom light turns on. What?

Speaking of Alexas capabilities to understand me: I'm not speaking one of those dialects even a german will not understand. I'm speaking a quite clear german (we call that "Hochdeutsch", which is what you would learn when learning german)... Though when I tell Alexa to turn on my shower (she would trigger a change in my light automation, not the faucet itself) she feels insulted... When telling her to enable my phone charger, she doesn't know how to help me or turns on my kettle... Well, nope? I clearly expressed what I'm expecting and there is no way to mistake the german word "Ladegerät" (charger) for "Wasserkocher" (kettle). It's just not possible.

But enough of home automation: Obviously this does not work as expected by me... There are several million other skills! (Yeah, maybe I'm slightly exaggerating...) There must be a good use for Alexa... I've enabled the skill (back then when skills needs to be activated before use) to retrieve tide gauge reading of the Elbe river. Did I use it? Nah... When there is no giant flood I just don't care about that reading...

So what does Alexa do for me? She creates countdown timers! (Sometimes she creates a one minute timer when I request a seven minute timer - also those two are not even close words in the german language - but most of the time this works quite fine even though Ava also can do that for me: "timer 7m" and even "timer 12h7m45s"...)
  
And all the other tasks? Well, some of them are controlled by motion sensors in my flat and the rest is triggered through an event-system I implemented to react on different types of messages from several services (something like IFTTT but with more code and more possibilities) or if it needs my input, the events are created by Ava based on my chat input...

Then there is another thing I've experienced with Alexa: My trigger-word indeed is "Alexa" but sometimes when being in a voice-chat on Teamspeak or Discord Alexa suddenly responds to something I said in that conversation. I've asked the others whether they understood that I asked Alexa a question: They didn't... Nobody could explain why Alexa was triggered... On other occasions my timer expired and Alexa is giving signals my tea is done and I try to "Alexa, Stop!" her... Once, twice, thrice... Maybe she forgot her own name? Ah the fourth try worked...

Another really cool feature: Sometimes I'm watching Twitch streams having the sound routed to my sound system and when the streamer decides to mess around with Alexa owners they just can do that! (There even are news articles about TV stations reporting about Alexa and triggering her in hundreds of flats...)

Overall what did I buy when getting an Amazon Echo? I got a speaker, I'm not using to blast music because that's a job for my sound system, which is capable of misunderstanding my requests and most of the time isn't used because it can't trigger things I want to trigger. **Great deal!**

_(Header image ["Robot" by william hartel](https://www.flickr.com/photos/132321727@N02/16863272554))_
