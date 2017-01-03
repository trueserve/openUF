--[[


]]--

local uap = {}


-- general config
uap.config = {
	platform		= "BZ2",
	fwprefix		= "BZ.ar7240.v",
	field			= {},
}

-- special flags
uap.config.field[12] = 0x32


return uap
