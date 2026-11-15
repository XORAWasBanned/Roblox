-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Icon.migrateFontSize
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Providers.Style.Tokens)
return function(p2, p3) -- name: migrateFontSize
	local v4 = p3.Size.Size_100
	local v5 = p3.Size.Size_600
	local v6 = p3.Size.Size_900
	if v5 <= p2 then
		if p2 > v6 then
			v5 = p2
		end
	else
		v5 = p2
	end
	local v7 = v5 / v4
	return math.round(v7) * v4
end