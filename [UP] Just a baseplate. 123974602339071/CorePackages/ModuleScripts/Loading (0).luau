-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Loading.Loading
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Icon)
local v_u_5 = require(v1.Components.View)
local v6 = require(v1.Enums.IconSize)
require(v1.Components.Types)
local v_u_7 = require(v1.Utility.useRotation)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Utility.withCommonProps)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = {
	["size"] = nil,
	["testId"] = "--foundation-loading",
	["size"] = v6.Large
}
return v_u_3.memo(v_u_3.forwardRef(function(p12, p13) -- name: Loading
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (copy) v_u_5, (copy) v_u_9, (copy) v_u_4
	local v14 = v_u_10(p12, v_u_11)
	local v15 = v_u_7()
	local v16 = v_u_8()
	local v17 = {
		["name"] = "icons/graphic/loadingspinner",
		["size"] = nil,
		["style"] = nil,
		["Rotation"] = nil,
		["ref"] = nil,
		["testId"] = nil,
		["size"] = v14.size,
		["style"] = v16.DarkMode.Content.Emphasis,
		["Rotation"] = v15,
		["ref"] = p13,
		["testId"] = ("%*--icon"):format(v14.testId)
	}
	return v_u_3.createElement(v_u_5, v_u_9(v14, {
		["tag"] = "auto-xy"
	}), {
		["Icon"] = v_u_3.createElement(v_u_4, v17)
	})
end))