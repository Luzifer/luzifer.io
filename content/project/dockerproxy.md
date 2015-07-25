---
date: 2015-07-25T20:13:14+02:00
project_link: https://github.com/Luzifer/dockerproxy
project_tag: server
screenshot_prefix: dockerproxy
subtitle: Small application to shield HTTP exporting Docker containers
title: dockerproxy
---

## Idea behind this

DockerProxy is a small application to shield HTTP exporting Docker containers. The proxy supports SNI to shield the containers with HTTPs certificates. To discover the containers the Docker daemon needs to listen on a tcp port which should be shielded by a firewall to ensure the security of the Docker host.

## Project links

- [Github](https://github.com/Luzifer/dockerproxy)
