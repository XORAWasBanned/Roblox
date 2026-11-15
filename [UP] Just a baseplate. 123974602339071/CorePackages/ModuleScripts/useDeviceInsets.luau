-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useDeviceInsets
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utils.HardwareSafeAreaInsets)
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v_u_5, v_u_6 = v_u_3.useState(v_u_4.deviceInsets())
	v_u_3.useLayoutEffect(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_6, (copy) v_u_5
		local v_u_7 = v_u_4:connect(v_u_6)
		if v_u_4.diffInsets(v_u_5, v_u_4.deviceInsets()) then
			v_u_6(v_u_4.deviceInsets)
		end
		return function()
			-- upvalues: (copy) v_u_7
			v_u_7.disconnect()
		end
	end, {})
	return v_u_5
end