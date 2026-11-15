-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.VRToggleButton
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v4 = game:GetService("CoreGui")
local v5 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v6 = v4:WaitForChild("RobloxGui")
local v_u_7 = require(v2.Workspace.Packages.VrCommon).VRHub
local v_u_8 = require(v6.Modules.Settings.SettingsHub)
local v9 = require(v2.Workspace.Packages.AppCommonLib).Signal
local v10 = require(v1.Service)
local v11 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_12 = require(v1.Integrations.CommonIcon)
local v13 = v11.MappedSignal
local v_u_14 = require(v2.Workspace.Packages.VrSpatialUi).UIManager
local v15
if v5() then
	v15 = v10.AvailabilitySignal.Available
else
	v15 = v10.AvailabilitySignal.Unavailable
end
local v_u_16 = v9.new()
local v_u_17 = v13.new(v_u_16, function()
	-- upvalues: (copy) v_u_7
	return v_u_7.ShowTopBar
end)
v_u_7.ShowTopBarChanged.Event:Connect(function()
	-- upvalues: (copy) v_u_16
	v_u_16:fire()
end)
local v18 = {
	["initialAvailability"] = nil,
	["id"] = "vr_toggle_button",
	["label"] = "Feature.Catalog.Label.Filter.Hide",
	["isActivated"] = nil,
	["activated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v15,
	["isActivated"] = v_u_17,
	["activated"] = function() -- name: activated
		-- upvalues: (copy) v_u_7, (copy) v_u_14, (copy) v_u_8, (copy) v_u_3
		if v_u_7.ShowTopBar then
			v_u_14.getInstance():prepareGuiToggleAnimationState()
			v_u_7:SetShowTopBar(false)
			if v_u_8:GetVisibility() then
				v_u_8:ToggleVisibility()
			end
		else
			v_u_7:SetShowTopBar(true)
		end
		v_u_3:ReportCounter("VR-BottomBar-ToggleGui")
	end,
	["components"] = {
		["Icon"] = function() -- name: Icon
			-- upvalues: (copy) v_u_12, (copy) v_u_17
			return v_u_12("rbxasset://textures/ui/MenuBar/icon_maximize.png", "rbxasset://textures/ui/MenuBar/icon_minimize.png", v_u_17)
		end
	}
}
return v10:register(v18)