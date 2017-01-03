--[[


]]--

-- load global libraries


-- global helpers
ufpkt = {}

function ufpkt.init(const)
	t = {const, 0x00, 0x00}
	return t
end

function ufpkt.cat(dst, src)
	for _,v in pairs(src) do
		dst[#dst+1] = v
	end
end

function ufpkt.fin(src, dst)
	src[3] = #src - 3
	ufpkt.cat(dst, src)
end


function ufpkt.gen_uptime(uptime)
	t = {
		bit.rshift(         uptime, 24),
		bit.band(bit.rshift(uptime, 16), 0xff),
		bit.band(bit.rshift(uptime,  8), 0xff),
		bit.band(           uptime,      0xff),
	}
end
