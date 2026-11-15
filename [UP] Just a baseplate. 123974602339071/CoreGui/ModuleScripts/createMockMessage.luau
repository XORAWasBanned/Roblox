-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.createMockMessage
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = 0
return function(p4) -- name: createMockMessage
	-- upvalues: (ref) v_u_3, (copy) v_u_2
	v_u_3 = v_u_3 + 1
	local v5 = v_u_2.Dictionary.join
	local v6 = {
		["name"] = "Foo",
		["id"] = nil,
		["userId"] = "1",
		["text"] = "Hello, World!",
		["timestamp"] = nil
	}
	local v7 = v_u_3
	v6.id = tostring(v7)
	v6.timestamp = v_u_3
	return v5(v6, p4)
end