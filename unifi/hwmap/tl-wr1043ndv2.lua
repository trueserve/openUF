--[[


]]--

local dev = {}

-- openwrt hw config
dev.config_net = {
	lan_name 	= "lan",
	lan_cpueth 	= "eth1",
	lan_vlanid  = 1,
	wan_name 	= "wan",
	wan_cpueth 	= "eth0",
	wan_vlanid 	= 4090
}

dev.config_led = {
	name 		= "uf_status",
	desc 		= "UF Status LED",
	sysfs 		= "tp-link:green:system"
}

-- unifi configurations
dev.config_uap = {
{
	umodel 		= "uap-lr",
	hwassign 	= {"radio0"},
	bootver 	= "",
	fwver 		= "", 				-- format M.m.bbbb
	fwbuilddate	= "160101.0000" 	-- format YYMMDD.HHMM
},
}

dev.config_usg = {
	umodel 		= "usg3",
	bootver 	= "",
	firmver 	= "",
	rulepre 	= "uf_",
	descpre 	= "UF Controller - "
}

dev.config_usw = {
	switch 		= "switch0",
	mirror_type = "single"
}

dev.config_vlan = {
	cpu_lan 	= 0,
	cpu_wan 	= 6,
	ports 		= {
		lan1 	= 1,
		lan2 	= 2,
		lan3 	= 3,
		lan4 	= 4,
		wan 	= 5
	}
}

return dev
