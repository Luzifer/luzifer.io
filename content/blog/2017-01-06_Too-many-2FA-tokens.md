---
date: 2017-01-06T13:47:20+01:00
title: Too many 2FA tokens to retain control of
vgwort: 90958780d7464ed192edc62d137f34f8
---

Lately we enforced a new security policy at Jimdo which now requires every single Github account (also bot accounts) to have two factor authentication enabled. As you might imagine there are many accounts for different purposes and someone had to take care about enabling 2FA for all of them.

Luckily I'm only responsible for some of those bot users but in the end I needed to touch some accounts. As I'm a huge fan of enabling every possible security measure I can find, my [Authy app](https://www.authy.com/app/) already got a huge list of 2FA tokens in it. Adding even more tokens just to set them once and afterwards deleting them didn't seem very appealing to me. Even if I would do that I still would need to store those secrets to set up those accounts again as soon as I need access to them.

After thinking about this problem I looked through all those 2FA tokens I already have in my Authy app and found that I'm using only a small amount of them on a regular basis. All those other tokens are stored for use every once in a while (probably even as few as once per year). So in the end I would be fine with putting those secrets in a place where they are secure and not stored together with the password of the service. That means storing those secrets inside LastPass would be a bad idea because LastPass already does have all the passwords inside its database.

As I'm hosting my own [Vault](https://www.vaultproject.io/) instance I came to the idea to put the secrets into Vault and then find out how to generate a one-time-password out of them as soon as I require access to those services. And luckily I like to write small utilities to do such things...

The idea of [`vault-totp` (download on Github releases)](https://github.com/Luzifer/vault-totp/releases/latest) was born and shortly aftwards put into code. What it does? Quite simple: It takes a Vault key, reads the secret from it and generates the current one-time-password. It even can take a wildcard in the last segment of the key and print a whole list of OTPs...

![vault-totp console output](/uploads/2017/01/vault-totp.png)

Now I can put all those tokens I don't often need into my Vault and for all those Github accounts mentioned earlier I even can put them into the company Vault, restrict access to them using Vault ACLs and in case I need a one-time-password for one account I just need one command to get it while the password is stored in another secure location...
