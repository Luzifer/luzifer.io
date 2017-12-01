---
date: 2017-12-01T10:52:00+01:00
title: AWS Fargate - I'm dissapointed, again
#media: /uploads/2017/09/29/engineer_robot.jpg
#vgwort: 59ca4ecc6042477eaae9f7439bd7ea96
---

It's now close to seven years I'm working with AWS technologies and I really like the concept of having no more hardware to maintain. Just spawning instances and having them work for you: If they cause trouble they are automatically replaced and everything is fine again without me having to take any action. Also I was working with AWS ECS for several years at Jimdo and I liked it.

A few days ago AWS announced Fargate which in the end is a managed and shared ECS cluster. You don't have to care about the stack, don't pay for the instances and yeah... In the end just run Docker containers without having to care about anything.

Yesterday I ran some calculations whether it does pay off to switch from my Hetzner machine for 50 EUR per month to running my already containerized services on Fargate. Shouldn't have done that!

![](/uploads/2017/12/01/fargate.png)

The smallest service possible having only 0.5 GB of memory and a quarter of a vCPU already costs 13 USD per month... So for my nearly 80 containers on my host running as the smallest size possible would cost around 1100 USD per month. More than 1000 USD for 80 containers compared with a 50 EUR machine idling most of the time having capacity for several more services based on CPU, memory and also network.

Well done AWS. Another service way too pricy for non-commercial customers to use.
