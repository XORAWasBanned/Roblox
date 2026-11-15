-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.StyleSheet
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation")
local v3 = v2.Parent
local v_u_4 = require(v3.React)
require(v2.Providers.Style.Tokens)
require(v1.Rules.Types)
local v_u_5 = require(v1.createStyleSheetRules)
local v_u_6 = require(v1.getOverrideAttributes)
local v_u_7 = require(v2.Utility.useGeneratedRules)
require(v2.Enums.ColorMode)
require(v2.Enums.Device)
require(v2.Enums.ThemeName)
return v_u_4.memo(function(p_u_8) -- name: StyleSheet
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
	local v_u_9, v10 = v_u_4.useState(nil)
	local v_u_11 = v_u_4.useRef({})
	v_u_4.useLayoutEffect(function()
		-- upvalues: (copy) p_u_8, (copy) v_u_9
		if p_u_8.setStyleSheetRef and p_u_8.setStyleSheetRef.current then
			p_u_8.setStyleSheetRef.current(v_u_9)
		end
	end, { v_u_9 })
	local v_u_12 = v_u_7(p_u_8.themeName, p_u_8.colorMode, p_u_8.device)
	local v_u_13 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_6, (copy) p_u_8
		return v_u_6(p_u_8.themeName, p_u_8.colorMode, p_u_8.device, p_u_8.tokenOverrides)
	end, {
		p_u_8.themeName,
		p_u_8.colorMode,
		p_u_8.device,
		p_u_8.tokenOverrides
	})
	local v14 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_9, (ref) v_u_5, (copy) v_u_12, (copy) p_u_8, (copy) v_u_11, (copy) v_u_13
		if v_u_9 then
			return v_u_5(v_u_12, p_u_8.tags, v_u_9, v_u_11.current, p_u_8.scale, v_u_13)
		else
			return nil
		end
	end, {
		v_u_9,
		v_u_12,
		p_u_8.tags,
		p_u_8.scale,
		v_u_13
	})
	local v15 = v_u_4.createElement
	local v16 = v_u_4.Fragment
	local v17 = {
		["FoundationStyleSheet"] = v_u_4.createElement("StyleSheet", {
			["ref"] = v10
		}, v14),
		["FoundationStyleLink"] = v_u_4.createElement("StyleLink", {
			["StyleSheet"] = v_u_9
		})
	}
	return v15(v16, nil, v17)
end)