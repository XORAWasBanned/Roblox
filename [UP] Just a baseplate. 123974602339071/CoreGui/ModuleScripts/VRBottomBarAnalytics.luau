-- Path: CoreGui.RobloxGui.Modules.VR.VRBottomBar.VRBottomBarAnalytics
local v_u_1 = game:GetService("RbxAnalyticsService")
local v_u_2 = game:GetService("TelemetryService")
local v_u_3 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
return {
	["sendEventToTelemetryV2"] = function(p4) -- name: sendEventToTelemetryV2
		-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
		local v5 = {
			["eventName"] = "coreui_vr_bottom_bar_action",
			["backends"] = nil,
			["throttlingPercentage"] = nil,
			["lastUpdated"] = nil,
			["description"] = "Event fired from the client every time VRBottomBar buttons are clicked",
			["links"] = "https://github.rbx.com/Roblox/proto-schemas/pull/5803",
			["backends"] = { "EventIngest" },
			["throttlingPercentage"] = game:DefineFastInt("VRBottomBarActionEventThrottleHunderedthsPercent", 0),
			["lastUpdated"] = { 2025, 5, 12 }
		}
		local v6 = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		local v7 = {
			["integration_id"] = p4.integrationId
		}
		local v8 = p4.isToggleOn
		v7.is_toggle_on = tostring(v8)
		v7.source = p4.source
		if v_u_3 then
			table.insert(v6, "addPlaySessionId")
		else
			v7.playsessionid = v_u_1:GetPlaySessionId()
		end
		v_u_2:LogEvent(v5, {
			["standardizedFields"] = v6,
			["customFields"] = v7
		})
	end
}