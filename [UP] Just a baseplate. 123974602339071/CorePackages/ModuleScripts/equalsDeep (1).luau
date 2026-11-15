-- Path: CorePackages.Packages._Index.llama.llama.List.equalsDeep
local v_u_1 = require(script.Parent.Parent.equalObjects)
local function v_u_5(p2, p3) -- name: equalsDeepOneWay
	-- upvalues: (copy) v_u_5
	if type(p2) == "table" and type(p3) == "table" then
		for v4 = 1, #p2 do
			if v_u_5(p2[v4], p3[v4]) then
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
	-- upvalues: (copy) v_u_1, (copy) v_u_5
	if v_u_1(...) then
		return true
	end
	local v6 = select("#", ...)
	for v7 = 1, v6 do
		local v8 = select(v7, ...)
		for v9 = 1, v6 do
			if v9 == v7 or v_u_5(v8, (select(v9, ...))) then
				continue
			end
			return false
		end
	end
	return true
end