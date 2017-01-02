--[[


]]--

-- openwrt hw config
config_net = {
	lan_name 	= "lan",
	lan_swcpu 	= "eth1",
	wan_name 	= "wan",
	wan_swcpu 	= "eth0"
	wan_swvlan 	= 4090
}

config_led = {
	name 		= "openunifi",
	desc 		= "UF Status LED"
	sysfs 		= "t1043:green:qos" -- replace me with valid
}

-- unifi configurations
config_uap = {
{
	umodel 		= "uap-lr",
	hwassign 	= {"radio0"}
	bootver 	= "",
	firmver 	= ""
},
}

config_usg = {
	umodel 		= "usg3",
	bootver 	= "",
	firmver 	= "",
	fwprefix 	= "UF Controller - "
}

config_usw = {
	switch 		= "switch0"
}