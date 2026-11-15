-- Path: CoreGui.RobloxGui.Modules.DevConsole.Signal
local v_u_1 = require(script.Parent.Immutable)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new() -- name: new
	-- upvalues: (copy) v_u_2
	local v3 = {
		["_listeners"] = {}
	}
	local v4 = v_u_2
	setmetatable(v3, v4)
	return v3
end
function v_u_2.Connect(p_u_5, p6) -- name: Connect
	-- upvalues: (copy) v_u_1
	local v_u_7 = {
		["callback"] = nil,
		["isConnected"] = true,
		["callback"] = p6
	}
	p_u_5._listeners = v_u_1.Append(p_u_5._listeners, v_u_7)
	return {
		["Disconnect"] = function() -- name: disconnect
			-- upvalues: (copy) v_u_7, (copy) p_u_5, (ref) v_u_1
			v_u_7.isConnected = false
			p_u_5._listeners = v_u_1.RemoveValueFromList(p_u_5._listeners, v_u_7)
		end
	}
end
function v_u_2.Fire(p8, ...) -- name: Fire
	for _, v9 in ipairs(p8._listeners) do
		if not v9.isConnected then
			continue
		end
		v9.callback(...)
	end
end
return v_u_2