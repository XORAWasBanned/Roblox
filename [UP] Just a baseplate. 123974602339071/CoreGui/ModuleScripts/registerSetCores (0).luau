-- Path: CoreGui.RobloxGui.Modules.TopBar.registerSetCores
local v_u_1 = game:GetService("StarterGui")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores
local v4 = script.Parent
local v_u_5 = require(v4.Actions.SetTopBarEnabled)
local function v8(p_u_6) -- name: registerSetCores
	-- upvalues: (copy) v_u_1, (copy) v_u_5
	v_u_1:RegisterSetCore("TopbarEnabled", function(p7)
		-- upvalues: (copy) p_u_6, (ref) v_u_5
		if type(p7) == "boolean" then
			p_u_6:dispatch(v_u_5(p7))
		else
			error("SetCore TopbarEnabled argument must be a boolean", 2)
		end
	end)
	v_u_1:RegisterGetCore("TopbarEnabled", function()
		-- upvalues: (copy) p_u_6
		return p_u_6:getState().displayOptions.topbarEnabled
	end)
end
if v3 then
	return nil
else
	return v8
end