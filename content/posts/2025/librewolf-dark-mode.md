+++
date = '2025-11-26T13:29:12-06:00'
title = 'Librewolf Dark Mode'
+++

# Librewolf Dark Mode

I'm sure anyone who is privacy-conscious enough to be familiar with Librewolf will also be aware of how and why resisting fingerprinting does not mix well with having your browser request dark mode by default. A quick web search will show a litany of results suggesting to use the dark browser theme in conjunction with the DarkReader extension. Personally, I never really loved how DarkReader looks out-of-the-box, and certainly didn't care to set site-specific configs (nor do I love having tons of browser extensions ... they *do* increase your fingerprinting potential, after all ...) so in the past I just left this alone. 

That's not entirely true -- when I was running Arch, I took advantage of the `librewolf-allow-dark` package available from the AUR. However, today I found out that something similar can be accomplished on any OS as long as your threat model can handle the trade-off being made here. Simply open up your `about:config` and make the following changes:


```
privacy.resistFingerprinting = false
privacy.fingerprintingProtection = true
privacy.fingerprintingProtection.overrides = +AllTargets,-CSSPrefersColorScheme
```

Restart Librewolf and ***poof!*** no more flashbangs when you open a new tab!
