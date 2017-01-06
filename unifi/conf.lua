--[[


]]--

-- device mapping
dev = dofile("modelmap/tl-wr1043ndv2.lua")

-- global switches
enable = {
	led = true, 		-- provision / status LED
						-- slow = unconfigured / provisioning, fast = error, solid = OK
	uap = true,
	usg = false,
	usw = false
}

config = {
	use_only_unifi_wlan 	= true,  	-- true = disable all non-unifi WLANs, false = leave them alone
}

-- device mapping overrides
-- ....
