-- Path: CorePackages.Packages._Index.Dash.Dash.rightPad
return function(p1, p2, p3) -- name: rightPad
	local v4 = p3 or " "
	local v5 = p2 - p1:len()
	local v6 = v5 % v4:len()
	local v7 = (v5 - v6) / v4:len()
	return p1 .. string.rep(p3 or " ", v7) .. v4:sub(1, v6)
end