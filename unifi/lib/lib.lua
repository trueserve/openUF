--[[


]]--

-- load global libraries
local bit = require("bit")


-- global helpers
ufpkt = {}

function ufpkt.init(const)
	t = {const, 0x00, 0x00}
	return t
end

function ufpkt.cattbl(dst, src)
	for _,v in pairs(src) do
		dst[#dst+1] = v
	end
end

function ufpkt.catstr(dst, src)
	str = {}
	for i = 1, #src, 1 do
		str[#str+1] = string.byte(string.sub(src, i, i))
	end
	ufpkt.cattbl(dst, str)
end

function ufpkt.finish(src, dst)
	src[3] = #src - 3
	ufpkt.cattbl(dst, src)
end


function ufpkt.gen4(uptime)
	t = {
		bit.rshift(         uptime, 24),
		bit.band(bit.rshift(uptime, 16), 0xff),
		bit.band(bit.rshift(uptime,  8), 0xff),
		bit.band(           uptime,      0xff),
	}

	return t
end
