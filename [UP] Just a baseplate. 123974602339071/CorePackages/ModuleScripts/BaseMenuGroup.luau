-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.BaseMenuGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.BaseMenuContext)
local v_u_5 = require(script.Parent.BaseMenuDivider)
local v_u_6 = require(script.Parent.BaseMenuTitleItem)
local v_u_7 = require(v1.Components.View)
local v_u_8 = {
	["XSmall"] = "padding-xsmall",
	["Small"] = "padding-small",
	["Medium"] = "padding-small",
	["Large"] = "padding-small"
}
return function(p9) -- name: BaseMenuGroup
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6
	local v10 = v_u_3.useContext(v_u_4)
	local v11 = p9.LayoutOrder
	local v12 = v_u_3.createElement
	local v13 = v_u_3.Fragment
	local v14 = nil
	local v15 = {}
	local v16
	if v11 == 1 then
		v16 = nil
	else
		v16 = v_u_3.createElement(v_u_5, {
			["LayoutOrder"] = v11 * 2 - 1
		})
	end
	v15.Divider = v16
	local v17 = v_u_3.createElement
	local v18 = v_u_7
	local v19 = {
		["LayoutOrder"] = v11 * 2,
		["tag"] = ("col gap-xxsmall size-full-0 auto-y %*"):format(v_u_8[v10.size])
	}
	local v20 = {}
	local v21
	if p9.title then
		v21 = v_u_3.createElement(v_u_6, {
			["text"] = p9.title,
			["size"] = v10.size,
			["menuHasLeading"] = p9.menuHasLeading,
			["menuHasCheck"] = p9.menuHasCheck
		})
	else
		v21 = nil
	end
	v20.Title = v21
	v20.Items = v_u_3.createElement(v_u_3.Fragment, nil, p9.children)
	v15.Group = v17(v18, v19, v20)
	return v12(v13, v14, v15)
end