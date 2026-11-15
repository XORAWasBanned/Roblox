-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useMappedObservableValueBinding
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
require(v1.Service.ChromeUtils)
return function(p_u_4, p5)
	-- upvalues: (copy) v_u_3
	if not p_u_4 then
		warn("observableValue undefined")
		return v_u_3.useBinding(nil)
	end
	local v_u_7 = p5 or function(p6)
		return p6
	end
	local v8, v_u_9 = v_u_3.useBinding(v_u_7(p_u_4:get()))
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_4, (copy) v_u_9, (ref) v_u_7
		local v_u_10 = p_u_4:connect(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_7, (ref) p_u_4
			v_u_9(v_u_7(p_u_4:get()))
		end)
		v_u_9(v_u_7(p_u_4:get()))
		return function()
			-- upvalues: (copy) v_u_10
			v_u_10:disconnect()
		end
	end, { p_u_4 })
	return v8
end