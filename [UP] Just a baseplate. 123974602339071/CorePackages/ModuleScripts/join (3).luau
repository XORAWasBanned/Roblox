-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.join
local v_u_1 = require(script.Parent.Parent.None)
return function(...) -- name: join
	-- upvalues: (copy) v_u_1
	local v2 = {}
	for v3 = 1, select("#", ...) do
		local v4 = select(v3, ...)
		if not v4 then
			continue
		end
		for v5, v6 in pairs(v4) do
			if v6 == v_u_1 then
				v2[v5] = nil
			else
				v2[v5] = v6
			end
		end
	end
	return v2
end