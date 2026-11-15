-- Path: CoreGui.RobloxGui.Modules.isNewTiltIconEnabled
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v2.Modules.isNewInGameMenuEnabled)
local v_u_4 = require(v1.Workspace.Packages.Chrome).Enabled
return function()
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v5 = v_u_4()
	if v5 then
		v5 = not v_u_3()
	end
	return v5
end