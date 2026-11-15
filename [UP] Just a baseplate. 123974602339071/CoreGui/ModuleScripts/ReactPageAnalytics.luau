-- Path: CoreGui.RobloxGui.Modules.Settings.Analytics.ReactPageAnalytics
local v_u_1 = game:GetService("RbxAnalyticsService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("TelemetryService")
local v4 = require(v2.Workspace.Packages.LoggingProtocol)
local v_u_5 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local v6 = game:DefineFastInt("OpenReactPageThrottleHundredthsPercent", 0)
local v7 = game:DefineFastInt("CloseReactPageThrottleHundredthsPercent", 0)
local v_u_8 = {}
v_u_8.__index = v_u_8
local v9 = {
	["openPage"] = {
		["eventName"] = "ingame_menu_action",
		["backends"] = nil,
		["throttlingPercentage"] = nil,
		["lastUpdated"] = nil,
		["description"] = "Fires when a React menu page is opened",
		["backends"] = { v4.TelemetryBackends.EventIngest },
		["throttlingPercentage"] = v6,
		["lastUpdated"] = { 2025, 9, 23 }
	},
	["closePage"] = {
		["eventName"] = "ingame_menu_action",
		["backends"] = nil,
		["throttlingPercentage"] = nil,
		["lastUpdated"] = nil,
		["description"] = "Fires when a React menu page is closed",
		["backends"] = { v4.TelemetryBackends.EventIngest },
		["throttlingPercentage"] = v7,
		["lastUpdated"] = { 2025, 9, 23 }
	}
}
v_u_8.configs = v9
function v_u_8.new() -- name: new
	-- upvalues: (copy) v_u_8
	local v10 = v_u_8
	return setmetatable({}, v10)
end
function v_u_8._logEventWithStandardizedFields(_, p11, p12, p13) -- name: _logEventWithStandardizedFields
	-- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_3
	local v14 = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	local v15 = p13 or {}
	if v_u_5 then
		table.insert(v14, "addPlaySessionId")
	else
		v15.playsessionid = v_u_1:GetPlaySessionId()
	end
	v_u_3:LogEvent(p11, {
		["eventContext"] = p12,
		["standardizedFields"] = v14,
		["customFields"] = v15
	})
end
function v_u_8.openPage(p16, p17) -- name: openPage
	local v18 = ("open_%*_page"):format(p17)
	p16:_logEventWithStandardizedFields(p16.configs.openPage, v18)
end
function v_u_8.closePage(p19, p20) -- name: closePage
	local v21 = ("close_%*_page"):format(p20)
	p19:_logEventWithStandardizedFields(p19.configs.closePage, v21)
end
return v_u_8