-- Path: CorePackages.Packages._Index.Dash.Dash.endsWith
return function(p1, p2) -- name: endsWith
	return p1:sub(-p2:len()) == p2
end