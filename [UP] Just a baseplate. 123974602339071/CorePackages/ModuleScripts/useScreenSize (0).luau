-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useScreenSize
local v1 = script:FindFirstAncestor("MomentsCommon").Parent
local v_u_2 = require(v1.React)
return function()
	-- upvalues: (copy) v_u_2
	local v3, v_u_4 = v_u_2.useState(Vector2.new((1 / 0), (1 / 0)))
	local v_u_5, v_u_6 = v_u_2.useState(workspace.CurrentCamera)
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
		local v_u_7 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: (ref) v_u_6
			v_u_6(workspace.CurrentCamera)
		end)
		if v_u_5 then
			v_u_4(v_u_5.ViewportSize)
		end
		return function()
			-- upvalues: (copy) v_u_7
			v_u_7:Disconnect()
		end
	end, {})
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_5, (copy) v_u_4
		if v_u_5 then
			local v_u_8 = v_u_5:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_4
				if v_u_5 then
					v_u_4(v_u_5.ViewportSize)
				end
			end)
			return function()
				-- upvalues: (copy) v_u_8
				v_u_8:Disconnect()
			end
		end
	end, { v_u_5 })
	return v3
end