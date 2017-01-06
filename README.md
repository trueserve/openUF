# openUF
This project aims to create a wrapper between the UniFi management protocol and OpenWRT configuration, allowing a UniFi controller to configure WLANs and basic router settings on an OpenWRT device.

Please note that, at this time, this project _can only send a sample announce packet._

## Why?
A few reasons, really:
- It's nice to have a central management interface for basic configuration of network equipment and interfaces.
- Being able to run custom software on the network gear, external to the management interface, can be helpful in certain situations. Imagine running a custom daemon or piece of software either directly or in a container on an always-on device, where that device also supplying WiFi to a location. This device costs as little as $50 and the network configuration can be remotely managed.

## Really, why?
It seems like an interesting / fun project. And it doesn't do anything right now, so there's no concern, right?

## What do you intend to support?
The goal is to support the following, roughly in this order:
- L2 adoption
- AP configuration
 - Emulate AP-Pro, AP-AC-Pro or AP-AC-HD for dual-band models, AP-LR for single 2.4GHz, AP-OD5 for single 5GHz
 - Do NOT support wireless uplinking
 - Report client statistics
- L3 adoption
- Router configuration
 - Basic settings (IP address, DHCP, port fowards, etc)
 - Static routes
- VLANs
 - Initially only support the LAN VLAN, but eventually allow others
- Network switch configuration
- VPNs

At this time, I will try to rely only on tools commonly available on OpenWRT builds and repositories, such as BusyBox and Lua.

Another goal will be to keep the software stack as small as possible, so as to have it fit on devices with smaller flash space.

### Gear used for development
For reference, I will likely this firmware with LEDE on the following models:
- TP-Link TL-WR1043NDv2 (single band 802.11n, 2x2) (_have this now_)
- TP-Link Archer C7 (dual band 802.11ac, 3:3x3) (_have on hand_)
- TP-Link Archer C2600 (dual band 802.11ac, 4:4x4) (_maybe_)
- Netgear WNDR3700 (dual band 802.11n, 3x3) (_have on hand_)
