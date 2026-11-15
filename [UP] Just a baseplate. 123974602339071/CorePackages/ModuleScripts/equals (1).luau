-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.equals
local v_u_1 = require(script.Parent.Parent.equalObjects)
return function(...) -- name: equals
	-- upvalues: (copy) v_u_1
	if v_u_1(...) then
		return true
	end
	local v2 = select("#", ...)
	for v3 = 1, v2 do
		local v4 = select(v3, ...)
		for v5 = 1, v2 do
			if v5 == v3 then
				continue
			end
			local v6 = select(v5, ...)
			for v7, v8 in pairs(v4) do
				if v8 == v6[v7] then
					continue
				end
				return false
			end
		end
	end
	return true
end