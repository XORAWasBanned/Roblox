-- Path: CorePackages.Packages._Index.Dash.Dash.includes
return function(p1, p2) -- name: includes
	if p2 == nil then
		return false
	end
	for _, v3 in p1 do
		if v3 ~= p2 then
			continue
		end
		return true
	end
	return false
end