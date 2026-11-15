-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.Fullscreen
local v1 = script:FindFirstAncestor("Settings")
local v2 = game:GetService("CorePackages")
local v_u_3 = UserSettings().GameSettings
local v_u_4 = game:GetService("GuiService")
local v5 = require(v2.Workspace.Packages.SettingsService)
local v_u_6 = v5.ValueChangedSignal
local v7 = v5.AvailabilitySignal
local v8 = v5.SettingEnum
local v9 = require(v1.Integrations.Constants)
local v10 = require(v1.Integrations.Utils)
local v11 = v9.GAMESETTINGS.LAYOUT_ORDER
local v15 = (function() -- name: FullScreenValue
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	local v_u_12 = v_u_6.new(v_u_3:InFullScreen())
	v_u_12:connect(function(p13)
		-- upvalues: (ref) v_u_3, (ref) v_u_4
		if p13 ~= v_u_3:InFullScreen() then
			v_u_4:ToggleFullscreen()
		end
	end, true)
	v_u_3.FullscreenChanged:Connect(function(p14)
		-- upvalues: (copy) v_u_12
		v_u_12:set(p14)
	end)
	return v_u_12
end)()
local v16 = v7.new(v10.getDeviceType() == v10.DeviceTypes.Desktop and true or v10.getDeviceType() == v10.DeviceTypes.Unknown)
return {
	["id"] = "fullscreen",
	["field_type"] = nil,
	["label"] = "CoreScripts.InGameMenu.GameSettings.FullScreen",
	["layoutOrder"] = nil,
	["onChanged"] = nil,
	["alreadyLocalized"] = false,
	["availability"] = nil,
	["field_type"] = v8.Toggle,
	["layoutOrder"] = v11.FullScreenFrame,
	["onChanged"] = v15,
	["availability"] = v16
}