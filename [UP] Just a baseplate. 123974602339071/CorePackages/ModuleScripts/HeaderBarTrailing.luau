-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.HeaderBar.Trailing.HeaderBarTrailing
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.HeaderBar.HeaderBarContext)
local v_u_5 = require(v1.Enums.HeaderBarSlot)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Components.HeaderBar.constants)
local v_u_8 = require(v1.Components.HeaderBar.useHeaderBarContext)
return function(p9) -- name: HeaderBarTrailing
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v10 = v_u_8()
	return v_u_3.createElement(v_u_4.Provider, {
		["testId"] = v10.testId,
		["slot"] = v_u_5.Trailing
	}, v_u_3.createElement(v_u_6, {
		["tag"] = "row align-x-right align-y-center shrink gap-small size-full",
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["LayoutOrder"] = v_u_7.TRAILING_LAYOUT_ORDER,
		["testId"] = ("%*--trailing"):format(v10.testId)
	}, p9.children))
end