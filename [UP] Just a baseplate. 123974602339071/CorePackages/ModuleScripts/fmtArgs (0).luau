-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.fmtArgs
return function(p1)
	local v2 = {}
	for v3 = 1, p1.n do
		local v4 = p1[v3]
		if type(v4) == "string" then
			local v5 = "\"" .. p1[v3] .. "\""
			table.insert(v2, v5)
		else
			local v6 = p1[v3]
			local v7 = tostring(v6)
			table.insert(v2, v7)
		end
	end
	return "{" .. table.concat(v2, ", ") .. "}"
end