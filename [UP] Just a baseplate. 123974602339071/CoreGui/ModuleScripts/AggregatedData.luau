-- Path: CoreGui.RobloxGui.Modules.AggregatedData
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new() -- name: new
	-- upvalues: (copy) v_u_1
	local v2 = {}
	local v3 = v_u_1
	setmetatable(v2, v3)
	return v2
end
function v_u_1.addPlay(p4, p5, p6, p7) -- name: addPlay
	if p5:find("rbxassetid://") then
		local v8 = p5:sub(14)
		if p4[v8] == nil then
			p4[v8] = {
				["playtime"] = p6,
				["loopcount"] = p7
			}
		else
			local v9 = p4[v8]
			v9.playtime = v9.playtime + p6
			local v10 = p4[v8]
			v10.loopcount = v10.loopcount + p7
		end
	else
		return
	end
end
return v_u_1