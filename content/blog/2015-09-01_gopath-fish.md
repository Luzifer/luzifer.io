---
date: 2015-09-01T13:40:51+02:00
media: /uploads/2015/09/01/terminal.jpg
title: Using multiple GOPATHs with fish-shell
vgwort: 16d9013a34284c008ff9979b2cbd97ea
---

Since I'm using Go in more and more projects and different contexts (private projects, company projects, contributions to other peoples open source projects, ...) and all of them are using different versions of libraries I needed an approach to split up those library versions so I don't have to test company projects against new versions of libraries when I update them for my private projects.

One approach would be to `godep save` those dependencies every time I change a project and `godep restore` them as soon as I'm switching back to that project. As I continuously have many different open at the same time I would get confused quite fast and loose the overview which versions of those libraries are currently checked out.

The approach I chose is a bit different and mainly the port of an [article by Herbert Fischer](http://hgfischer.org/article/managing-multiple-gopaths/) to the fish shell. It is fully interchangeable with his solution so if you are using bash and fish mixed at the same time you can use his version for bash and mine for fish.

Like he explained in his article you just create a `.gopath` file in a directory somewhere above the current one you want to be the `$GOPATH`. So for example if you have your projects living in `~/gocode/src/...` you want to create a `.gopath` file in `~/gocode/`. Below is a small example what the results are if you have your `.gopath` files at `/tmp/test` and `~/gocode/`:

```
[13:39] luzifer ~> cd /tmp/test/foo/
[13:39] luzifer /t/t/foo> echo $GOPATH
/private/tmp/test
[13:39] luzifer ~> cd ~/gocode/src/github.com/Luzifer/password
[13:39] luzifer /~/g/s/g/L/password> echo $GOPATH
/Users/luzifer/gocode
[13:39] luzifer /t/t/foo> cd
[13:39] luzifer ~> echo $GOPATH
/Users/luzifer/gocode
[13:39] luzifer ~>
```

The only change I made to the code by Herbert is that I defined a variable `$default_GOPATH` which will get set if there is no `.gopath` found in any directory above the current one. You can just leave it unset and your `$GOPATH` will get removed from the environment as soon as you leave those directories having an `.gopath` file above them.

To enable this approach for you just save the following code to `~/.config/fish/functions/cd.fish`:


```fish
function cd
  builtin cd $argv

  set cdir (pwd)
  while [ "$cdir" != "/" ]
    if [ -e "$cdir/.gopath" ]
      set -x GOPATH $cdir
      return 0
    end
    set cdir (dirname "$cdir")
  end

  set -x GOPATH $default_GOPATH
  return 0
end
```

----

<small>(Terminal image: [Zenith Z-19 Terminal by ajmexico](https://www.flickr.com/photos/ajmexico/3281139507))</small>
