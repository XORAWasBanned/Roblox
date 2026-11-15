-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.AvatarPreviewDetails
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.SetAvatarPreviewDetails)
local v6 = require(v4.Actions.UpdateBulkPuchaseResults)
local v7 = require(v1.Workspace.Packages.AvatarExperienceModel)
require(v1.Workspace.Packages.AvatarExperienceInspectAndBuy)
local v_u_8 = v7.Enums.ItemTypeEnum
local v9 = require(v4.Flags.FFlagAXEnableFetchAvatarPreview)
local v10 = require(v1.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase
return v3.createReducer({}, {
	[v6.name] = v10 and function(p11, p12)
		-- upvalues: (copy) v_u_2
		local v13 = p12.result.RobuxSpent
		local v14 = {
			["totalPrice"] = p11.totalPrice - v13
		}
		return v_u_2.Dictionary.join(p11, v14)
	end or nil,
	[v5.name] = v9 and function(p15, p16)
		-- upvalues: (copy) v_u_2, (copy) v_u_8
		local v17 = {}
		local v18, v19
		if p16.avatarPreviewDetails and p16.avatarPreviewDetails.look then
			local v20 = p16.avatarPreviewDetails.look
			v18 = v20.totalPrice
			v19 = v20.totalValue
			if v20.items then
				v17 = v_u_2.List.map(v20.items, function(p21)
					-- upvalues: (ref) v_u_8
					local v22 = {}
					local v23 = p21.id
					v22.id = tostring(v23)
					local v24
					if p21.itemType == v_u_8.Asset then
						v24 = v_u_8.Asset
					else
						v24 = v_u_8.Bundle
					end
					v22.itemType = v24
					v22.noPriceStatus = p21.noPriceStatus
					v22.quantityOwned = p21.quantityOwned
					return v22
				end)
			end
		else
			v18 = nil
			v19 = nil
		end
		return v_u_2.Dictionary.join(p15, {
			["totalPrice"] = v18,
			["totalValue"] = v19,
			["items"] = v17
		})
	end or nil
})