-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Actions.UpdateChatSettings
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux).makeActionCreator
local v_u_3 = require(v1.Packages.t)
local v_u_4 = require(script.Parent.Parent.Helpers.maybeAssert)
return v2(script.Name, function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	v_u_4(v_u_3.table(p5))
	return {
		["settings"] = p5
	}
end)