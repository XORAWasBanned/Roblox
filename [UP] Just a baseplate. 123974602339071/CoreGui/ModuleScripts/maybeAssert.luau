-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.maybeAssert
local v_u_1 = require(script.Parent.Parent.GlobalConfig)
return function(...) -- name: maybeAssert
	-- upvalues: (copy) v_u_1
	if v_u_1.actionValidation then
		return assert(...)
	end
end