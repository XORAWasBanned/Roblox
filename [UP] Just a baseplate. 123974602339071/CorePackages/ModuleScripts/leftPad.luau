-- Path: CorePackages.Packages._Index.Dash.Dash.leftPad
return function(p1, p2, p3) -- name: leftPad
	local v4 = p3 or " "
	local v5 = p2 - p1:len()
	local v6 = v5 % v4:len()
	local v7 = (v5 - v6) / v4:len()
	return string.rep(v4 or " ", v7) .. v4:sub(1, v6) .. p1
end