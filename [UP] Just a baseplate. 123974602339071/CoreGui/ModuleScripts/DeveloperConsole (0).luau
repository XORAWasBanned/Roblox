-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.DeveloperConsole
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("RunService")
local v5 = script:FindFirstAncestor("Settings")
local v_u_6 = require(v1.Modules.PlayerPermissionsModule)
local v7 = require(v5.Integrations.Constants)
local v8 = require(v2.Workspace.Packages.SettingsService)
local v9 = v8.ValueChangedSignal
local v_u_10 = v8.AvailabilitySignal
local v11 = v8.SettingEnum
local v_u_12 = require(script.Parent.Parent.Parent.Parent.DevConsoleMaster)
local v13 = v7.GAMESETTINGS.LAYOUT_ORDER
local v14 = v9.new()
v14:connect(function()
	-- upvalues: (copy) v_u_12
	if v_u_12 then
		v_u_12:SetVisibility(true)
		local v15 = require(script.Parent.Parent.Parent.SettingsHub)
		if v15 then
			v15:SetVisibility(false)
		end
	end
end)
local v17 = (function() -- name: DeveloperConsoleAvailability
	-- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_6, (copy) v_u_3
	local v_u_16 = v_u_10.new(false)
	if v_u_4:IsStudio() then
		v_u_16:set(true)
		return v_u_16
	else
		spawn(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_3, (copy) v_u_16
			v_u_16:set((v_u_6.CanPlayerManagePlaceAsync(v_u_3.LocalPlayer)))
		end)
		return v_u_16
	end
end)()
return {
	["field_type"] = nil,
	["id"] = "developer-console",
	["onActivated"] = nil,
	["label"] = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole",
	["text"] = "CoreScripts.InGameMenu.GameSettings.Open",
	["layoutOrder"] = nil,
	["alreadyLocalized"] = false,
	["availability"] = nil,
	["field_type"] = v11.TextButton,
	["onActivated"] = v14,
	["layoutOrder"] = v13.DeveloperConsoleButton,
	["availability"] = v17
}