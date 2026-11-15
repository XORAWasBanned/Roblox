-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.usePreferredInput
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Wrappers.Services).UserInputService
return function() -- name: usePreferredInput
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v5, v_u_6 = v_u_3.useState(v_u_4.PreferredInput)
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_6
		local v_u_7 = v_u_4:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_4
			v_u_6(v_u_4.PreferredInput)
		end)
		v_u_6(v_u_4.PreferredInput)
		return function()
			-- upvalues: (copy) v_u_7
			if v_u_7 then
				v_u_7:Disconnect()
			end
		end
	end, {})
	return v5
end