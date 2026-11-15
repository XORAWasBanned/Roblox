-- Path: CorePackages.Packages._Index.Dash.Dash.startsWith
return function(p1, p2) -- name: startsWith
	return p1:sub(1, p2:len()) == p2
end