---
date: 2018-09-06T22:04:00+02:00
title: "Go 1.11 dependency management: Hell NO!"
vgwort: 268e1713a0404f53b070bf2ab306299e
---

Some days ago [Go 1.11 was released](https://tip.golang.org/doc/go1.11) and with that release we now have a dependency management tool packed into the go binary itself: We've got [Go Modules](https://github.com/golang/go/wiki/Modules) to play with. Go modules derived from the `vgo` test and takes quite a different approach than all the previous vendoring tools (including `dep`).

But lets start at the beginning of a new project: I've created a new folder, added a `main.go` with some code and some imports. Good to go, lets `export GO111MODULE=on` and go a `go mod init`. After some time thinking about my dependencies I now have a `go.mod` and a `go.sum` file. Thats all: No more `vendor` folder, no more vendoring commits adding a slim 500k lines of Go code to the project!

Well, thinking twice what was the initial reason we began vendoring Go code in a `vendor` folder and building tools around that folder? The reason was we're not living in a perfect world but are working with stupid people: They force push to Git repos, don't version their code and if they add versions they sometimes just pull versions from their repository. Also they tend to change their Github usernames or delete repos or even the whole account.

Now with Go modules we're back at the point of time before all of the vendoring happened: We don't have a copy of the third party source code. So if any of the above happens (or maybe Github is just down) our `go build` will look at us and start running around being confused about missing dependencies. Oh well, as the person having successfully built the last commit **I** do have the required dependencies. Your bad you don't.

Go modules do fetch the dependencies basically through a `go get` like it was in the old times. So we will again experience all the problems we had before Go 1.5 introducing vendoring. Well, maybe we don't: There is [Project Athens](https://github.com/gomods/athens) and other solutions will follow. They are proxies for Go modules as Go now is capable of speaking a quite specific protocol through proxies: They can cache all the required code to build our projects.

Now we do have two working scenarios: The first is a company having all code in own repositories where all employees strictly are following a guideline never to force-push, never to delete a version, always to use [SemVer](https://semver.org/) and of course never to delete or rename any repository. The second is a company having set up a proxy capable of speaking the Go modules proxy protocol: They do have a cached copy of all required code to build the project. Someone deletes code: They don't care as the proxy has a copy.

One of the main cases I am working in are open source projects: Will there be strict policies like in example one? Nope. Just look at what happened when `github.com/Sirupsen/logrus` was renamed to `github.com/sirupsen/logrus`… Half of the Go world imploded and the maintainer wrote an excuse-issue explaining everything and trying to help people getting the rename right. Or look at dying `code.google.com`: In some old projects you will find code referenced from there and it will not build as Google pulled the plug and Google Code went dark.

So the open source projects must follow the second approach: Every project needs to set up a proxy to be used when compiling their source! So no more `go get github.com/genuinetools/reg` (fine tool) but first fiddling with setting the right `GOPROXY` environment variable before getting as I need the proxy having all code I need to build the tool. Or maybe I'm lucky, nothing bad happened to the required code and I'm still able to just `go get` it.

You might think the same as I'm doing: What a damn pile of bullcrap!

Of course nobody will set up such a mirror for the public. Some people will set up their personal proxies to keep the stuff running they are using (I will be one of them in case this approach stays with us without taking care of the flaws being introduced (again)) but every tool not being distributed in binary form will at some point fail to build because some library or hosting platform was pulled from the net.

What is to be said after a like 700 words rant? As long as Go modules are experimental / beta I will have an eye on them but will definitely not use them. I will continue to stick on `dep` and ensuring no `go.mod` file changes the build behaviour of my code. Full vendoring of all required code. In case someone comes up with a miracle to solve all this with Go modules I might be in but until then: Hell NO!
