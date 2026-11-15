-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Memory.ServerMemory
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v4 = require(v3.DataConsumer)
local v_u_5 = require(v3.Memory.MemoryView)
local v6 = v_u_2.Component:extend("ServerMemory")
function v6.render(p7) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	return v_u_2.createElement(v_u_5, {
		["layoutOrder"] = p7.props.layoutOrder,
		["size"] = p7.props.size,
		["searchTerm"] = p7.props.searchTerm,
		["targetMemoryData"] = p7.props.ServerMemoryData
	})
end
return v4(v6, "ServerMemoryData")