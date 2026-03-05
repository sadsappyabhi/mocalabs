---
title: "Waterfox"
date: 2025-12-28T12:00:00-6:00
description: "Installing and setting up Waterfox as the default web browser on Gentoo due to Firefox adding unwanted AI features"
---


In light of Firefox going [all in on AI](https://blog.mozilla.org/en/mozilla/leadership/mozillas-next-chapter-anthony-enzor-demeo-new-ceo/), I decided to check out [Waterfox](https://www.waterfox.com/). I had been using [Librewolf](https://librewolf.net/) (which I still love) but there's something that's just ... *nice?* ... about Waterfox. 

I followed the [instructions to install Waterfox from source](https://www.waterfox.com/support/install-waterfox-linux/) on my Gentoo machine (although I opted for the Flatpak on Fedora). This put Waterfox on the $PATH but not create a .desktop entry, so I created one manually. On Gentoo, this is in `/usr/share/applications`.

```shell
# /usr/share/applications/waterfox.desktop
[Desktop Entry]
Name=Waterfox
Comment=Web Browser
Exec=waterfox
Icon=/opt/waterfox/browser/chrome/icons/default/default64.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;
```

Then, I made it the default browser with:

```shell
xdg-mime default waterfox.desktop x-scheme-handler/https x-scheme-handler/http

xdg-settings set default-web-browser waterfox.desktop
```

***

***Update: March 2026***

At this point in time, I have been using Waterfox exclusively for personal web browsing. Nothing against Librewolf, I'm just liking Waterfox right now! For testing web things I have settled on Gnome's Epiphany and Ungoogled-Chromium for now. 
