-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.UINavToggle
local v1 = script:FindFirstAncestor("Settings")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = UserSettings().GameSettings
local v5 = require(v2.Workspace.Packages.SettingsService)
local v6 = v5.ValueChangedSignal
local v7 = v5.AvailabilitySignal
local v8 = v5.SettingEnum
local v9 = require(v1.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER
local v10 = {
	["id"] = "ui-nav-toggle",
	["field_type"] = nil,
	["label"] = "CoreScripts.InGameMenu.GameSettings.UINavToggle",
	["description"] = "CoreScripts.InGameMenu.GameSettings.UINavToggleDescription",
	["alreadyLocalized"] = false,
	["onChanged"] = nil,
	["availability"] = nil,
	["layoutOrder"] = nil,
	["field_type"] = v8.Toggle
}
local v11 = v6.new(v_u_4.UiNavigationKeyBindEnabled)
v11:connect(function(p12)
	-- upvalues: (copy) v_u_4
	if v_u_4.UiNavigationKeyBindEnabled ~= p12 then
		v_u_4.UiNavigationKeyBindEnabled = p12
	end
end)
v10.onChanged = v11
local v_u_13 = v7.new(v_u_3.KeyboardEnabled)
v_u_3:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
	-- upvalues: (copy) v_u_13, (copy) v_u_3
	v_u_13:set(v_u_3.KeyboardEnabled)
end)
v10.availability = v_u_13
v10.layoutOrder = v9.UiNavigationKeyBindEnabledFrame
return v10