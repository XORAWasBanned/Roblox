-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Selectors.IsDetailsItemPartOfBundleAndOffsale
return function(p1)
	local v2 = p1.detailsInformation.assetId
	if v2 == nil then
		return nil
	end
	local v3 = p1.assets[v2]
	if v3 then
		v3 = v3.parentBundleId ~= nil
	end
	return v3
end