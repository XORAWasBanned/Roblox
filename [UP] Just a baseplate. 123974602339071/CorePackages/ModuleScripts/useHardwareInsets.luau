-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.useHardwareInsets
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.getHardwareSafeAreaInsets)
return function(p_u_4) -- name: useHardwareInsets
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5, v_u_6 = v_u_2.useState(v_u_3)
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_4, (copy) v_u_6, (ref) v_u_3
		local v_u_7
		if p_u_4 then
			v_u_7 = p_u_4:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_3
				v_u_6(function(p8)
					-- upvalues: (ref) v_u_3
					local v9 = v_u_3()
					if v9.bottom == p8.bottom and (v9.top == p8.top and (v9.left == p8.left and v9.right == p8.right)) then
						return p8
					else
						return v9
					end
				end)
			end)
		else
			v_u_7 = nil
		end
		return function()
			-- upvalues: (ref) v_u_7
			if v_u_7 then
				v_u_7:Disconnect()
			end
		end
	end, { p_u_4 })
	return v5
end