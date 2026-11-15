-- Path: CorePackages.Packages._Index.Dash.Dash.isCallable
return function(p1) -- name: isCallable
	return (type(p1) == "function" or type(p1) == "table" and (getmetatable(p1) and getmetatable(p1).__call ~= nil)) and true or false
end