-- Path: CorePackages.Packages._Index.Dash.Dash.iterator
local v1 = script.Parent
require(v1.Types)
return function(p2) -- name: iterator
	if typeof(p2) == "function" then
		return p2
	elseif typeof(p2) == "table" then
		if #p2 > 0 then
			return ipairs(p2)
		else
			return pairs(p2)
		end
	else
		return nil
	end
end