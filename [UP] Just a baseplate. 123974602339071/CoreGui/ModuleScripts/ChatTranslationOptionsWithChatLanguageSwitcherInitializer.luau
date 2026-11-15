-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer
local v_u_1 = game:GetService("TextChatService")
local v_u_2 = game:GetService("HttpService")
local v3 = game:GetService("CoreGui")
local v4 = game:GetService("CorePackages")
local v5 = v3:WaitForChild("RobloxGui")
local v_u_6 = require(v4.Workspace.Packages.CoreScriptsCommon).Url
local v_u_7 = UserSettings().GameSettings
local v_u_8 = game:GetService("Players")
local v_u_9 = v_u_8.LocalPlayer
local v_u_10 = require(v5.Modules.Settings.Utility)
local v_u_11 = require(v4.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local v_u_12 = require(v4.Workspace.Packages.RobloxTranslator)
local v_u_13 = game:DefineFastFlag("FixChatLanguageSwitcherLabel", false)
local v_u_14 = require(v5.Modules.Flags.GetFStringChatTranslationEnabledLocales)
local v_u_15 = game:GetEngineFeature("TextChatServiceSettingsSaved")
local v_u_16 = v_u_12:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
return function(p_u_17, p_u_18, p_u_19)
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_2, (copy) v_u_11, (copy) v_u_13, (copy) v_u_10, (copy) v_u_12, (copy) v_u_16, (copy) v_u_7, (copy) v_u_9, (copy) v_u_1, (copy) v_u_15, (copy) v_u_14
	local v_u_20 = { "en_us" }
	local v_u_21 = {
		["en_us"] = 1
	}
	local v_u_22 = { "English" }
	local v_u_23 = v_u_6.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", v_u_8.LocalPlayer.LocaleId:gsub("-", "_"))
	local function v_u_82(p24, p25) -- name: localeCodeToLanguageCodeMappingCallback
		-- upvalues: (ref) v_u_11, (ref) v_u_13, (copy) p_u_17, (ref) v_u_10, (ref) v_u_12, (ref) v_u_16, (copy) p_u_18, (ref) v_u_7, (copy) v_u_20, (ref) v_u_9, (ref) v_u_1, (copy) v_u_22, (copy) p_u_19, (ref) v_u_15
		if not p24 then
			v_u_11:warning("GameSettings chat language selector initialization failed to get all required information; defaulting to unavailable for the remainder of this session. Error message: " .. (p25 == nil and "Locales call did not set error message to non-nil value" or p25))
			if v_u_13 then
				local v26 = p_u_17
				local v27 = p_u_17
				local v28 = p_u_17
				local v29 = { v_u_16 }
				local v30, v31, v32 = v_u_10:AddNewRow(p_u_17, v_u_12:FormatByKey("Feature.SettingsHub.Chat.ChatLanguageSelectionLabel"), "DropDown", v29, 1)
				v26.ChatLanguageSelectorFrame = v30
				v27.ChatLanguageSelectorLabel = v31
				v28.ChatLanguageSelectorMode = v32
			else
				local v33 = p_u_17
				local v34 = p_u_17
				local v35 = p_u_17
				local v36, v37, v38 = v_u_10:AddNewRow(p_u_17, "Chat Language", "DropDown", { v_u_16 }, 1)
				v33.ChatLanguageSelectorFrame = v36
				v34.ChatLanguageSelectorLabel = v37
				v35.ChatLanguageSelectorMode = v38
			end
			p_u_17.ChatLanguageSelectorFrame.LayoutOrder = p_u_18.ChatLanguageSelectorFrame
		end
		local v39 = nil
		local v40 = v_u_7.ChatTranslationLocale
		if v40 ~= "" then
			for v41, v42 in v_u_20 do
				if v42 ~= v40 then
					continue
				end
				v39 = v41
			end
		end
		if v40 == "" or v39 == nil then
			for v43, v44 in v_u_20 do
				if v44 ~= v_u_9.LocaleId:gsub("-", "_") then
					continue
				end
				v_u_1.ChatTranslationEnabled = true
				v39 = v43
			end
		end
		if v39 == nil then
			v_u_1.ChatTranslationEnabled = false
			v39 = 1
		else
			v_u_7.ChatTranslationLocale = v_u_20[v39]
		end
		v_u_9:SetChatTranslationSettingsLocaleId(v_u_20[v39])
		local v_u_45 = v_u_20[v39]
		if v_u_13 then
			local v46 = p_u_17
			local v47 = p_u_17
			local v48 = p_u_17
			local v49, v50, v51 = v_u_10:AddNewRow(p_u_17, "Chat Translation Language", "DropDown", v_u_22, v39)
			v46.ChatLanguageSelectorFrame = v49
			v47.ChatLanguageSelectorLabel = v50
			v48.ChatLanguageSelectorMode = v51
		else
			local v52 = p_u_17
			local v53 = p_u_17
			local v54 = p_u_17
			local v55, v56, v57 = v_u_10:AddNewRow(p_u_17, "Chat Language", "DropDown", v_u_22, v39)
			v52.ChatLanguageSelectorFrame = v55
			v53.ChatLanguageSelectorLabel = v56
			v54.ChatLanguageSelectorMode = v57
		end
		p_u_17.ChatLanguageSelectorFrame.LayoutOrder = p_u_18.ChatLanguageSelectorFrame
		local function v61(p58) -- name: onChatSelectionIndexUpdated
			-- upvalues: (ref) v_u_7, (ref) v_u_20, (ref) v_u_9, (ref) v_u_45, (ref) p_u_19
			local v59 = v_u_7.ChatTranslationLocale
			local v60 = v_u_20[p58]
			v_u_7.ChatTranslationLocale = v60
			v_u_9:SetChatTranslationSettingsLocaleId(v60)
			v_u_45 = v60
			p_u_19("chat_translation_locale", v59, v60)
		end
		p_u_17.ChatLanguageSelectorMode.IndexChanged:connect(v61)
		local v62 = v_u_1.ChatTranslationToggleEnabled and 1 or 2
		local v63 = p_u_17
		local v64 = p_u_17
		local v65 = p_u_17
		local v66, v67, v68 = v_u_10:AddNewRow(p_u_17, v_u_12:FormatByKey("Feature.SettingsHub.Chat.TranslationToggleSetting"), "Selector", { "On", "Off" }, v62)
		v63.ChatTranslationToggleFrame = v66
		v64.ChatTranslationToggleLabel = v67
		v65.ChatTranslationToggleEnabler = v68
		p_u_17.ChatTranslationToggleFrame.LayoutOrder = p_u_18.ChatTranslationToggleFrame
		p_u_17.ChatTranslationToggleEnabler.IndexChanged:connect(function(p69)
			-- upvalues: (ref) v_u_1, (ref) v_u_15, (ref) v_u_7, (ref) p_u_19, (ref) v_u_45
			local v70 = p69 == 1
			local v71 = v_u_1.ChatTranslationToggleEnabled
			if v70 ~= v71 then
				if v_u_15 then
					v_u_7.ChatTranslationToggleEnabled = v70
				else
					v_u_1.ChatTranslationToggleEnabled = v70
				end
				p_u_19("chat_translation_toggle", v71, v70, {
					["locale_id"] = v_u_45
				})
			end
		end)
		local v72 = v_u_1.ChatTranslationEnabled and 1 or 2
		if v72 == 2 then
			p_u_17.ChatLanguageSelectorFrame.Visible = false
			p_u_17.ChatTranslationToggleFrame.Visible = false
		end
		local v73 = p_u_17
		local v74 = p_u_17
		local v75 = p_u_17
		local v76, v77, v78 = v_u_10:AddNewRow(p_u_17, v_u_12:FormatByKey("Feature.SettingsHub.Chat.TranslationSetting"), "Selector", { "On", "Off" }, v72)
		v73.ChatTranslationFrame = v76
		v74.ChatTranslationLabel = v77
		v75.ChatTranslationEnabler = v78
		p_u_17.ChatTranslationFrame.LayoutOrder = p_u_18.ChatTranslationFrame
		p_u_17.ChatTranslationEnabler.IndexChanged:connect(function(p79)
			-- upvalues: (ref) v_u_1, (ref) v_u_15, (ref) v_u_7, (ref) p_u_19, (ref) v_u_9, (ref) p_u_17
			local v80 = p79 == 1
			local v81 = v_u_1.ChatTranslationEnabled
			if v_u_15 then
				v_u_7.ChatTranslationEnabled = v80
			else
				v_u_1.ChatTranslationEnabled = v80
			end
			p_u_19("chat_translation", v81, v80, {
				["locale_id"] = v_u_9.LocaleId
			})
			if p79 == 1 then
				p_u_17.ChatLanguageSelectorFrame.Visible = true
				p_u_17.ChatTranslationToggleFrame.Visible = true
			else
				p_u_17.ChatLanguageSelectorFrame.Visible = false
				p_u_17.ChatTranslationToggleFrame.Visible = false
			end
		end)
	end
	v_u_2:RequestInternal({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_23
	}):Start(function(p83, p_u_84)
		-- upvalues: (ref) v_u_2, (ref) v_u_14, (copy) v_u_22, (copy) v_u_20, (copy) v_u_21, (ref) v_u_11, (copy) v_u_23, (copy) v_u_82
		local v85 = false
		local v86
		if p83 then
			if p_u_84.StatusCode == 401 then
				v86 = "Locale Code to Language Code Mapping Request: Unauthorized"
			elseif p_u_84.StatusCode < 200 or p_u_84.StatusCode >= 400 then
				v86 = "Locale Code to Language Code Mapping Request Status code: " .. p_u_84.StatusCode
			else
				local function v97()
					-- upvalues: (ref) v_u_2, (copy) p_u_84, (ref) v_u_14, (ref) v_u_22, (ref) v_u_20, (ref) v_u_21
					local v87 = v_u_2:JSONDecode(p_u_84.Body)
					local v88 = {}
					for v89 in v_u_14():gmatch("([^,]+)") do
						table.insert(v88, v89)
					end
					local v90 = 2
					for _, v91 in pairs(v87.data) do
						local v92 = v91.locale.locale
						local v93 = v91.locale.language.name
						if v92 == "en_us" then
							v_u_22[1] = v93
						else
							for _, v94 in v88 do
								if v94 ~= v92 then
									continue
								end
								v95 = true
							end
							local v95 = false
							if not v95 then
								break
							end
							local v96 = v_u_22
							table.insert(v96, v93)
							v_u_20[v90] = v92
							v_u_21[v92] = v90
							v90 = v90 + 1
						end
					end
				end
				v85, v86 = pcall(v97)
			end
		else
			v86 = "Locale Code to Language Code Mapping Request: Connection error"
		end
		if not v85 then
			v_u_11:warning("GameSettings chat language selector initialization: Failed to get response from Localization API for " .. v_u_23 .. " with error message: " .. v86)
		end
		v_u_82(v85, v86)
	end)
end