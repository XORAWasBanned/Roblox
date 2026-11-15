-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.Tokens
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.RbxDesignFoundations)
local v3 = require(v1.Enums.ColorMode)
local v_u_4 = require(script.DeprecatedTokenUtilities)
local v_u_5 = require(v1.Enums.Device)
local v_u_6 = require(v1.Utility.Flags)
local v_u_7 = require(v1.Enums.ThemeName)
local v_u_8 = require(script.TokenProcessingUtilities)
require(v1.Components.Types)
local v_u_9 = require(script.themeGenerators)
local function v_u_15(p10, p11) -- name: applyTokenOverrides
	-- upvalues: (copy) v_u_8
	for v12, v13 in p11 do
		local v14 = v_u_8.resolveTokenOverride(p10, v12, v13)
		if v14 == nil then
			continue
		end
		v_u_8.setTokenValue(p10, v12, v14)
	end
	return p10
end
local function v_u_21(p16, p17, p18) -- name: buildTokens
	-- upvalues: (copy) v_u_15, (copy) v_u_6, (copy) v_u_4
	local v19 = p16(p17)
	local v20 = {
		["Color"] = v19.Color,
		["Config"] = v19.Config,
		["DarkMode"] = v19.DarkMode,
		["Ease"] = v19.Ease,
		["LightMode"] = v19.LightMode,
		["Inverse"] = v19.Inverse,
		["Size"] = v19.Size,
		["Padding"] = v19.Padding,
		["Margin"] = v19.Margin,
		["Gap"] = v19.Gap,
		["Gutter"] = v19.Gutter,
		["Radius"] = v19.Radius,
		["Stroke"] = v19.Stroke,
		["LineHeight"] = v19.LineHeight,
		["FontSize"] = v19.FontSize,
		["FontWeight"] = v19.FontWeight,
		["Time"] = v19.Time,
		["Typography"] = v19.Typography
	}
	if p18 then
		v_u_15(v20, p18)
	end
	if v_u_6.FoundationRemoveDeprecatedSemanticTokens then
		v20.Semantic = nil
		return v20
	else
		v20.Semantic = v_u_4.getDeprecatedSemanticTokens(v20, p17)
		return v20
	end
end
local function v31(p22, p23, p24, p25, p26) -- name: getTokens
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_9, (copy) v_u_7, (copy) v_u_21
	local v27 = p23 or v_u_5.Desktop
	local v28
	if v_u_6.FoundationDisableTokenScaling then
		v28 = 1
	else
		local v29 = p24 == nil and 1 or p24
		local v30 = math.clamp(v29, 0, (1 / 0))
		v28 = (v27 == v_u_5.Console and 1.5 or 1) * v30
	end
	return v_u_21(v_u_9.getGenerator(p26 or v_u_7.Default, p22), v28, p25)
end
local v32 = v3.Dark
local v33 = v_u_5.Desktop
local v34 = nil
local v35
if v_u_6.FoundationDisableTokenScaling then
	v35 = 1
else
	local v36 = v34 == nil and 1 or v34
	local v37 = math.clamp(v36, 0, (1 / 0))
	v35 = (v33 == v_u_5.Console and 1.5 or 1) * v37
end
return {
	["getTokens"] = v31,
	["defaultTokens"] = v_u_21(v_u_9.getGenerator(v_u_7.Default, v32), v35, nil)
}