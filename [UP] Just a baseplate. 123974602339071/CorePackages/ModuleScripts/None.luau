-- Path: CorePackages.Packages._Index.Collections.Collections.Object.None
local v1 = newproxy(true)
getmetatable(v1).__tostring = function()
	return "Object.None"
end
return v1