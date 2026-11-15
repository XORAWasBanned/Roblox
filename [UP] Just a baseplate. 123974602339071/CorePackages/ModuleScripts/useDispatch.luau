-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useDispatch
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Hooks.useStore)
return function() -- name: useDispatch
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v_u_5 = v_u_4()
	return v_u_3.useCallback(function(...)
		-- upvalues: (copy) v_u_5
		return v_u_5:dispatch(...)
	end, { v_u_5 })
end