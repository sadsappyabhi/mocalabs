+++
date = '2025-12-04T13:21:14-06:00'
draft = false
title = 'Battery Management With TLP'
+++

Today, I got my Thinkpad T14s (Gen 1, running Gentoo) working with the dock in my home office for a dual monitor setup for the first time. The USB-C dock that I have uses Silicon Motion InstantView which unfortunately requires a driver whose only Linux offering is for Ubuntu. There exists an [install script for Fedora](https://github.com/thehaniak/wavlink-fedora) however I didn't have any luck getting this to work on my Fedora machine when I tried. 

On my MacBook, I have been using [Al Dente](https://github.com/AppHouseKitchen/AlDente-Battery_Care_and_Monitoring) to limit battery charging while docked and on AC to 80% with great results. Even though the battery in my second-hand Thinkpad is already a bit worn, I definitely wanted to have something like this in place before leaving it plugged in all day. In the past (or maybe on another machine?) I had seen an option in Cosmic's power and battery settings to limit charging to 80%. However, I could not find this option today. I was using `power-profiles-daemon`, I'm not sure if using `system76-power` would make any difference. When I started searching the web for why, I quickly came across [TLP](https://linrunner.de/tlp/index.html) which does exactly what I was looking for. It's even in the official Gentoo repositories. Hooray!

```
$ sudo emerge -a sys-power/tlp
```

After skimming the introduction, I went ahead and installed the package, and then opened up `/etc/tlp.conf` to check out the configuration. TLP has extremely sane defaults (turns out, this is kind of the whole point of TLP, but I didn't know that yet), and most of going through the config file was just turning features that I wanted on by uncommenting those lines. The documentation within the config file itself is quite comprehensive and easy to follow. The default values for each option are listed and I don't think I really tweaked anything besides not turning on hardware-specific features for hardware that I'm not using (AMD/Intel, NVMe/SSD, etc.)

Then, simply start it with:

```
$ sudo tlp start
```

At this point, I had to stop the `power-profiles-daemon` to avoid conflicting with TLP. I'm currently a systemd user so my options were to either mask or disable it. 

```
$ sudo systemctl mask power-profiles-daemon.service
$ sudo systemctl status power-profiles-daemon
○ power-profiles-daemon.service
     Loaded: masked (Reason: Unit power-profiles-daemon.service is masked.)
     Active: inactive (dead)
```

OR

```
$ sudo systemctl disable power-profiles
$ sudo systemctl status power-profiles-daemon
○ power-profiles-daemon.service - Power Profiles daemon
     Loaded: loaded (/usr/lib/systemd/system/power-profiles-daemon.service; disabled; preset: disabled)
     Active: inactive (dead)
```

Then I ran a test to make sure everything was working as intended. I was already at 100% from being plugged in for a while, so first I allowed the battery to discharge to 50% while doing other things.

```
$ sudo tlp discharge 50
```

My battery isn't in the greatest shape, unfortunately, so this didn't take very long. Then I just let TLP do it's thing and watched as it charged from 50% up to 80% where it stopped.

Satisfied with the results of my quick test, I then made sure TLP would start automatically at boot with

```
$ sudo systemctl enable tlp.service
```

Of course, this might not be news for most, as there is a [Gentoo wiki article on Power Management](https://wiki.gentoo.org/wiki/Power_management/Guide) that mentions TLP as a "set and forget" option. However, I am certainly pleased with what I discovered today.
