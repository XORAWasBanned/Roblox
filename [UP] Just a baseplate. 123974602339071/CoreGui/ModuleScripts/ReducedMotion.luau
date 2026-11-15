-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.ReducedMotion
local v1 = script:FindFirstAncestor("Settings")
local v2 = game:GetService("CorePackages")
local v_u_3 = UserSettings().GameSettings
local v4 = require(v2.Workspace.Packages.SettingsService)
local v5 = v4.ValueChangedSignal
local v6 = v4.SettingEnum
local v7 = require(v1.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER
local v8 = {
	["id"] = "reduced-motion",
	["field_type"] = nil,
	["label"] = "CoreScripts.InGameMenu.GameSettings.ReduceMotionLabel",
	["description"] = "CoreScripts.InGameMenu.GameSettings.ReduceMotionDescription",
	["alreadyLocalized"] = false,
	["onChanged"] = nil,
	["layoutOrder"] = nil,
	["field_type"] = v6.Toggle
}
local v9 = v_u_3.ReducedMotion
local v10 = v5.new(v9)
v10:connect(function(p11)
	-- upvalues: (copy) v_u_3
	if v_u_3.ReducedMotion ~= p11 then
		v_u_3.ReducedMotion = p11
	end
end)
v8.onChanged = v10
v8.layoutOrder = v7.ReducedMotionFrame
return v8