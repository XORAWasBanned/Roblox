-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Actions.SetMessageText
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.ExpChat)
local v3 = require(v1.Packages.Rodux).makeActionCreator
local v4 = require(v1.Packages.t)
local v_u_5 = require(script.Parent.Parent.Helpers.maybeAssert)
local v_u_6 = v4.tuple(v4.string, v4.string)
return v3(script.Name, function(p7, p8)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_2
	v_u_5(v_u_6(p7, p8))
	v_u_2.Events.LegacyBubbleTextUpdated(p7, p8)
	return {
		["messageId"] = p7,
		["newText"] = p8
	}
end)