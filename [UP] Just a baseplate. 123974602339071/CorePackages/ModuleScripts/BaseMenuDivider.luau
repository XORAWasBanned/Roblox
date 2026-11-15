-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.BaseMenuDivider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.View)
local v_u_5 = require(v1.Providers.Style.useTokens)
return function(p6) -- name: BaseMenuDivider
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	local v7 = v_u_5()
	return v_u_3.createElement(v_u_4, {
		["LayoutOrder"] = nil,
		["Size"] = nil,
		["tag"] = "row flex-x-fill",
		["testId"] = "--foundation-menu-divider-item",
		["LayoutOrder"] = p6.LayoutOrder,
		["Size"] = UDim2.new(1, 0, 0, v7.Stroke.Standard)
	}, v_u_3.createElement(v_u_4, {
		["tag"] = "grow size-0-full",
		["backgroundStyle"] = nil,
		["backgroundStyle"] = v7.Color.Stroke.Default
	}))
end