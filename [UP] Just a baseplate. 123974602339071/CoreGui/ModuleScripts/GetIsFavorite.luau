-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Selectors.GetIsFavorite
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local v_u_3 = require(v1.UtilityFunctions)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = p4.detailsInformation.assetId
	if not v5 then
		return false
	end
	local v6 = v_u_2(p4)
	if v6 == nil then
		return false
	end
	local v7 = p4.assets[v5]
	if not v7 then
		return false
	end
	if not v6 then
		return p4.favorites.assets[v5]
	end
	local v8 = v_u_3.getBundleId(v7)
	return p4.favorites.bundles[v8]
end