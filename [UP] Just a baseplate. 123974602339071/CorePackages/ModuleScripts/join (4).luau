-- Path: CorePackages.Packages._Index.llama.llama.List.join
local v_u_1 = require(script.Parent.Parent.None)
return function(...) -- name: join
	-- upvalues: (copy) v_u_1
	local v2 = {}
	local v3 = 1
	for v4 = 1, select("#", ...) do
		local v5 = select(v4, ...)
		if not v5 then
			continue
		end
		for v6 = 1, #v5 do
			if v5[v6] == v_u_1 then
				continue
			end
			v2[v3] = v5[v6]
			v3 = v3 + 1
		end
	end
	return v2
end