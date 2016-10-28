---
date: 2016-10-28T14:36:29+02:00
title: Keeping overview of many git repos
vgwort: e331e1c9f98c452d822147fbeb9b96f8
---

If you're a developer like myself you probably are dealing with a huge amount of different git repositories. Some for your private things (because having things organized with a version history is just nice), some for your private projects and even more for company work. Then there are also distractions and so maybe uncommitted changes...

At least thats the situation at my dev machine: In total 684 git repositories for like everything. Some managed at BitBucket, GitLab but most of them at Github. One thing common for all: There are untracked files, modified things not yet committed and somehow I got distracted and now they are laying on my disk waiting to get pushed to the remote.

Even though I'm doing an hourly incremental backup using duplicity and my [duplicity-backup wrapper](https://github.com/Luzifer/duplicity-backup) I don't like that status but managing that huge amount of repositories and keeping an overview is hard. Thats the reason I came up with [git-recurse-status](https://github.com/Luzifer/git-recurse-status).

In the end `git-recurse-status` is just a small Go binary walking through a tree of directories, collecting the current status of the repository and displaying it to the CLI. Sounds simple and could have been done with a small shell script. What I found too slow and also too complicated to put into a shell script is filtering those results. (684 lines are exhausting to read...)

So if you are like me you can put the binary (downlaod on Github) into your `PATH` and just fire up `git recurse-status -f changed` in your homedir or in the directory keeping all your private projects (or where ever you like) and you're provided a list of repositories having changes (63 in my case). Similarly you can filter for repositories being ahead of the remote tracking branch and so on.

For a detailed overview what is possible see the README file inside the repository...
