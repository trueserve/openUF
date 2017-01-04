--[[


]]--

local dev = {}
dev.conf = {}

-- openwrt hw config
dev.conf.net = {
	lan_name 	= "lan",
	lan_cpueth 	= "eth1",
	lan_vlanid  = 1,
	wan_name 	= "wan",
	wan_cpueth 	= "eth0",
	wan_vlanid 	= 4090
}

dev.conf.led = {
	name 		= "uf_status",
	desc 		= "UF Status LED",
	sysfs 		= "tp-link:green:system"
}

dev.conf.vlan = {
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


-- unifi configurations
dev.openuf = {}

dev.openuf.uap = {
	umodel 		= "uapg1-lr",
	hwassign 	= {"radio0"}
}

dev.openuf.usg = {
	umodel 		= "usg3",
	bootver 	= "",
	firmver 	= "",
	rulepre 	= "uf_",
	descpre 	= "UF Controller - "
}

dev.openuf.usw = {
	switch 		= "switch0",
	mirror_type = "single"
}

return dev
