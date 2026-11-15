-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.validateMessage
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.t)
local v_u_3 = require(script.Parent.Parent.Constants)
local v_u_4 = require(script.Parent.maybeAssert)
return function(p5) -- name: validateMessageText
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	v_u_4(v_u_2.string(p5))
	if utf8.len(p5) == nil then
		return false
	else
		local v6 = utf8.len(utf8.nfcnormalize(p5))
		if v_u_3.MAX_MESSAGE_LENGTH < v6 then
			return false, v6
		else
			return true
		end
	end
end