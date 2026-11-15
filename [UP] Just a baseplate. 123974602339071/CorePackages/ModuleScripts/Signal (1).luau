-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Utils.Signal
local v1 = script:FindFirstAncestor("MomentsCommon")
local v_u_2 = require(v1.Utils.Immutable)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new() -- name: new
	-- upvalues: (copy) v_u_3
	local v4 = {
		["_listeners"] = {}
	}
	local v5 = v_u_3
	setmetatable(v4, v5)
	return v4
end
function v_u_3.connect(p_u_6, p7) -- name: connect
	-- upvalues: (copy) v_u_2
	local v_u_8 = {
		["callback"] = nil,
		["isConnected"] = true,
		["callback"] = p7
	}
	p_u_6._listeners = v_u_2.Append(p_u_6._listeners, v_u_8)
	return {
		["disconnect"] = function() -- name: disconnect
			-- upvalues: (copy) v_u_8, (copy) p_u_6, (ref) v_u_2
			v_u_8.isConnected = false
			p_u_6._listeners = v_u_2.RemoveValueFromList(p_u_6._listeners, v_u_8)
		end
	}
end
function v_u_3.fire(p9, ...) -- name: fire
	for _, v10 in ipairs(p9._listeners) do
		if not v10.isConnected then
			continue
		end
		v10.callback(...)
	end
end
return v_u_3