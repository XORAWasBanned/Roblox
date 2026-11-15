-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.equalsDeep
local v_u_1 = require(script.Parent.Parent.equalObjects)
local function v_u_6(p2, p3) -- name: equalsDeepOneWay
	-- upvalues: (copy) v_u_6
	if type(p2) == "table" and type(p3) == "table" then
		for v4, v5 in pairs(p2) do
			if v_u_6(v5, p3[v4]) then
				continue
			end
			return false
		end
	elseif p2 ~= p3 then
		return false
	end
	return true
end
return function(...) -- name: equalsDeep
	-- upvalues: (copy) v_u_1, (copy) v_u_6
	if v_u_1(...) then
		return true
	end
	local v7 = select("#", ...)
	for v8 = 1, v7 do
		local v9 = select(v8, ...)
		for v10 = 1, v7 do
			if v10 == v8 or v_u_6(v9, (select(v10, ...))) then
				continue
			end
			return false
		end
	end
	return true
end