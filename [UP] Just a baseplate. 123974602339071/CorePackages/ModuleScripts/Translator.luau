-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Localization.Translator
local v1 = script.Parent
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v2.Utility.Wrappers).Services.LocalizationService
local v4 = require(v1.Constants)
local v_u_5 = require(v2.Generated.Translations.GeneratedTranslations)
local v6 = require(v2.Utility.devAssert)
local v_u_7 = require(v2.Utility.getMainGui)()
v6(v_u_7 ~= nil, "MainGui not found")
local v8 = game:GetService("HttpService")
local v_u_9 = v4.LOCALIZATION_TABLE_NAME .. v8:GenerateGUID(false)
local function v_u_13(p10) -- name: createFoundationLocalizationTable
	-- upvalues: (copy) v_u_9, (copy) v_u_5
	local v11 = p10:FindFirstChild(v_u_9)
	if v11 ~= nil and v11:IsA("LocalizationTable") then
		v11:SetEntries(v_u_5)
		return v11
	end
	local v12 = Instance.new("LocalizationTable")
	v12.Name = v_u_9
	v12.Archivable = false
	v12.SourceLocaleId = "en-us"
	v12:SetEntries(v_u_5)
	v12.Parent = p10
	return v12
end
local v_u_14 = v_u_13(v_u_7)
local v_u_15 = {}
local function v_u_19(p16) -- name: getTranslatorForLocale
	-- upvalues: (ref) v_u_14, (copy) v_u_13, (copy) v_u_7, (ref) v_u_15, (copy) v_u_9
	if v_u_14 == nil or v_u_14.Parent == nil then
		v_u_14 = v_u_13(v_u_7)
		v_u_15 = {}
	end
	local v17 = v_u_15[p16]
	if v17 then
		return v17
	end
	local v18 = v_u_7:FindFirstChild(v_u_9):GetTranslator(p16)
	v_u_15[p16] = v18
	return v18
end
local function v_u_25(p_u_20, p_u_21, p_u_22) -- name: formatByKeyWithFallback
	-- upvalues: (copy) v_u_19
	local v23, v24 = pcall(function()
		-- upvalues: (copy) p_u_22, (copy) p_u_20, (copy) p_u_21
		return p_u_22:FormatByKey(p_u_20, p_u_21)
	end)
	if v23 then
		return v24
	else
		return p_u_22.LocaleId == "zh-cjv" and "" or v_u_19("en-us"):FormatByKey(p_u_20, p_u_21)
	end
end
return {
	["FormatByKey"] = function(_, p26, p27) -- name: FormatByKey
		-- upvalues: (copy) v_u_25, (copy) v_u_19, (copy) v_u_3
		return v_u_25(p26, p27, (v_u_19(v_u_3.RobloxLocaleId)))
	end,
	["FormatByKeyForLocale"] = function(_, p28, p29, p30) -- name: FormatByKeyForLocale
		-- upvalues: (copy) v_u_25, (copy) v_u_19
		return v_u_25(p28, p30, (v_u_19(p29)))
	end
}