-- Path: CorePackages.Packages._Index.llama.llama.List.splice
return function(p1, p2, p3, ...) -- name: splice
	local v4 = type(p1)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = type(p2)
	local v8
	if v7 == "number" then
		v8 = p2 % 1 == 0
	else
		v8 = false
	end
	local v9 = "expected an integer for second argument, got " .. v7
	assert(v8, v9)
	local v10 = type(p3)
	local v11
	if v10 == "number" then
		v11 = p3 % 1 == 0
	else
		v11 = false
	end
	local v12 = "expected an integer for third argument, got " .. v10
	assert(v11, v12)
	local v13 = p2 <= p3
	assert(v13, "start index must be less than or equal to end index")
	local v14 = #p1
	local v15 = math.max(p2, 1)
	local _ = math.min(v15, v14)
	local v16 = {}
	local v17 = 1
	for v18 = 1, v14 do
		if v18 == v15 then
			for v19 = 1, select("#", ...) do
				v16[v17] = select(v19, ...)
				v17 = v17 + 1
			end
		else
			v16[v17] = p1[v18]
			v17 = v17 + 1
		end
	end
	return v16
end