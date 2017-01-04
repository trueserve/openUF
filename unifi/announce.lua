--[[


]]--

-- load libs and config
dofile "lib/lib.lua"
dofile "conf.lua"

-- libraries
socket = require("socket");

-- announce version
VERSION 				= "openUF-0.1"

-- announce addresses
ANNOUNCE_IPV4_BROADCAST	= "255.255.255.255"
ANNOUNCE_IPV4_MULTICAST	= "233.89.188.1"
ANNOUNCE_PORT 			= 10001

-- packet constants
PKT_TYPE_HW_ADDR		= 0x01
PKT_TYPE_IP_ADDR		= 0x02
PKT_TYPE_FWVER_VERBOSE	= 0x03
PKT_TYPE_UPTIME			= 0x0a
PKT_TYPE_HOSTNAME		= 0x0b
PKT_TYPE_PLATFORM 		= 0x0c
PKT_TYPE_INC_COUNTER 	= 0x12
PKT_TYPE_HW_ADDR2 		= 0x13
PKT_TYPE_PLATFORM2 		= 0x15
PKT_TYPE_FWVER_SHORT	= 0x16
PKT_TYPE_FWVER_FACTORY	= 0x1b

PKT_BLOB_17_18_19_1A 	= {
	0x17, 0x00, 0x01, 0x01,
	0x18, 0x00, 0x01, 0x00,
	0x19, 0x00, 0x01, 0x01,
	0x1a, 0x00, 0x01, 0x00
}

-- packet internals
local counter = {
	val	= 0,
	idx = 0,
	raw = {}
}

-- temporary
local mac = {0x00, 0x11, 0x22, 0x33, 0xd3, 0xad}
local ipaddr = {192, 168, 188, 88}
local uptime = {val = 15, idx = 0}
local hostname = "openUF"

-- open device file
local ufhw = {}
ufhw.uap = dofile("umodel/" .. dev.openuf.uap.umodel .. ".lua")

-- packet start
packet = {0x02, 0x06, 0x00, 0x00} -- header and empty length field


-- generate packet replicating original 3.7.x packet
w = ufpkt.init(PKT_TYPE_IP_ADDR)
ufpkt.cattbl(w, mac)
ufpkt.cattbl(w, ipaddr)
ufpkt.finish(w, packet)

w = ufpkt.init(PKT_TYPE_HW_ADDR)
ufpkt.cattbl(w, mac)
ufpkt.finish(w, packet)

uptime.idx = #packet + 3
w = ufpkt.init(PKT_TYPE_UPTIME)
ufpkt.cattbl(w, ufpkt.gen4(uptime.val))
ufpkt.finish(w, packet)

w = ufpkt.init(PKT_TYPE_HOSTNAME)
ufpkt.catstr(w, hostname)
ufpkt.finish(w, packet)

w = ufpkt.init(PKT_TYPE_PLATFORM)
ufpkt.catstr(w, ufhw.uap.platform)
ufpkt.finish(w, packet)

w = ufpkt.init(PKT_TYPE_FWVER_VERBOSE)
ufpkt.catstr(w, ufhw.uap.fw.pre)
ufpkt.catstr(w, ufhw.uap.fw.ver)
ufpkt.catstr(w, "-" .. VERSION)
ufpkt.catstr(w, ".")
ufpkt.catstr(w, ufhw.uap.fw.buildtime)
ufpkt.finish(w, packet)

w = ufpkt.init(PKT_TYPE_FWVER_SHORT)
ufpkt.catstr(w, ufhw.uap.fw.ver)
ufpkt.catstr(w, "-" .. VERSION)
ufpkt.finish(w, packet)

w = ufpkt.init(PKT_TYPE_PLATFORM2)
ufpkt.catstr(w, ufhw.uap.platform)
ufpkt.finish(w, packet)

ufpkt.finish(PKT_BLOB_17_18_19_1A, packet)

w = ufpkt.init(PKT_TYPE_HW_ADDR2)
ufpkt.cattbl(w, mac)
ufpkt.finish(w, packet)

counter.idx = #packet + 3
w = ufpkt.init(PKT_TYPE_INC_COUNTER)
ufpkt.cattbl(w, {0x00, 0x00, 0x00, 0x00})
ufpkt.finish(w, packet)

w = ufpkt.init(PKT_TYPE_FWVER_FACTORY)
ufpkt.catstr(w, ufhw.uap.fw.factoryver)
ufpkt.finish(w, packet)

packet[4] = bit.band(#packet - 4, 0xff)

-- set up udp transfer
udpb = socket.udp()
udpb:setoption('broadcast', true)
udpb:setpeername(ANNOUNCE_IPV4_BROADCAST, ANNOUNCE_PORT)

udpm = socket.udp()
udpm:setpeername(ANNOUNCE_IPV4_BROADCAST, ANNOUNCE_PORT)

while true do
	-- generate new packet data with updated counter
	counter.val = counter.val + 1
	counter.raw = ufpkt.gen4(counter.val)

	uptime.val = uptime.val + 10
	uptime.raw = ufpkt.gen4(uptime.val)

	for i = 1, 4, 1 do
		packet[counter.idx + i] = counter.raw[i]
		packet[uptime.idx + i] = uptime.raw[i]
	end

	-- convert our array to string for sending
	local tosend = ""
	for _, byte in ipairs(packet) do
		tosend = tosend .. string.char(byte)
	end

	-- send the packet
	udpb:send(tosend)
	udpm:send(tosend)

	-- wait a while
	socket.select(nil, nil, 10)
end
