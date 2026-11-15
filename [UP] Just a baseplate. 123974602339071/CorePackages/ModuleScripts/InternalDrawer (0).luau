-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalDrawer.InternalDrawer
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.ScrollBarVisibility)
local v_u_5 = require(v1.Utility.withDefaults)
local v_u_6 = require(script.Parent.InternalDrawerOverlay)
require(script.Parent.Types)
local v_u_7 = {
	["scrollBarVisibility"] = nil,
	["testId"] = "--foundation-internal-drawer",
	["scrollBarVisibility"] = v4.None
}
return v_u_3.memo(v_u_3.forwardRef(function(p8, p9) -- name: InternalDrawer
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6
	local v10 = v_u_5(p8, v_u_7)
	local v11, v_u_12 = v_u_3.useState(v10.isOpen)
	if v10.isOpen and not v11 then
		v_u_12(true)
	end
	local v_u_13 = v10.onCloseComplete
	local v14 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_12, (copy) v_u_13
		v_u_12(false)
		if v_u_13 then
			v_u_13()
		end
	end, { v_u_13 })
	if not v11 then
		return nil
	end
	v10.ref = p9
	v10.onExited = v14
	return v_u_3.createElement(v_u_6, v10)
end))