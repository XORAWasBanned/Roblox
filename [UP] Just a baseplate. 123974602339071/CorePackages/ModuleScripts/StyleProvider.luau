-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.StyleProvider
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation")
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v5 = require(v2.Enums.ColorMode)
local v6 = require(v2.Enums.Device)
local v_u_7 = require(v1.StyleSheetContext)
local v_u_8 = require(v1.TagsContext)
local v_u_9 = require(v1.TextSizeOffsetContext)
local v10 = require(v2.Enums.ThemeName)
local v11 = require(v1.Tokens)
local v_u_12 = require(v1.TokensContext)
local v_u_13 = require(v1.VariantsContext)
local v_u_14 = require(v2.Utility.getTextSizeOffset)
local v_u_15 = require(v2.Providers.Preferences.usePreferences)
local v_u_16 = require(v2.Utility.withDefaults)
local v_u_17 = v11.getTokens
local v_u_18 = require(v1.useRegistryStyleSheet)
local v_u_19 = {
	["themeName"] = nil,
	["colorMode"] = nil,
	["device"] = nil,
	["scale"] = 1,
	["themeName"] = v10.Default,
	["colorMode"] = v5.Dark,
	["device"] = v6.Desktop
}
return function(p_u_20) -- name: StyleProvider
	-- upvalues: (copy) v_u_16, (copy) v_u_19, (copy) v_u_13, (copy) v_u_4, (copy) v_u_17, (copy) v_u_15, (copy) v_u_14, (copy) v_u_18, (copy) v_u_12, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7
	local v_u_21 = v_u_16({
		["themeName"] = p_u_20.themeName,
		["colorMode"] = p_u_20.colorMode or p_u_20.theme,
		["device"] = p_u_20.device,
		["scale"] = p_u_20.scale
	}, v_u_19)
	local v22 = v_u_13.useVariantsState()
	local v23 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_17, (copy) v_u_21, (copy) p_u_20
		return v_u_17(v_u_21.colorMode, v_u_21.device, v_u_21.scale, p_u_20.tokenOverrides, v_u_21.themeName)
	end, {
		v_u_21.colorMode,
		v_u_21.device,
		v_u_21.scale,
		p_u_20.tokenOverrides,
		v_u_21.themeName
	})
	local v24 = { v_u_15().preferredTextSize }
	local v25 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_14
		return v_u_14() or 0
	end, v24)
	local v26, v27 = v_u_18(v_u_21.themeName, v_u_21.colorMode, v_u_21.device, v_u_21.scale, p_u_20.tokenOverrides)
	local v28 = v_u_4.createElement
	local v29 = v_u_12.Provider
	local v30 = {
		["TextSizeOffsetContext"] = v_u_4.createElement(v_u_9.Provider, {
			["value"] = v25
		}, {
			["VariantsContext"] = v_u_4.createElement(v_u_13.Provider, {
				["value"] = v22
			}, {
				["TagsContext"] = v_u_4.createElement(v_u_8.Provider, {
					["value"] = v27
				}, v_u_4.createElement(v_u_7.Provider, {
					["value"] = v26
				}, p_u_20.children)),
				["StyleSheet"] = v_u_4.createElement("StyleLink", {
					["StyleSheet"] = v26
				})
			})
		})
	}
	return v28(v29, {
		["value"] = v23
	}, v30)
end