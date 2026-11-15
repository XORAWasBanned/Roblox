-- Path: CoreGui.RobloxGui.Modules.PlayerList.createShallowEqualAndTables
return function(p1) -- name: createShallowEqualAndTables
	local v_u_2 = {}
	for _, v3 in p1 do
		v_u_2[v3] = true
	end
	return function(p4, p5)
		-- upvalues: (copy) v_u_2
		for v6, v7 in p4 do
			local v8 = p5[v6]
			if not v_u_2[v6] then
				if v7 == v8 then
					continue
				end
				return false
			end
			if typeof(v7) ~= "table" or typeof(v8) ~= "table" then
				return false
			end
			for v9, v10 in v7 do
				if v10 == v8[v9] then
					continue
				end
				return false
			end
			for v11, _ in v8 do
				if v7[v11] ~= nil then
					continue
				end
				return false
			end
		end
		for v12, _ in p5 do
			if p4[v12] ~= nil then
				continue
			end
			return false
		end
		return true
	end
end