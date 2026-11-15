-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useLayerCollector
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Utility.Wrappers)
local v_u_5 = v4.Signal
local v_u_6 = v4.Connection
local function v_u_8(p7) -- name: findLayerCollector
	if p7 then
		return p7:FindFirstAncestorWhichIsA("LayerCollector")
	else
		return nil
	end
end
return function(p_u_9) -- name: useLayerCollector
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6
	local v10, v_u_11 = v_u_3.useState(nil)
	local v_u_12 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_11, (ref) v_u_8, (copy) p_u_9
		v_u_11(v_u_8(p_u_9))
	end, { p_u_9 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_9, (copy) v_u_12, (ref) v_u_5, (ref) v_u_6
		if not p_u_9 then
			return nil
		end
		v_u_12()
		local v_u_13 = v_u_5.Connect(p_u_9.AncestryChanged, v_u_12)
		return function()
			-- upvalues: (ref) v_u_6, (copy) v_u_13
			v_u_6.Disconnect(v_u_13)
		end
	end, { p_u_9 })
	return v10
end