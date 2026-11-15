-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Selectors.GetPurchaseAnalyticsOptions
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Constants)
require(v2.Services.Analytics)
require(v1.Workspace.Packages.AvatarExperienceInspectAndBuy)
return function(p4, p5, p6, p7)
	-- upvalues: (copy) v_u_3
	if not p5 then
		return {
			["price"] = p7
		}
	end
	local v8, v9
	if p6 == v_u_3.ItemType.Bundle then
		local v10 = p4.bundles
		if v10 then
			v10 = p4.bundles[p5]
		end
		if not v10 then
			return {
				["price"] = p7
			}
		end
		v8 = v10.bundleType
		local v11 = v10.price
		v9 = tonumber(v11)
	else
		local v12 = p4.assets
		if v12 then
			v12 = p4.assets[p5]
		end
		if not v12 then
			return {
				["price"] = p7
			}
		end
		v8 = v12.assetTypeId
		local v13 = v12.price
		v9 = tonumber(v13)
	end
	local v14 = {}
	if v8 == nil or v8 == "" then
		v8 = nil
	end
	v14.itemSubType = v8
	v14.price = p7 or v9
	return v14
end