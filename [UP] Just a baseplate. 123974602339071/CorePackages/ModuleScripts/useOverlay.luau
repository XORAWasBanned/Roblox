-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Overlay.useOverlay
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.OverlayContext)
return function() -- name: useOverlay
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_4 = v_u_2.useContext(v_u_3)
	v_u_2.useLayoutEffect(function()
		-- upvalues: (copy) v_u_4
		v_u_4.requestOverlay()
	end, { v_u_4.requestOverlay })
	return v_u_4.instance
end