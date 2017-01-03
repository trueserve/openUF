--[[


]]--

-- load libs and config
dofile "lib/lib.lua"
dofile "conf.lua"

-- libraries
socket = require("socket");

-- announce addresses
ADDR_IPV4_BROADCAST	= "255.255.255.255"
ADDR_IPV4_MULTICAST	= "233.89.188.1"

-- packet constants
PKT_TYPE_HW_ADDR		= 0x01
PKT_TYPE_IP_ADDR		= 0x02
PKT_TYPE_FWVER_VERBOSE	= 0x03
PKT_TYPE_UPTIME			= 0x0a
PKT_TYPE_HOSTNAME		= 0x0b
PKT_TYPE_PLATFORM 		= 0x0c
PKT_TYPE_HW_ADDR2 		= 0x13
PKT_TYPE_PLATFORM2 		= 0x15
PKT_TYPE_FWVER_SHORT	= 0x16

-- temporary
mac = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55}
ipaddr = {192, 168, 188, 188}
uptime = 500
hostname = "openUF"

-- open device file
uap = dofile("umodel/" .. dev.config_uap[1].umodel .. ".lua")

-- packet start
packet = {0x02, 0x06, 0x00, 0x00} -- header and empty length field


-- ip and mac
w = ufpkt.init(PKT_TYPE_IP_ADDR)
ufpkt.cat(w, mac)
ufpkt.cat(w, ipaddr)
ufpkt.fin(w, packet)

-- mac only
w = ufpkt.init(PKT_TYPE_HW_ADDR)
ufpkt.cat(w, mac)
ufpkt.fin(w, packet)

for k,v in pairs(packet) do
	print(k..": "..v)
end
