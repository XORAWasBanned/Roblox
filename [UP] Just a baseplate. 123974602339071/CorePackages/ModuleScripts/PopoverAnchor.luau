-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.Anchor.PopoverAnchor
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(script.Parent.Parent.PopoverContext)
local v_u_4 = require(v1.Utility.Plugin.StudioUri)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Utility.withCommonProps)
local v_u_7 = require(v2.React)
return v_u_7.forwardRef(function(p_u_8, p9) -- name: PopoverAnchor
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v_u_10 = v_u_7.useContext(v_u_3)
	local v_u_11 = v_u_7.useRef(nil)
	v_u_7.useImperativeHandle(p9, function()
		-- upvalues: (copy) v_u_11
		return v_u_11.current
	end, {})
	v_u_7.useLayoutEffect(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_8, (copy) v_u_10, (copy) v_u_11
		if v_u_4.isStudioUri(p_u_8.anchorRef) then
			v_u_10.setAnchorUri(p_u_8.anchorRef)
			return
		else
			local v12 = p_u_8.anchorRef
			if typeof(v12) == "table" and p_u_8.anchorRef.current then
				v_u_10.setAnchor(p_u_8.anchorRef.current)
			else
				v_u_10.setAnchor(v_u_11.current)
			end
		end
	end)
	if p_u_8.anchorRef then
		return nil
	end
	p_u_8.testId = ("%*--anchor"):format(v_u_10.testId)
	return v_u_7.createElement(v_u_5, v_u_6(p_u_8, {
		["tag"] = "auto-xy",
		["ref"] = nil,
		["ref"] = v_u_11
	}), p_u_8.children)
end)