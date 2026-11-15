-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.Haptics
local v1 = script:FindFirstAncestor("Settings")
local v2 = game:GetService("CorePackages")
local v_u_3 = UserSettings().GameSettings
local v4 = require(v2.Workspace.Packages.SettingsService)
local v_u_5 = v4.ValueChangedSignal
local v6 = v4.SettingEnum
local v7 = require(v1.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER
local v_u_8 = {
	["ON"] = true,
	["OFF"] = false
}
local v_u_9 = {
	["MAX"] = 1,
	["MIN"] = 0
}
return {
	["id"] = "haptics",
	["field_type"] = nil,
	["label"] = "CoreScripts.InGameMenu.GameSettings.Haptics",
	["layoutOrder"] = nil,
	["onChanged"] = nil,
	["alreadyLocalized"] = false,
	["field_type"] = v6.Toggle,
	["layoutOrder"] = v7.HapticsFrame,
	["onChanged"] = (function() -- name: HapticValue
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_9, (copy) v_u_8
		local v10 = v_u_5.new
		local v11
		if v_u_3.HapticStrength == v_u_9.MIN then
			v11 = v_u_8.OFF
		else
			v11 = v_u_8.ON
		end
		local v12 = v10(v11)
		v12:connect(function(p13)
			-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_8
			local v14
			if v_u_3.HapticStrength == v_u_9.MIN then
				v14 = v_u_8.OFF
			else
				v14 = v_u_8.ON
			end
			if v14 ~= p13 then
				v_u_3.HapticStrength = p13 == true and 1 or 0
			end
		end)
		return v12
	end)()
}