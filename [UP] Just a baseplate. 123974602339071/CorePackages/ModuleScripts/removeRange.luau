-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.removeRange
return function(p1, p2, p3) -- name: removeRange
	local v4 = p2 <= p3
	assert(v4, "startIndex must be less than or equal to endIndex")
	local v5 = #p1
	local v6 = p2 - 1
	local v7 = {}
	local v8 = 1
	for v9 = 1, math.min(v5, v6) do
		v7[v8] = p1[v9]
		v8 = v8 + 1
	end
	for v10 = p3 + 1, #p1 do
		v7[v8] = p1[v10]
		v8 = v8 + 1
	end
	return v7
end