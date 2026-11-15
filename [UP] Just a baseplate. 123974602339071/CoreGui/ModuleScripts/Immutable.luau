-- Path: CoreGui.RobloxGui.Modules.DevConsole.Immutable
return {
	["JoinDictionaries"] = function(...) -- name: JoinDictionaries
		local v1 = {}
		for v2 = 1, select("#", ...) do
			local v3 = select(v2, ...)
			for v4, v5 in pairs(v3) do
				v1[v4] = v5
			end
		end
		return v1
	end,
	["JoinLists"] = function(...) -- name: JoinLists
		local v6 = {}
		for v7 = 1, select("#", ...) do
			local v8 = select(v7, ...)
			local v9 = #v6
			for v10 = 1, #v8 do
				v6[v9 + v10] = v8[v10]
			end
		end
		return v6
	end,
	["Set"] = function(p11, p12, p13) -- name: Set
		local v14 = {}
		for v15, v16 in pairs(p11) do
			v14[v15] = v16
		end
		v14[p12] = p13
		return v14
	end,
	["Append"] = function(p17, ...) -- name: Append
		local v18 = #p17
		local v19 = {}
		for v20 = 1, v18 do
			v19[v20] = p17[v20]
		end
		for v21 = 1, select("#", ...) do
			v19[v18 + v21] = select(v21, ...)
		end
		return v19
	end,
	["RemoveFromDictionary"] = function(p22, ...) -- name: RemoveFromDictionary
		local v23 = {}
		for v24, v25 in pairs(p22) do
			local v26 = false
			for v27 = 1, select("#", ...) do
				if v24 ~= select(v27, ...) then
					continue
				end
				v26 = true
			end
			if v26 then
				break
			end
			v23[v24] = v25
		end
		return v23
	end,
	["RemoveFromList"] = function(p28, p29) -- name: RemoveFromList
		local v30 = {}
		for v31 = 1, #p28 do
			if v31 == p29 then
				continue
			end
			local v32 = p28[v31]
			table.insert(v30, v32)
		end
		return v30
	end,
	["RemoveRangeFromList"] = function(p33, p34, p35) -- name: RemoveRangeFromList
		local v36 = {}
		for v37 = 1, #p33 do
			if v37 >= p34 and p34 + p35 > v37 then
				continue
			end
			local v38 = p33[v37]
			table.insert(v36, v38)
		end
		return v36
	end,
	["RemoveValueFromList"] = function(p39, p40) -- name: RemoveValueFromList
		local v41 = {}
		for v42 = 1, #p39 do
			if p39[v42] == p40 then
				continue
			end
			local v43 = p39[v42]
			table.insert(v41, v43)
		end
		return v41
	end
}