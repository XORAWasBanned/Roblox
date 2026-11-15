-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.CameraInverted
local v1 = script:FindFirstAncestor("Settings")
local v2 = game:GetService("CorePackages")
local v_u_3 = UserSettings().GameSettings
local v4 = require(v2.Workspace.Packages.SettingsService)
local v5 = v4.ValueChangedSignal
local v6 = v4.AvailabilitySignal
local v7 = v4.SettingEnum
local v8 = require(v1.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER
local v9 = {
	["id"] = "camera-inverted",
	["field_type"] = nil,
	["label"] = "CoreScripts.InGameMenu.GameSettings.InvertedCamera",
	["alreadyLocalized"] = false,
	["onChanged"] = nil,
	["availability"] = nil,
	["layoutOrder"] = nil,
	["field_type"] = v7.Toggle
}
local v10 = v5.new(v_u_3.CameraYInverted)
v10:connect(function(p11)
	-- upvalues: (copy) v_u_3
	if v_u_3.CameraYInverted ~= p11 then
		v_u_3.CameraYInverted = p11
	end
end, true)
v9.onChanged = v10
local v_u_12 = v6.new(v_u_3.IsUsingCameraYInverted)
v_u_3.Changed:Connect(function(p13)
	-- upvalues: (copy) v_u_12, (copy) v_u_3
	if p13 == "IsUsingCameraYInverted" then
		v_u_12:set(v_u_3.IsUsingCameraYInverted)
	end
end)
v9.availability = v_u_12
v9.layoutOrder = v8.CameraInvertedFrame
return v9