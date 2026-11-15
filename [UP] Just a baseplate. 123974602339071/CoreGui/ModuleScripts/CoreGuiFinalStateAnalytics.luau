-- Path: CoreGui.RobloxGui.Modules.Settings.Analytics.CoreGuiFinalStateAnalytics
local v_u_1 = game:GetService("StarterGui")
local v_u_2 = game:GetService("RbxAnalyticsService")
local v3 = game:GetService("CorePackages")
local v_u_4 = require(v3.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new() -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_5
	local v6 = {
		["evenStream"] = v_u_4.new(v_u_2)
	}
	local v7 = v_u_5
	setmetatable(v6, v7)
	return v6
end
function v_u_5.sendCoreGuiFinalAnalytic(p8) -- name: sendCoreGuiFinalAnalytic
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v9 = {}
	local v10 = game.PlaceId
	v9.placeid = tostring(v10)
	local v11 = game.GameId
	v9.universeid = tostring(v11)
	v9.sessionid = v_u_2:GetSessionId()
	for _, v12 in Enum.CoreGuiType:GetEnumItems() do
		local v13 = v_u_1
		v9[v12.Name] = tostring(v13:GetCoreGuiEnabled(v12))
	end
	local v_u_14 = ""
	local function v16()
		-- upvalues: (ref) v_u_14, (ref) v_u_1
		local v15 = v_u_1
		v_u_14 = tostring(v15:GetCore("ResetButtonCallback"))
	end
	pcall(v16)
	v9.ResetButtonCallback = v_u_14
	p8.evenStream:sendEventDeferred("core_gui_final_state", "core_gui_final_state", v9)
end
return v_u_5