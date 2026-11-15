-- Path: CoreGui.RobloxGui.Modules.TestHelpers.MockAppStorageService
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2) -- name: new
	-- upvalues: (copy) v_u_1
	local v3 = p2 or {}
	local v4 = {
		["__index"] = v_u_1
	}
	setmetatable(v3, v4)
	return v3
end
function v_u_1.GetItem(p5, p6) -- name: GetItem
	return p5[p6]
end
function v_u_1.SetItem(p7, p8, p9) -- name: SetItem
	p7[p8] = tostring(p9)
end
function v_u_1.flush(_) -- name: flush end
return v_u_1