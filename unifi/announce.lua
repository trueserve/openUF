--[[


]]--

-- load config
dofile "config.inc.lua"

-- libraries
socket = require("socket");

-- constants
local PACKET_MAGIC 		= "TNBU"
local PACKET_VERSION 	= 0