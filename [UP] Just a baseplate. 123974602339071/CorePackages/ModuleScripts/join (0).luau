-- Path: CorePackages.Packages._Index.Cryo.Cryo.Dictionary.join
local v_u_1 = require(script.Parent.Parent.None)
return function(...) -- name: join
	-- upvalues: (copy) v_u_1
	local v2 = select("#", ...)
	if v2 == 0 then
		return {}
	end
	if v2 == 1 then
		local v3 = table.clone(...)
		setmetatable(v3, nil)
		return v3
	end
	local v4 = table.clone(select(1, ...))
	setmetatable(v4, nil)
	for v5 = 2, v2 do
		local v6 = select(v5, ...)
		for v7, v8 in pairs(v6) do
			if v8 == v_u_1 then
				v4[v7] = nil
			else
				v4[v7] = v8
			end
		end
	end
	return v4
end