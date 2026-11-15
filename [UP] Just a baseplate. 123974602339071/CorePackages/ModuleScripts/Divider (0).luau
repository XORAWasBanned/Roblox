-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Divider.Divider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Enums.DividerVariant)
local v_u_5 = require(v1.Enums.Orientation)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(script.Parent.useDividerVariants)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Utility.withCommonProps)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = {
	["variant"] = nil,
	["orientation"] = nil,
	["testId"] = "--foundation-divider",
	["variant"] = v_u_4.Default,
	["orientation"] = v_u_5.Horizontal
}
return v_u_3.memo(v_u_3.forwardRef(function(p12, p13) -- name: Divider
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_9
	local v14 = v_u_10(p12, v_u_11)
	local v15 = v_u_7(v_u_8(), v14.variant, v14.orientation)
	local v16
	if v14.variant == v_u_4.Heavy then
		v16 = v14.orientation ~= v_u_5.Vertical
	else
		v16 = false
	end
	local v17 = v_u_3.createElement
	local v18 = v_u_6
	local v19 = v_u_9(v14, {
		["tag"] = v15.container.tag,
		["ref"] = p13
	})
	local v20 = {
		["DividerStroke"] = v_u_3.createElement(v_u_6, {
			["Size"] = v15.stroke.Size,
			["backgroundStyle"] = v15.stroke.backgroundStyle
		})
	}
	local v21
	if v16 then
		v21 = v_u_3.createElement(v_u_6, {
			["tag"] = v15.line.tag,
			["Position"] = v15.line.position,
			["backgroundStyle"] = v15.line.backgroundStyle
		})
	else
		v21 = nil
	end
	v20.DividerLine = v21
	return v17(v18, v19, v20)
end))