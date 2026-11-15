-- Path: CorePackages.Packages._Index.Dash.Dash.shallowEqual
return function(p1, p2) -- name: shallowEqual
	if p1 == p2 then
		return true
	end
	if typeof(p1) ~= "table" or (typeof(p2) ~= "table" or #p1 ~= #p2) then
		return false
	end
	if p1 == nil or p2 == nil then
		return false
	end
	for v3, v4 in p1 do
		if p2[v3] == v4 then
			continue
		end
		return false
	end
	for v5, v6 in p2 do
		if p1[v5] == v6 then
			continue
		end
		return false
	end
	return true
end