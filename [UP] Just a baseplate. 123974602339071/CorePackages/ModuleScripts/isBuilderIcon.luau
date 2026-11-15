-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.isBuilderIcon
local v1 = script:FindFirstAncestor("Foundation").Parent
return require(v1.Dash).memoize(function(p2) -- name: isBuilderIcon
	local v3
	if p2 == nil or p2 == "" then
		v3 = false
	else
		v3 = p2:find("[^%l%d%-]") == nil
	end
	return v3
end)