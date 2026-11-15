-- Path: CorePackages.Packages._Index.llama.llama.List.zip
return function(...) -- name: zip
	local v1 = select("#", ...)
	local v2 = #select(1, ...)
	local v3 = {}
	for v4 = 2, v1 do
		local v5 = #select(v4, ...)
		if v5 >= v2 then
			continue
		end
		v2 = v5
	end
	for v6 = 1, v2 do
		v3[v6] = {}
		for v7 = 1, v1 do
			v3[v6][v7] = select(v7, ...)[v6]
		end
	end
	return v3
end