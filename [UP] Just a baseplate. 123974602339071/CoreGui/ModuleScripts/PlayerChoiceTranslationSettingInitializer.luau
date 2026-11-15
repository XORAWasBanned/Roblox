-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.PlayerChoiceTranslationSettingInitializer
local v_u_1 = game:GetService("LocalizationService")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v4 = v2:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.Settings.Utility)
local v_u_6 = require(v3.Workspace.Packages.InExperienceLocales).Localization
local v_u_7 = { "On", "Off" }
return function(p8, p9, p_u_10)
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_5, (copy) v_u_7
	local v11 = v_u_6.new(v_u_1.RobloxLocaleId)
	local v12 = v11:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingLabel")
	local v13 = v11:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingDescription")
	local v_u_14 = v_u_1:GetIsLoadingInternalTranslations() and 1 or 2
	local v15, v16, v17 = v_u_5:AddNewRow(p8, v12, "Selector", v_u_7, v_u_14, nil, v13)
	p8.PlayerChoiceTranslationFrame = v15
	p8.PlayerChoiceSettingLabel = v16
	p8.PlayerChoiceSettingMode = v17
	p8.PlayerChoiceTranslationFrame.LayoutOrder = p9.PlayerChoiceTranslationFrame
	p8.PlayerChoiceSettingMode.IndexChanged:connect(function(p18)
		-- upvalues: (copy) v_u_14, (ref) v_u_1, (copy) p_u_10
		local v19 = p18 == 1
		local v20 = v_u_14 == 1
		v_u_1:IsLoadingInternalTranslationsSettingChanged(v19)
		p_u_10("player_choice_translation", v20, v19)
	end)
	return p8.PlayerChoiceTranslationFrame, p8.PlayerChoiceSettingLabel, p8.PlayerChoiceSettingMode
end