-- Path: CoreGui.RobloxGui.Modules.Common.Hooks.usePlayerCurrentScreenOrientation
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(script.Parent.usePlayerGui)
return function() -- name: usePlayerCurrentScreenOrientation
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v_u_4 = v_u_3()
	local v5, v_u_6 = v_u_2.useState(nil)
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_4, (copy) v_u_6
		local v_u_7
		if v_u_4 then
			v_u_6(v_u_4.CurrentScreenOrientation)
			v_u_7 = v_u_4:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_4
				v_u_6(v_u_4.CurrentScreenOrientation)
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
	end, { v_u_4 })
	return v5
end