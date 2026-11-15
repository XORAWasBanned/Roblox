-- Path: CoreGui.RobloxGui.Modules.TopBar.Telemetry.GamepadMenuTelemetry
local v_u_1 = game:GetService("TelemetryService")
local v_u_2 = game:GetService("RbxAnalyticsService")
local v3 = script.Parent.Parent.Components.Presentation.GamepadMenu
require(v3.EnumGamepadMenuOptions)
local v_u_4 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local v_u_5 = game:DefineFastInt("GamepadMenuActionThrottleHundrethsPercent", 0)
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new() -- name: new
	-- upvalues: (copy) v_u_6
	local v7 = v_u_6
	return setmetatable({}, v7)
end
function v_u_6.onOptionSelected(p8) -- name: onOptionSelected
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_1
	local v9 = {
		["eventName"] = "coreui_gamepad_menu_action",
		["backends"] = nil,
		["throttlingPercentage"] = nil,
		["lastUpdated"] = nil,
		["description"] = "Event fired from the client every time GamepadMenu Options are Selected",
		["links"] = "https://github.rbx.com/Roblox/proto-schemas/pull/5803",
		["backends"] = { "EventIngest" },
		["throttlingPercentage"] = v_u_5,
		["lastUpdated"] = { 25, 4, 30 }
	}
	local v10 = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	local v11 = {
		["menu_option_name"] = p8.menuOptionName
	}
	local v12 = p8.usedShortcut
	local v13 = tostring
	local v14
	if v12 == nil then
		v14 = nil
	else
		v14 = v13(v12)
	end
	v11.used_shortcut = v14
	local v15 = p8.isToggleOpen
	local v16 = tostring
	local v17
	if v15 == nil then
		v17 = nil
	else
		v17 = v16(v15)
	end
	v11.is_toggle_open = v17
	if v_u_4 then
		table.insert(v10, "addPlaySessionId")
	else
		v11.playsessionid = v_u_2:GetPlaySessionId()
		v10 = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	end
	v_u_1:LogEvent(v9, {
		["standardizedFields"] = v10,
		["customFields"] = v11
	})
end
v_u_6.default = v_u_6.new()
return v_u_6