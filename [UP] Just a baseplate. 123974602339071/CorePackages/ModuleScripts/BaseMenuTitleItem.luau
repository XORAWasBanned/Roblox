-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.BaseMenuTitleItem
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v_u_7 = require(v1.Utility.withCommonProps)
require(v1.Enums.ControlState)
require(v1.Enums.InputSize)
local v_u_8 = require(script.Parent.useBaseMenuItemVariants)
return v_u_3.memo(v_u_3.forwardRef(function(p9, p10) -- name: BaseMenuTitleItem
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4
	local v11 = v_u_8(v_u_6(), p9.size, false)
	local v12
	if p9.menuHasCheck == true then
		v12 = (v11.container.paddingLeftWithCheck or 0) + (v11.title.checkColumnWidth or 0)
	else
		v12 = v11.container.paddingLeftWithoutCheck or 0
	end
	local v13 = v11.container.paddingRight or 0
	return v_u_3.createElement(v_u_5, v_u_7(p9, {
		["tag"] = ("row align-y-center %*"):format(v11.container.tag),
		["padding"] = {
			["left"] = UDim.new(0, v12),
			["right"] = UDim.new(0, v13)
		},
		["ref"] = p10
	}), v_u_3.createElement(v_u_4, {
		["Text"] = p9.text,
		["tag"] = v11.title.tag
	}))
end))