-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Connect.isConnectUnibarEnabled
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.isConnectDropdownEnabled)
local v_u_3 = require(v1.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v4 = v_u_2()
	if v4 then
		v4 = v_u_3()
	end
	return v4
end