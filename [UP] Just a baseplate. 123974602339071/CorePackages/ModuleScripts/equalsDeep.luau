-- Path: CorePackages.Packages._Index.Cryo.Cryo.equalsDeep
local v_u_1 = require(script.Parent.equalObjects)
local function v_u_8(p2, p3) -- name: compareDeep
	-- upvalues: (copy) v_u_8
	if type(p2) ~= "table" or type(p3) ~= "table" then
		return p2 == p3
	end
	for v4, v5 in p2 do
		if v_u_8(p3[v4], v5) then
			continue
		end
		return false
	end
	for v6, v7 in p3 do
		if v_u_8(p2[v6], v7) then
			continue
		end
		return false
	end
	return true
end
return function(...) -- name: equalsDeep
	-- upvalues: (copy) v_u_1, (copy) v_u_8
	if v_u_1(...) then
		return true
	end
	local v9 = select("#", ...)
	local v10 = select(1, ...)
	for v11 = 2, v9 do
		if v_u_8(v10, (select(v11, ...))) then
			continue
		end
		return false
	end
	return true
end