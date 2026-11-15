-- Path: CorePackages.Packages._Index.Dash.Dash.get
return function(p1, p2, p3) -- name: get
	if p1 == nil then
		return p3
	end
	for _, v4 in p2 do
		if type(p1) ~= "table" then
			return p3
		end
		p1 = p1[v4]
		if p1 ~= nil then
			continue
		end
		return p3
	end
	return p1
end