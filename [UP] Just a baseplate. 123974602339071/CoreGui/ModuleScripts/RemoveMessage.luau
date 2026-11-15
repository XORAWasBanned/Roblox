-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Actions.RemoveMessage
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux).makeActionCreator
local v_u_3 = require(script.Parent.Parent.Helpers.maybeAssert)
local v_u_4 = require(script.Parent.Parent.Types)
return v2(script.Name, function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	v_u_3(v_u_4.IMessage(p5))
	return {
		["message"] = p5
	}
end)