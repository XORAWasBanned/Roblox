-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Log.ServerLog
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.DataConsumer)
local v_u_4 = require(script.Parent.Parent.Parent.Constants).LogFormatting.CommandLineHeight
local v_u_5 = require(script.Parent.DevConsoleCommandLine)
local v_u_6 = require(script.Parent.LogOutput)
local v7 = v_u_2.Component:extend("ServerLog")
function v7.init(p_u_8) -- name: init
	function p_u_8.initServerLogData()
		-- upvalues: (copy) p_u_8
		return p_u_8.props.ServerLogData:getLogData()
	end
end
function v7.render(p9) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local v10 = v_u_2.createElement
	local v11 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = p9.props.size,
		["LayoutOrder"] = p9.props.layoutOrder
	}
	local v12 = {
		["Scroll"] = v_u_2.createElement(v_u_6, {
			["size"] = UDim2.new(1, 0, 1, -(v_u_4 + 4)),
			["targetSignal"] = p9.props.ServerLogData:Signal(),
			["initLogOutput"] = p9.initServerLogData
		}),
		["CommandLine"] = v_u_2.createElement(v_u_5, {
			["pos"] = UDim2.new(0, 0, 1, -v_u_4),
			["height"] = v_u_4
		})
	}
	return v10("Frame", v11, v12)
end
return v3(v7, "ServerLogData")