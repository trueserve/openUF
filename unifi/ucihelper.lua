--[[


]]--

-- libraries
--require("uci")
--u = uci.cursor()

-- helper table
ufuci = {}

--------------
-- uci generic
function ufuci.commit()

end


--------------
-- uap helpers
ufuci.uap = {}

function ufuci.uap.rf_config(radio, mode, chan, txpwr)
	-- configures RF parameters of the radio
end

function ufuci.uap.wlan_add(radio, mode, ssid, security)
	-- adds an SSID to a radio
end

function ufuci.uap.wlan_del(radio, id)
	-- deletes an SSID on a radio
end

function ufuci.uap.wlan_clear(radio, delete_all) 	-- if delete_all is not true, then only managed SSIDs are deleted
	-- clears all configured SSIDs
end


--------------
-- usg helpers
ufuci.usg = {}

function ufuci.usg.portfwd(name, srcip, srcport, destip, destport)
	-- adds a port forwarding rule
end

function ufuci.usg.portfwd_clear()
	-- clears all managed port forwarding rules
end


--------------
-- usw helpers
ufuci.usw = {}

function ufuci.usw.port_config(switch, port, vlan, mirror)

end


---------------
-- vlan helpers
ufuci.vlan = {}

function ufuci.vlan.add(switch, id)
	-- adds a vlan, tagged to the LAN CPU port, if it doesn't already exist
end

function ufuci.vlan.del(switch, id)
	-- deletes a VLAN ID
end

function ufuci.vlan.clear(switch)
	-- clears all managed VLAN config, sets back to default
end


return ufuci