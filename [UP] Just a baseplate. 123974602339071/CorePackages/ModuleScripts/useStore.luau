-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useStore
local v1 = script:FindFirstAncestor("MomentsCommon").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(v1.RoactRodux).StoreContext
return function() -- name: useStore
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v4 = v_u_2.useContext(v_u_3)
	assert(v4, "useDispatch and useSelector can only be called from a descendant of the Rodux Store Provider")
	return v4
end