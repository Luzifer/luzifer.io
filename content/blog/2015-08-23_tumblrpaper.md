---
date: 2015-08-23T19:27:40+02:00
media: /uploads/2015/08/23/2015-08-23-17.49.03.jpg
title: Set phone wallpaper from Tumblr blog
---

For some time now I was using a live wallpaper on my Android phone to cycle through a bunch of wallpapers, stored on the internal storage of my phone, at every unlock but even if you got several wallpapers there is a time you're fed up of seeing them every time you unlock your phone.

At least this was my situation when I thought about a source and a solution to have my wallpapers changed more often and without the hassle to search new wallpapers from different sources and copy them to the phone…

The solution I came up with is a quite easy one: At first you need an [IFTTT account](https://ifttt.com/) and a recipe for this. Also you will need to install the [IFTTT app](https://ifttt.com/products) on your phone. Even though the recipe is called "from Tumblr" you can later on use any other source for your wallpapers as long as they have about the same screen ratio as your phone. You can find the recipe I used (which is working with my script below) here:

{{< img src="/uploads/2015/08/23/Screen-Shot-2015-08-23-at-20.06.41.png" alt="IFTTT Recipe: Update phone wallpaper from Tumblr connects maker to android-device" href="https://ifttt.com/view_embed_recipe/318502-update-phone-wallpaper-from-tumblr" >}}

The second component a bit more complex to set up as you will need a server or a computer being able to run a python script by using a cron job. If you just want to be able to update your phone wallpaper manually by executing a script you also can do that with the script below.

To get it running on your machine you need python (available on every Linux and Mac OSX) and a small library you can get using this command: `pip install requests`

If you want to use the script I used you need to get your API key from Tumblr. For this just [register an application](https://www.tumblr.com/oauth/apps) on the Tumblr site and copy the "OAuth Consumer Key" into the `tumblr_key` field in the script. Additionally you will need the secret key (`maker_key` field) for the IFTTT Maker channel. You can find it on the [channels page](https://ifttt.com/maker). When you've configured these two secrets you're ready to run the script and you will get an update of your phones wallpaper.

(To change the source just adjust the `tumblr_blog`. If you don't, be warned: Images might be NSFW or even get you in trouble with your significant other…)

For a one-time execution just run `python walltumblr.py` (or any other name you saved the script to). To set up a cron job periodically changing your phones wallpaper please consult for example [StackOverflow](http://stackoverflow.com/search?q=how+to+set+up+cron).

```python
#!/usr/bin/env python

from __future__ import division
import random, requests, json

conf = {
  "tumblr_key": "<put your key here>",
  "tumblr_blog": "luziferus.tumblr.com",
  "tumblr_limit": 20,

  "maker_event": "walltumblr",
  "maker_key": "<put your key here>",

  "ratio_target": 1440 / 2560,
  "ratio_max_deriv": 0.2,
}

random.seed()

tumblr_url = "http://api.tumblr.com/v2/blog/{tumblr_blog}/posts/photo?api_key={tumblr_key}&limit={tumblr_limit}".format(**conf)
maker_url = "https://maker.ifttt.com/trigger/{maker_event}/with/key/{maker_key}".format(**conf)

tumblr = requests.get(tumblr_url).json()
posts = tumblr["response"]["posts"]

image_url = None

while True:
  post_no = random.randint(0,conf["tumblr_limit"]-1)

  img = posts[post_no]["photos"][0]["original_size"]

  ratio = img["width"] / img["height"]
  image_url = img["url"]

  if abs(conf["ratio_target"] - ratio) <= conf["ratio_max_deriv"]:
    break

print "Sending image {}".format(image_url)

maker_data = {
  "value1": image_url,
}
maker_headers = {
  "Content-Type": "application/json",
}
requests.post(maker_url, data=json.dumps(maker_data), headers=maker_headers)
```
