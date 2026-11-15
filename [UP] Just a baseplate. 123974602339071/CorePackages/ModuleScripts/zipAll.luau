-- Path: CorePackages.Packages._Index.llama.llama.List.zipAll
local v_u_1 = require(script.Parent.Parent.None)
return function(...) -- name: zipAll
	-- upvalues: (copy) v_u_1
	local v2 = select("#", ...)
	local v3 = #select(1, ...)
	local v4 = {}
	for v5 = 2, v2 do
		local v6 = #select(v5, ...)
		if v3 >= v6 then
			continue
		end
		v3 = v6
	end
	for v7 = 1, v3 do
		v4[v7] = {}
		for v8 = 1, v2 do
			if select(v8, ...)[v7] == nil then
				v4[v7][v8] = v_u_1
			else
				v4[v7][v8] = select(v8, ...)[v7]
			end
		end
	end
	return v4
end