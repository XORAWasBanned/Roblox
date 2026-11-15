-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.equals
local v_u_1 = require(script.Parent.Parent.equalObjects)
local function v_u_5(p2, p3) -- name: compare
	if type(p2) ~= "table" or type(p3) ~= "table" then
		return p2 == p3
	end
	if #p2 ~= #p3 then
		return false
	end
	for v4 = 1, #p2 do
		if p2[v4] == p3[v4] then
			continue
		end
		return false
	end
	return true
end
return function(...) -- name: equals
	-- upvalues: (copy) v_u_1, (copy) v_u_5
	if v_u_1(...) then
		return true
	end
	local v6 = select("#", ...)
	local v7 = select(1, ...)
	for v8 = 2, v6 do
		if v_u_5(v7, (select(v8, ...))) then
			continue
		end
		return false
	end
	return true
end