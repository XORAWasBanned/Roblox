-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.getSettingsForMessage
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.t)
local v_u_3 = require(script.Parent.Parent.Types)
local v_u_4 = require(script.Parent.maybeAssert)
local _ = script.Parent.Parent.Parent.Parent.Flags
return function(p5, p6) -- name: getSettingsForMessage
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	v_u_4(v_u_3.IChatSettings(p5))
	v_u_4(v_u_2.optional(v_u_3.IMessage)(p6))
	local v7 = p5.UserSpecificSettings
	if not (v7 and p6) then
		return p5
	end
	local v8 = v7[p6.userId]
	if not v8 and p6.adornee then
		v8 = v7[p6.adornee:GetFullName()]
	end
	return v8 or p5
end