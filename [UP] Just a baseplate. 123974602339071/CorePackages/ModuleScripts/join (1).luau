-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.join
local v_u_1 = require(script.Parent.Parent.None)
return function(...) -- name: join
	-- upvalues: (copy) v_u_1
	local v2 = {}
	for v3 = 1, select("#", ...) do
		local v4 = select(v3, ...)
		local v5 = #v2
		for v6 = 1, #v4 do
			if v4[v6] == v_u_1 then
				v5 = v5 - 1
			else
				v2[v5 + v6] = v4[v6]
			end
		end
	end
	return v2
end