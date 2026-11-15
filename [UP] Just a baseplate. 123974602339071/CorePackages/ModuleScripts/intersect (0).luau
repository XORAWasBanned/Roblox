-- Path: CorePackages.Packages._Index.llama.llama.Set.intersect
return function(...) -- name: intersect
	local v1 = select("#", ...)
	local v2 = select(1, ...)
	local v3 = {}
	for v4, _ in pairs(v2) do
		local v5 = true
		for v6 = 2, v1 do
			if select(v6, ...)[v4] ~= nil then
				continue
			end
			v5 = false
		end
		if not v5 then
			break
		end
		v3[v4] = true
	end
	return v3
end