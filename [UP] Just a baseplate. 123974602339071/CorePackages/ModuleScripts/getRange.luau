-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.getRange
return function(p1, p2, p3) -- name: getRange
	local v4 = p2 <= p3
	assert(v4, "startIndex must be less than or equal to endIndex")
	local v5 = math.max(1, p2)
	local v6 = #p1
	local v7 = {}
	local v8 = 1
	for v9 = v5, math.min(v6, p3) do
		v7[v8] = p1[v9]
		v8 = v8 + 1
	end
	return v7
end