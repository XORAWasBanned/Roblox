-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Log.ClientLog
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.DataConsumer)
local v_u_4 = require(script.Parent.LogOutput)
local v5 = v_u_2.Component:extend("ClientLog")
function v5.init(p_u_6) -- name: init
	function p_u_6.initClientLogData()
		-- upvalues: (copy) p_u_6
		return p_u_6.props.ClientLogData:getLogData()
	end
end
function v5.render(p7) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	return v_u_2.createElement(v_u_4, {
		["layoutOrder"] = p7.props.layoutOrder,
		["size"] = p7.props.size,
		["initLogOutput"] = p7.initClientLogData,
		["targetSignal"] = p7.props.ClientLogData:Signal()
	})
end
return v3(v5, "ClientLogData")