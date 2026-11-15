-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Selectors.GotFavoriteForDetailsItem
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).Enum.RetrievalStatus
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local v_u_5 = require(v3.UtilityFunctions)
local v6 = require(v3.createInspectAndBuyKeyMapper)
local v_u_7 = v6("getFavoriteForAsset")
local v_u_8 = v6("getFavoriteForBundle")
return function(p9)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_8, (copy) v_u_2, (copy) v_u_7
	local v10 = p9.detailsInformation.assetId
	if not v10 then
		return false
	end
	local v11 = v_u_4(p9)
	if v11 == nil then
		return false
	end
	local v12 = p9.assets[v10]
	if not v12 then
		return false
	end
	if not v11 then
		local v13 = v_u_7(p9.storeId, v10)
		return p9.FetchingStatus[v13] == v_u_2.Fetching and true or p9.FetchingStatus[v13] == v_u_2.Done
	end
	local v14 = v_u_5.getBundleId(v12)
	local v15 = v_u_8(p9.storeId, v14)
	return p9.FetchingStatus[v15] == v_u_2.Fetching and true or p9.FetchingStatus[v15] == v_u_2.Done
end