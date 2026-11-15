-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Network.ClientNetwork
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v4 = require(v3.DataConsumer)
local v_u_5 = require(script.Parent.NetworkView)
local v6 = v_u_2.Component:extend("ClientNetwork")
function v6.init(p7, _) -- name: init
	p7.state = {
		["targetNetworkData"] = p7.props.ClientNetworkData
	}
end
function v6.render(p8) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	local v9 = p8.props.layoutOrder
	local v10 = p8.props.searchTerm
	local v11 = p8.props.size
	return v_u_2.createElement(v_u_5, {
		["size"] = v11,
		["searchTerm"] = v10,
		["layoutOrder"] = v9,
		["targetNetworkData"] = p8.state.targetNetworkData
	})
end
return v4(v6, "ClientNetworkData")