-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.VRSafeBubble
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v4 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v_u_5 = require(v2.Workspace.Packages.VrCommon).VRHub
local v6 = require(v2.Workspace.Packages.AppCommonLib).Signal
local v7 = require(v1.Service)
local v8 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_9 = require(v1.Integrations.CommonIcon)
local v10 = v8.MappedSignal
local v11
if v4() then
	v11 = v7.AvailabilitySignal.Available
else
	v11 = v7.AvailabilitySignal.Unavailable
end
local v_u_12 = v6.new()
local v_u_14 = v10.new(v_u_12, function()
	-- upvalues: (copy) v_u_5
	local v13 = v_u_5.SafetyBubble
	if v13 then
		v13 = v_u_5.SafetyBubble.enabled
	end
	return v13
end)
if v_u_5.SafetyBubble then
	v_u_5.SafetyBubble.Toggled.Event:Connect(function()
		-- upvalues: (copy) v_u_12
		v_u_12:fire()
	end)
end
local v15 = {
	["initialAvailability"] = nil,
	["id"] = "vr_safety_bubble",
	["label"] = "CoreScripts.VRFTUX.Heading.SafetyBubble.Title",
	["isActivated"] = nil,
	["activated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v11,
	["isActivated"] = v_u_14,
	["activated"] = function() -- name: activated
		-- upvalues: (copy) v_u_5, (copy) v_u_3
		v_u_5:ToggleSafetyBubble()
		v_u_3:ReportCounter("VR-BottomBar-Safety")
	end,
	["components"] = {
		["Icon"] = function() -- name: Icon
			-- upvalues: (copy) v_u_9, (copy) v_u_14
			return v_u_9("rbxasset://textures/ui/MenuBar/icon_safety_off.png", "rbxasset://textures/ui/MenuBar/icon_safety_on.png", v_u_14)
		end
	}
}
return v7:register(v15)