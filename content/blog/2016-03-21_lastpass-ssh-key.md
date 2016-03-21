---
date: 2016-03-21T19:42:40+01:00
title: Using LastPass to unlock SSH-keys
vgwort: 1184b8d912364e21982fbe4871c582f4
---

Since its a good practice to use one SSH key for one purpose I have a lot of SSH keys for different purposes: I have a SSH key to access company servers, one to access my private servers, one for accessing the servers running at [VoxNoctem](http://www.voxnoctem.com/), one for code commits pushed to GitHub and so on. All those keys do have passwords in order to have them secured in case someone gets their hands on them.

Until some time I used to have one password for all of those SSH keys because who can remember that many passwords? But there are password managers like [Cloudkeys](https://www.cloudkeys.de/) or [LastPass](https://lastpass.com/). So I started to rotate my SSH keys and gave them different passwords. Those passwords were then stored in my password database and to unlock the SSH keys I needed to do an `ssh-add`, then switch to my browser, open the password database, search the password, copy it, switch back to the terminal and paste the password. Sounds complicated? It was.

This weekend I thought about making things more easy by coupling all those steps together in one script. It should access my LastPass account, fetch the password and unlock the SSH key for it to be added to my ssh-agent. Using the `lpass` command line client for LastPass I just had to figure out how to find the password in LastPass and how to add the SSH key with this automatically retrieved password.

In order to use the same mechanism for you, just [install the `lpass` command line client](https://github.com/lastpass/lastpass-cli/blob/master/README.md), ensure you have `expect` on your system (should be present on Linux and OSX by default) and copy the script below into `/usr/local/bin/lpass-ssh` (or any other location inside your `$PATH`.

The password for the corresponding key is found by name. So you need to name your keys different and not all of them `id_rsa`. If you for example have a key `~/.ssh/my_work_key` you need to create a secure note in LastPass with the type "SSH key" and name it `SSH: my_work_key`. Afterwards just execute `lpass-ssh my_work_key` to add the key to your current ssh-agent.

Of course you also can load keys not stored in `~/.ssh`: Just pass the full path to `lpass-ssh` and keep the naming scheme to `SSH: <filename of your key>`.

<script src="https://gist.github.com/Luzifer/2f188ed3adc0f1b166f7.js"></script>
