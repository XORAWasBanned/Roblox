-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getMainGui
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Utility.Wrappers)
local v_u_3 = v2.Services.CoreGui
local v_u_4 = v2.Services.RunService
local v_u_5 = v2.Services.Players
local v_u_6 = require(v1.Utility.isPluginSecurity)
local v_u_7 = nil
return function() -- name: getMainGui
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5
	if v_u_6() then
		return v_u_3
	end
	if v_u_7 == nil then
		local v8
		if v_u_4:IsClient() and (v_u_5.LocalPlayer and v_u_4:IsRunning()) then
			v8 = v_u_5.LocalPlayer:WaitForChild("PlayerGui", 3)
		else
			v8 = nil
		end
		v_u_7 = v8
	end
	return v_u_7
end