-- Path: CoreGui.RobloxGui.Modules.TopBar.Telemetry.LogGamepadOpenExperienceControlsMenu
local v_u_1 = game:GetService("TelemetryService")
local v_u_2 = game:GetService("RbxAnalyticsService")
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Flags.FFlagLoggingGamepadOpenExpControlsMenu)
local v5 = game:DefineFastInt("GamepadOpenExperienceControlsMenuThrottleHundrethsPercent", 0)
local v_u_6 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local v_u_7 = {
	["eventName"] = "coreui_gamepad_toggle_exp_controls",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Event fired from the client every time Experience Controls Menu is toggled open/closed",
	["links"] = "https://github.rbx.com/Roblox/proto-schemas/pull/5750",
	["backends"] = { "EventIngest" },
	["throttlingPercentage"] = v5,
	["lastUpdated"] = { 25, 4, 25 }
}
return function(p8)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2, (copy) v_u_1, (copy) v_u_7
	if v_u_4 then
		local v9, v10
		if v_u_6 then
			v9 = {
				["is_toggle_open"] = tostring(p8)
			}
			v10 = {
				"addPlaceId",
				"addUniverseId",
				"addPlaySessionId",
				"addSessionInfo"
			}
		else
			v9 = {
				["is_toggle_open"] = tostring(p8),
				["playsessionid"] = v_u_2:GetPlaySessionId()
			}
			v10 = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		end
		v_u_1:LogEvent(v_u_7, {
			["standardizedFields"] = v10,
			["customFields"] = v9
		})
	end
end