-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Utils.Immutable
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
		local v14 = table.clone(p11)
		v14[p12] = p13
		return v14
	end,
	["Append"] = function(p15, ...) -- name: Append
		local v16 = #p15
		local v17 = {}
		for v18 = 1, v16 do
			v17[v18] = p15[v18]
		end
		for v19 = 1, select("#", ...) do
			v17[v16 + v19] = select(v19, ...)
		end
		return v17
	end,
	["RemoveFromDictionary"] = function(p20, ...) -- name: RemoveFromDictionary
		local v21 = {}
		for v22, v23 in pairs(p20) do
			local v24 = false
			for v25 = 1, select("#", ...) do
				if v22 ~= select(v25, ...) then
					continue
				end
				v24 = true
			end
			if v24 then
				break
			end
			v21[v22] = v23
		end
		return v21
	end,
	["RemoveFromList"] = function(p26, p27) -- name: RemoveFromList
		local v28 = {}
		for v29 = 1, #p26 do
			if v29 == p27 then
				continue
			end
			local v30 = p26[v29]
			table.insert(v28, v30)
		end
		return v28
	end,
	["RemoveRangeFromList"] = function(p31, p32, p33) -- name: RemoveRangeFromList
		local v34 = {}
		for v35 = 1, #p31 do
			if v35 >= p32 and p32 + p33 > v35 then
				continue
			end
			local v36 = p31[v35]
			table.insert(v34, v36)
		end
		return v34
	end,
	["RemoveValueFromList"] = function(p37, p38) -- name: RemoveValueFromList
		local v39 = {}
		for v40 = 1, #p37 do
			if p37[v40] == p38 then
				continue
			end
			local v41 = p37[v40]
			table.insert(v39, v41)
		end
		return v39
	end
}