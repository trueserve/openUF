# openUnifi
This project aims to create a wrapper between the UniFi management protocol and OpenWRT configuration, allowing a UniFi controller to configure WLANs and basic router settings on an OpenWRT device.

Please note that, at this time, this project _does nothing._

## Why?
A few reasons, really:
- UBNT gear is cost effective, but not the cheapest. Sometimes cost is the ultimate factor.
- The USG is not a particularly good product. The USG Pro, even less so.
- Having a central management interface for basic configuration is helpful.
- Being able to run custom software external to the management interface can be helpful in certain situations. Imagine running a custom daemon or piece of software in a container on an always-on device, that device also supplying WiFi to a location. This device costs as little as $50 and the network configuration can be remotely managed.

## Really, why?
It seems like an interesting / fun project. And it doesn't do anything right now, so there's no concern, right?

## What do you intend to support?
The goal is to support the following, roughly in this order:
- AP configuration
 - Emulate AP-Pro, AP-AC-Pro or AP-AC-HD for dual-band models
 - Do NOT support wireless uplinking
- Router configuration
 - Basic settings (IP address, DHCP, port fowards, etc)
 - Static routes
- VLANs
 - Initially only support the LAN VLAN, but eventually allow others
- Network switch configuration
- VPNs

At this time, I will try to rely only on tools commonly available on OpenWRT builds, such as BusyBox and Lua.

## Gear used for development
I will likely this firmware with LEDE on the following models:
- TP-Link TL-WR1043NDv2 (single band 802.11n, 2x2)
- TP-Link Archer C7 (dual band 802.11ac, 3:3x3)
- TP-Link Archer C2600 (dual band 802.11ac, 4:4x4) (maybe)
- Netgear WNDR3700 (dual band 802.11n, 3x3) (maybe)
