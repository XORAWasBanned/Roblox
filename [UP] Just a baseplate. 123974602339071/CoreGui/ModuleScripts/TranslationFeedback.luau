-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.TranslationFeedback
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("RunService")
local v4 = script:FindFirstAncestor("Settings")
local v_u_5 = game:GetService("ExperienceStateCaptureService")
local v_u_6 = game:GetService("SafetyService")
local v7 = require(v4.Integrations.Constants)
local v8 = require(v2.Workspace.Packages.SettingsService)
local v9 = v8.ValueChangedSignal
local v10 = v8.AvailabilitySignal
local v11 = v8.SettingEnum
local v12 = require(v1.Modules.TenFootInterface):IsEnabled()
local v13 = v7.GAMESETTINGS.LAYOUT_ORDER
local v14 = v9.new()
v14:connect(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if not game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") or v_u_5:CanEnterCaptureMode() then
		local v15 = require(script.Parent.Parent.Parent.SettingsHub)
		if v15 then
			v15:SetVisibility(false)
		end
		if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
			v_u_6.IsCaptureModeForReport = false
		end
		if game:GetEngineFeature("CaptureModeEnabled") then
			v_u_5:ToggleCaptureMode()
		end
	end
end)
local v16 = v10.new(true)
if v3:IsStudio() or (game:GetEngineFeature("CaptureModeEnabled") == false or v12) then
	v16:set(false)
end
return {
	["field_type"] = nil,
	["id"] = "translation-feedback",
	["onActivated"] = nil,
	["label"] = "CoreScripts.InGameMenu.GameSettings.GiveTranslationFeedback",
	["text"] = "CoreScripts.InGameMenu.GameSettings.GiveFeedback",
	["layoutOrder"] = nil,
	["alreadyLocalized"] = false,
	["availability"] = nil,
	["field_type"] = v11.TextButton,
	["onActivated"] = v14,
	["layoutOrder"] = v13.FeedbackModeButton,
	["availability"] = v16
}