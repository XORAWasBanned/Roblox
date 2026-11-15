-- Path: CoreGui.RobloxGui.Modules.Common.Hooks.useScreenSize
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
return function()
	-- upvalues: (copy) v_u_2
	local v_u_3 = nil
	local v_u_4 = nil
	local v5, v_u_6 = v_u_2.useState(Vector2.new(0, 0))
	local function v_u_8()
		-- upvalues: (copy) v_u_6
		local v7 = workspace.CurrentCamera
		if v7 then
			v_u_6(Vector2.new(v7.ViewportSize.X, v7.ViewportSize.Y))
		end
	end
	local function v_u_11()
		-- upvalues: (ref) v_u_4, (copy) v_u_8
		local v9 = workspace.CurrentCamera
		if v_u_4 then
			local function v10()
				-- upvalues: (ref) v_u_4
				v_u_4:Disconnect()
			end
			pcall(v10)
			v_u_4 = nil
		end
		if v9 then
			v_u_4 = v9:GetPropertyChangedSignal("ViewportSize"):Connect(v_u_8)
		end
	end
	v_u_2.useEffect(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_11, (copy) v_u_6, (ref) v_u_4
		v_u_3 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v_u_11)
		v_u_11()
		local v12 = workspace.CurrentCamera
		if v12 then
			v_u_6(Vector2.new(v12.ViewportSize.X, v12.ViewportSize.Y))
		end
		return function()
			-- upvalues: (ref) v_u_3, (ref) v_u_4
			if v_u_3 then
				v_u_3:Disconnect()
			end
			if v_u_4 then
				v_u_4:Disconnect()
			end
		end
	end, {})
	return v5
end