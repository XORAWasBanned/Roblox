-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioWidgets.useWidgetRef
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.React)
local v_u_4 = v3.useEffect
local v_u_5 = v3.useRef
local v_u_6 = require(v1.Utility.Plugin.StudioUri)
local v_u_7 = require(script.Parent.useWidgetsContext)
return function(p_u_8, p9) -- name: useWidgetRef
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4
	local v_u_10 = v_u_7()
	local v_u_11 = p9 or v_u_5(nil)
	v_u_4(function()
		-- upvalues: (copy) v_u_11, (copy) p_u_8, (copy) v_u_10
		local v_u_12 = v_u_11.current
		if v_u_12 then
			if not p_u_8 or typeof(v_u_12) ~= "Instance" then
				return nil
			end
			v_u_10.register(p_u_8, v_u_12)
			return function()
				-- upvalues: (ref) v_u_10, (ref) p_u_8, (copy) v_u_12
				v_u_10.deregister(p_u_8, v_u_12)
			end
		end
	end, {
		v_u_6.toString(p_u_8),
		v_u_11.current,
		p_u_8,
		v_u_10.register,
		v_u_10.deregister
	})
	return v_u_11
end