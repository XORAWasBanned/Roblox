-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Mocks.MockAppStorageService
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2) -- name: new
	-- upvalues: (copy) v_u_1
	local v3 = {
		["_privateValues"] = table.clone(p2)
	}
	local v4 = v_u_1
	return setmetatable(v3, v4)
end
function v_u_1.GetItem(p5, p6) -- name: GetItem
	return p5._privateValues[p6]
end
function v_u_1.SetItem(p7, p8, p9) -- name: SetItem
	p7._privateValues[p8] = p9
end
function v_u_1.Flush(_) -- name: Flush end
function v_u_1._DeepEquals(p10, p11) -- name: _DeepEquals
	for v12, v13 in p11 do
		if p10._privateValues[v12] == v13 then
			continue
		end
		return false
	end
	return true
end
return v_u_1