---
date: 2018-07-29T21:36:00+02:00
title: State of my home automation
media: /uploads/2018/07/29/influx.png
vgwort: 5531461b23c84d5b91cc4127af5cc614
---

Lately I had a chat on Twitter about the current state of my home automation triggered by a screenshot about temperature / humidity changes in my flat. In the end this led to me trying to explain my whole setup with a lot of links in just one direct message and we came to the conclusion a blog post would be a better way to transport my setup. So here it is: A (more or less) short overview of my setup.

## Basic services

The base of my setup is the software performing most of my automation tasks I set up: [Home Assistant](https://www.home-assistant.io/) is a software written in Python capable of directly communicating to 1120 different components being hardware as well as software products or custom scripts.

Most of the components I'm using are integrated using a MQTT server or are directly talking to third-party APIs.

Additionally I do have an "event system" set up which in the end is a Redis pub/sub connected to different software components creating messages and reacting on them. Some of those messages also do trigger switches inside Home Assistant using MQTT topics.

## Hardware components

As a hardware component, I needed to write an [own wraper](https://github.com/Luzifer/culmqtt) for, an USB-CUL is connected to my server to receive status messages from older FS20 door/window contacts. Formerly there were multiple FS20 power outlets but as those devices only supports a one-way connection and are not able to report their current state back to the software they got replaced.

The replacement for the FS20 as well as the EdiPlug power outlets are [Sonoff S20](https://www.itead.cc/smart-socket.html) devices. They do have a direct connection to my WiFi and are capable of reporting their state using MQTT so I do have a direct feedback whether the command was executed successfull, which was a problem with the FS20 devices.

To measure the temperature and humidity I'm using a [BME280](https://www.exp-tech.de/module/seeed-grove-system/7382/seeed-studio-grove-temp-humi-barometer-sensor-bme280) sensor connected to [Sonoff Dev](https://www.itead.cc/sonoff-dev.html) boards. Sadly at the moment those boards and sensors do not have a proper housing, which definitely is something to improve later on.

All of the Sonoff Dev boards also do have at least one [PIR motion sensor](https://www.exp-tech.de/module/seeed-grove-system/4287/seeed-studio-grove-pir-bewegungssensor) connected which controls the light in all rooms. I'm not sure when I touched a light switch the last time but it's quite a time now.

In some places instead of Sonoff S20 outlets I set up [Sonoff Pow](https://www.itead.cc/sonoff-pow.html) to have the chance to control the connected device and also to measure the power consumption which enables my automation for example to react on idle devices (power consumption below a certain limit for a certain time) and to switch them off entirely.

All of the Sonoff components are by default delivered with a Chinese firmware talking to some Chinese servers being not quite reliable and trustworthy. Therefore the firmware on all Sonoff devices was replaced by [Tasmota](https://github.com/arendst/Sonoff-Tasmota) before connecting them to my WiFi. That way I'm in control over those systems and they do not leak data into the web.

As the last hardware component I'm currently using LifX light bulbs in all rooms. They seamlessly integrate with Home Assistant without requiring a connection to the internet though they are indeed connected to the LifX cloud system as there are some left-over components of my former automation system requiring this access to the cloud-API.

## Additional suggar

All of the components above combined are doing a quite fine job and enable me to control them using the Home Assistant web interface on the one hand and with the automations in Home Assistant on the other hand. For example when leaving my flat the lights are turned off instantly while they are re-activated as soon as a movement is detected.

To trigger more complex actions which also contains systems not being connected to Home Assistant my "event system" also has a connected Telegram chat bot. There is no magic involved, just some regular expressions and reactions on those. This enables me to control for example my laptop through the chat bot: When going to bed a simple chat command is sufficient to trigger a whole bunch of actions including locking my laptop, setting my home automation into a pre-defined night mode and so on. On the other hand all of the components in my automation are capable of contacting my through the chat bot.

Regarding statistical data for example about the temperature and humidity sensors Home Assistant as well as the "event system" are reporting metrics into an InfluxDB which afterwards are displayed together with other metrics on a Grafana dashboard in my flat.

## Conclusion

Being in the process of automating my flat in a way not requiring too much tempering with the already present electrical installation (in the end it's a rented flat so I'm not allowed to modify everything) starting 2010 my system currently is in a state not being glued together from several different components and being prone to errors. Instead I'm currently mainly using components from two different hardware vendors and planning to even reduce this to only one vendor by replacing the LifX bulbs.

Seeing the current state of the system I'm quite pleased how well all those components are working together. Of course it is like every system: never finished as there always will be space to improve…
