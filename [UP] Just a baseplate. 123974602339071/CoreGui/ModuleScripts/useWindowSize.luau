-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useWindowSize
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
require(v1.Workspace.Packages.Chrome)
return function(p3)
	-- upvalues: (copy) v_u_2
	if not (p3 and p3.windowSize) then
		warn("windowSize object not found")
		return UDim2.new()
	end
	local v_u_4 = p3.windowSize
	local v_u_5, v_u_6 = v_u_2.useState(v_u_4:get())
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
		local v_u_7 = v_u_4:connect(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_4
			v_u_6(v_u_4:get())
		end)
		if v_u_5 ~= v_u_4:get() then
			v_u_6(v_u_4:get())
		end
		return function()
			-- upvalues: (copy) v_u_7
			v_u_7:disconnect()
		end
	end, { p3.id })
	return v_u_5
end