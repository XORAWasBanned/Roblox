-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.ExperienceLanguageSwitcherInitializer
local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("HttpService")
local v3 = game:GetService("CoreGui")
local v4 = game:GetService("CorePackages")
local v5 = v3:WaitForChild("RobloxGui")
local v_u_6 = require(v4.Workspace.Packages.CoreScriptsCommon).Url
local v_u_7 = game:GetService("Players")
local v_u_8 = v_u_7.LocalPlayer
local v_u_9 = require(v5.Modules.Settings.Utility)
local v_u_10 = require(v4.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local v_u_11 = require(v4.Workspace.Packages.RobloxTranslator)
local v_u_12 = game:GetEngineFeature("UgcLocaleFromGameJoinEnabled")
local v_u_13 = {
	["sq"] = "sq_al",
	["ar"] = "ar_001",
	["bn"] = "bn_bd",
	["nb"] = "nb_no",
	["bs"] = "bs_ba",
	["bg"] = "bg_bg",
	["my"] = "my_mm",
	["zh-hans"] = "zh_cn",
	["zh-hant"] = "zh_tw",
	["hr"] = "hr_hr",
	["cs"] = "cs_cz",
	["da"] = "da_dk",
	["nl"] = "nl_nl",
	["en"] = "en_us",
	["et"] = "et_ee",
	["fil"] = "fil_ph",
	["fi"] = "fi_fi",
	["fr"] = "fr_fr",
	["ka"] = "ka_ge",
	["de"] = "de_de",
	["el"] = "el_gr",
	["hi"] = "hi_in",
	["hu"] = "hu_hu",
	["id"] = "id_id",
	["it"] = "it_it",
	["ja"] = "ja_jp",
	["kk"] = "kk_kz",
	["km"] = "km_kh",
	["ko"] = "ko_kr",
	["lv"] = "lv_lv",
	["lt"] = "lt_lt",
	["ms"] = "ms_my",
	["pl"] = "pl_pl",
	["pt"] = "pt_br",
	["ro"] = "ro_ro",
	["ru"] = "ru_ru",
	["sr"] = "sr_rs",
	["si"] = "si_lk",
	["sk"] = "sk_sk",
	["sl"] = "sl_sl",
	["es"] = "es_es",
	["sv"] = "sv_se",
	["th"] = "th_th",
	["tr"] = "tr_tr",
	["uk"] = "uk_ua",
	["vi"] = "vi_vn"
}
return function(p_u_14, p_u_15, p_u_16)
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_2, (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (copy) v_u_12, (copy) v_u_8, (copy) v_u_1, (copy) v_u_13
	local v_u_17 = 1
	local v_u_18 = 1
	local v_u_19 = false
	local v_u_20 = nil
	local v_u_21 = v_u_7.LocalPlayer.LocaleId:gsub("-", "_")
	local v_u_22 = nil
	local v_u_23 = {}
	local v_u_24 = {}
	local v_u_25 = {}
	local v_u_26 = {}
	local v_u_27 = {}
	local v_u_28 = {}
	local v_u_29 = v_u_6.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", v_u_7.LocalPlayer.LocaleId:gsub("-", "_"))
	local v30 = v_u_2:RequestInternal({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_29
	})
	local v_u_31 = v_u_6.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
	local v_u_32 = v_u_2:RequestInternal({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_31
	})
	local v_u_33 = v_u_6.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
	local v_u_34 = v_u_2:RequestInternal({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_33
	})
	local v_u_35 = v_u_6.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
	local v_u_36 = v_u_2:RequestInternal({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_35
	})
	local function v_u_43() -- name: createSessionDormantLanguageSwitcherRow
		-- upvalues: (copy) p_u_14, (ref) v_u_9, (ref) v_u_11, (copy) p_u_15
		local v37 = p_u_14
		local v38 = p_u_14
		local v39 = p_u_14
		local v40, v41, v42 = v_u_9:AddNewRow(p_u_14, v_u_11:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { v_u_11:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable") }, 1)
		v37.LanguageSelectorFrame = v40
		v38.LanguageSelectorLabel = v41
		v39.LanguageSelectorMode = v42
		p_u_14.LanguageSelectorMode:SetInteractable(false)
		p_u_14.LanguageSelectorFrame.LayoutOrder = p_u_15.LanguageSelectorFrame
	end
	local function v_u_74(p44, p45) -- name: userExperienceLanguageSettingsCallback
		-- upvalues: (ref) v_u_10, (copy) v_u_43, (copy) v_u_24, (ref) v_u_22, (ref) v_u_20, (copy) v_u_28, (copy) v_u_25, (copy) v_u_23, (ref) v_u_17, (ref) v_u_18, (copy) p_u_14, (ref) v_u_9, (ref) v_u_11, (copy) p_u_15, (ref) v_u_12, (ref) v_u_8, (copy) p_u_16, (ref) v_u_6, (ref) v_u_2, (ref) v_u_19, (ref) v_u_1
		if p44 then
			local v46 = false
			for _, v47 in v_u_24 do
				v46 = v47 == v_u_22 and true or v46
				if v47 == v_u_20 then
					continue
				end
				local v48 = v_u_28
				local v49 = v_u_25[v47].localeName
				table.insert(v48, v49)
			end
			table.sort(v_u_28)
			if v_u_20 ~= nil and v_u_25[v_u_20].localeName ~= nil then
				local v50 = v_u_28
				local v51 = v_u_25[v_u_20].localeName .. " (Original)"
				table.insert(v50, 1, v51)
				if v46 == true then
					for v52, v53 in v_u_28 do
						if v52 == 1 or v_u_23[v53] ~= v_u_22 then
							continue
						end
						v_u_17 = v52
						v_u_18 = v52
					end
				end
				local v54 = p_u_14
				local v55 = p_u_14
				local v56 = p_u_14
				local v57, v58, v59 = v_u_9:AddNewRow(p_u_14, v_u_11:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v_u_28, v_u_17)
				v54.LanguageSelectorFrame = v57
				v55.LanguageSelectorLabel = v58
				v56.LanguageSelectorMode = v59
				p_u_14.LanguageSelectorFrame.LayoutOrder = p_u_15.LanguageSelectorFrame
				if not v_u_12 then
					if v_u_17 == 1 then
						v_u_8:SetExperienceSettingsLocaleId(v_u_20)
					else
						v_u_8:SetExperienceSettingsLocaleId(v_u_23[v_u_28[v_u_17]])
					end
				end
				p_u_14.LanguageSelectorMode.CurrentLocale = p_u_14.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
				local function v73(p_u_60) -- name: toggleTranslation
					-- upvalues: (ref) p_u_14, (ref) v_u_25, (ref) v_u_20, (ref) v_u_23, (ref) v_u_28, (ref) p_u_16, (ref) v_u_6, (ref) v_u_2, (ref) v_u_18, (ref) v_u_8, (ref) v_u_10, (ref) v_u_19, (ref) v_u_1
					p_u_14.LanguageSelectorMode:SetInteractable(false)
					local v61
					if p_u_60 == 1 and v_u_25[v_u_20] ~= nil then
						v61 = v_u_25[v_u_20].localeId
					else
						v61 = v_u_25[v_u_23[v_u_28[p_u_60]]].localeId
					end
					local v62 = p_u_14.LanguageSelectorMode.CurrentLocale
					local v63 = v_u_28[p_u_60]
					if v62 ~= v63 then
						p_u_14.LanguageSelectorMode.CurrentLocale = v63
						p_u_16("experience_locale", v62, v63)
					end
					local v_u_64 = v_u_6.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
					local v65 = v_u_2:RequestInternal({
						["Url"] = nil,
						["Method"] = "POST",
						["Headers"] = nil,
						["Body"] = nil,
						["Url"] = v_u_64,
						["Headers"] = {
							["Content-Type"] = "application/json"
						},
						["Body"] = v_u_2:JSONEncode({
							["settingValue"] = {
								["settingType"] = "SupportedLocale",
								["settingTargetId"] = nil,
								["settingTargetId"] = v61
							}
						})
					})
					local function v_u_68(p66, p67) -- name: userExperienceLanguageSettingsUpdateCallback
						-- upvalues: (ref) v_u_18, (copy) p_u_60, (ref) v_u_8, (ref) v_u_20, (ref) v_u_23, (ref) v_u_28, (ref) v_u_10, (ref) v_u_19, (ref) p_u_14
						if p66 then
							v_u_18 = p_u_60
							if p_u_60 == 1 then
								v_u_8:SetExperienceSettingsLocaleId(v_u_20)
							else
								v_u_8:SetExperienceSettingsLocaleId(v_u_23[v_u_28[p_u_60]])
							end
						else
							v_u_10:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p67)
							v_u_19 = true
							p_u_14.LanguageSelectorMode:SetSelectionIndex(v_u_18)
						end
						p_u_14.LanguageSelectorMode:SetInteractable(true)
					end
					if v_u_1:IsStudio() then
						v_u_18 = p_u_60
						if p_u_60 == 1 then
							v_u_8:SetExperienceSettingsLocaleId(v_u_20)
						else
							v_u_8:SetExperienceSettingsLocaleId(v_u_23[v_u_28[p_u_60]])
						end
						p_u_14.LanguageSelectorMode:SetInteractable(true)
						return
					elseif v_u_19 then
						v_u_19 = false
						v_u_18 = p_u_60
						if p_u_60 == 1 then
							v_u_8:SetExperienceSettingsLocaleId(v_u_20)
						else
							v_u_8:SetExperienceSettingsLocaleId(v_u_23[v_u_28[p_u_60]])
						end
						p_u_14.LanguageSelectorMode:SetInteractable(true)
						return
					elseif v61 == nil then
						v_u_10:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. nil)
						v_u_19 = true
						p_u_14.LanguageSelectorMode:SetSelectionIndex(v_u_18)
						p_u_14.LanguageSelectorMode:SetInteractable(true)
					else
						v65:Start(function(p69, p70)
							-- upvalues: (ref) v_u_10, (copy) v_u_64, (copy) v_u_68
							local v71 = false
							local v72 = nil
							if p69 and (p70 and p70.StatusCode) then
								if p70.StatusCode == 401 then
									v72 = "Unauthorized"
								elseif p70.StatusCode < 200 or p70.StatusCode >= 400 then
									v72 = p70.StatusCode
								end
							else
								v72 = "Connection error"
							end
							if v72 == nil then
								v_u_10:info("User Experience Language Settings Update Request: " .. "Succeeded with code - " .. p70.StatusCode)
								v71 = true
							else
								v72 = "User Experience Language Settings Update Request: " .. v72
								v_u_10:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v_u_64 .. " with error message: " .. v72)
							end
							v_u_68(v71, v72)
						end)
					end
				end
				p_u_14.LanguageSelectorMode.IndexChanged:connect(v73)
			else
				v_u_43()
			end
		else
			v_u_10:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. (p45 == nil and "Execution path did not set earliest error to non-nil value." or p45))
			v_u_43()
			return
		end
	end
	v30:Start(function(p75, p_u_76)
		-- upvalues: (ref) v_u_2, (ref) v_u_13, (copy) v_u_27, (copy) v_u_25, (copy) v_u_26, (copy) v_u_23, (ref) v_u_10, (copy) v_u_29, (copy) v_u_34, (copy) v_u_24, (copy) v_u_33, (copy) v_u_32, (ref) v_u_20, (copy) v_u_31, (copy) v_u_36, (ref) v_u_22, (copy) v_u_21, (copy) v_u_35, (copy) v_u_74, (copy) v_u_43
		local v_u_77 = false
		local v78 = nil
		if p75 and (p_u_76 and p_u_76.StatusCode) then
			if p_u_76.StatusCode == 401 then
				v78 = "Unauthorized"
			elseif p_u_76.StatusCode < 200 or p_u_76.StatusCode >= 400 then
				v78 = p_u_76.StatusCode
			end
		else
			v78 = "Connection error"
		end
		local v_u_79
		if v78 == nil then
			local function v88()
				-- upvalues: (ref) v_u_2, (copy) p_u_76, (ref) v_u_13, (ref) v_u_27, (ref) v_u_25, (ref) v_u_26, (ref) v_u_23
				local v80 = v_u_2:JSONDecode(p_u_76.Body)
				for _, v81 in pairs(v80.data) do
					local v82 = v81.locale.language.languageCode
					local v83 = v81.locale.language.id
					local v84 = v81.locale.language.name
					local v85 = v81.locale.locale
					local v86 = v81.locale.id
					local v87 = v81.locale.name
					if v_u_13[v82] == v85 then
						v_u_27[v83] = v86
					end
					v_u_25[v85] = {
						["localeName"] = v87,
						["localeId"] = v86,
						["languageName"] = v84,
						["languageId"] = v83,
						["languageCode"] = v82
					}
					v_u_26[v86] = v85
					v_u_23[v87] = v85
				end
			end
			v_u_77, v_u_79 = pcall(v88)
		else
			v_u_79 = "Locale Information Request: " .. v78
		end
		if not v_u_77 then
			v_u_10:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v_u_29 .. " with error message: " .. v_u_79)
		end
		if v_u_77 then
			v_u_34:Start(function(p89, p_u_90)
				-- upvalues: (ref) v_u_2, (ref) v_u_25, (ref) v_u_24, (ref) v_u_10, (ref) v_u_33, (ref) v_u_79, (copy) v_u_77, (ref) v_u_32, (ref) v_u_20, (ref) v_u_13, (ref) v_u_31, (ref) v_u_36, (ref) v_u_22, (ref) v_u_21, (ref) v_u_27, (ref) v_u_26, (ref) v_u_35, (ref) v_u_74, (ref) v_u_43
				local v_u_91 = false
				local v92 = nil
				if p89 and (p_u_90 and p_u_90.StatusCode) then
					if p_u_90.StatusCode == 401 then
						v92 = "Unauthorized"
					elseif p_u_90.StatusCode < 200 or p_u_90.StatusCode >= 400 then
						v92 = p_u_90.StatusCode
					end
				else
					v92 = "Connection error"
				end
				local v93
				if v92 == nil then
					local function v102()
						-- upvalues: (ref) v_u_2, (copy) p_u_90, (ref) v_u_25, (ref) v_u_24
						local v94 = v_u_2:JSONDecode(p_u_90.Body)
						local v95 = {}
						for v96, v97 in pairs(v94.data) do
							v95[v96] = v97.languageCode
						end
						for _, v98 in v95 do
							for v99, v100 in v_u_25 do
								if v100.languageCode ~= v98 then
									continue
								end
								local v101 = v_u_24
								table.insert(v101, v99)
							end
						end
					end
					v_u_91, v93 = pcall(v102)
				else
					v93 = "Experience Supported Language Language Request: " .. v92
				end
				if not v_u_91 then
					v_u_10:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v_u_33 .. " with error message: " .. v93)
				end
				if v_u_79 == nil then
					v_u_79 = v93
				end
				if v_u_91 then
					v_u_91 = v_u_77
				end
				local v_u_103 = v_u_79
				if v_u_91 then
					v_u_32:Start(function(p104, p_u_105)
						-- upvalues: (ref) v_u_2, (ref) v_u_20, (ref) v_u_13, (ref) v_u_10, (ref) v_u_31, (ref) v_u_103, (copy) v_u_91, (ref) v_u_36, (ref) v_u_22, (ref) v_u_21, (ref) v_u_27, (ref) v_u_26, (ref) v_u_35, (ref) v_u_74, (ref) v_u_43
						local v106 = false
						local v107 = nil
						if p104 and (p_u_105 and p_u_105.StatusCode) then
							if p_u_105.StatusCode == 401 then
								v107 = "Unauthorized"
							elseif p_u_105.StatusCode < 200 or p_u_105.StatusCode >= 400 then
								v107 = p_u_105.StatusCode
							end
						else
							v107 = "Connection error"
						end
						local v108
						if v107 == nil then
							local function v109()
								-- upvalues: (ref) v_u_2, (copy) p_u_105, (ref) v_u_20, (ref) v_u_13
								v_u_20 = v_u_13[v_u_2:JSONDecode(p_u_105.Body).languageCode]
							end
							v106, v108 = pcall(v109)
						else
							v108 = "Experience Source Language Request: " .. v107
						end
						if not v106 then
							v_u_10:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v_u_31 .. " with error message: " .. v108)
						end
						if v_u_103 == nil then
							v_u_103 = v108
						end
						if v106 then
							v106 = v_u_91
						end
						local v110 = v_u_103
						if v106 then
							v_u_36:Start(function(p111, p_u_112)
								-- upvalues: (ref) v_u_2, (ref) v_u_22, (ref) v_u_21, (ref) v_u_20, (ref) v_u_27, (ref) v_u_26, (ref) v_u_10, (ref) v_u_35, (ref) v_u_74
								local v113 = false
								local v114 = nil
								if p111 and (p_u_112 and p_u_112.StatusCode) then
									if p_u_112.StatusCode == 401 then
										v114 = "Unauthorized"
									elseif p_u_112.StatusCode < 200 or p_u_112.StatusCode >= 400 then
										v114 = p_u_112.StatusCode
									end
								else
									v114 = "Connection error"
								end
								local v115
								if v114 == nil then
									local function v119()
										-- upvalues: (ref) v_u_2, (copy) p_u_112, (ref) v_u_22, (ref) v_u_21, (ref) v_u_20, (ref) v_u_27, (ref) v_u_26
										local v116 = v_u_2:JSONDecode(p_u_112.Body).userUniverseLocalizationSettingValue
										if v116 == nil then
											v_u_22 = v_u_21
											return
										else
											local v117 = v116.settingTargetId
											local v118 = v116.settingType
											if v117 == nil then
												v_u_22 = v_u_21
											end
											if v118 == "SourceOrTranslation" then
												if v117 == 1 then
													v_u_22 = v_u_20
												else
													v_u_22 = v_u_21
												end
											elseif v118 == "LanguageFamily" then
												if v_u_27[v117] == nil then
													v_u_22 = v_u_21
												else
													v_u_22 = v_u_26[v_u_27[v117]]
												end
											else
												if v118 == "SupportedLocale" then
													if v_u_26[v117] == nil then
														v_u_22 = v_u_21
														return
													end
													v_u_22 = v_u_26[v117]
												end
												return
											end
										end
									end
									v113, v115 = pcall(v119)
								else
									v115 = "User Experience Language Setting Get Request: " .. v114
								end
								if not v113 then
									v_u_10:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v_u_35 .. " with error message: " .. v115)
								end
								v_u_74(v113, v115)
							end)
						else
							v_u_10:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. (v110 == nil and "Execution path did not set earliest error to non-nil value." or v110))
							v_u_43()
						end
					end)
				else
					local v120 = v_u_103
					v_u_10:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. (v120 == nil and "Execution path did not set earliest error to non-nil value." or v120))
					v_u_43()
				end
			end)
		else
			v_u_10:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. (v_u_79 == nil and "Execution path did not set earliest error to non-nil value." or v_u_79))
			v_u_43()
		end
	end)
end