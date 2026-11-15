-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.ItemBeingPurchased
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetItemBeingPurchased)
local v_u_5 = require(v3.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)
return v2.createReducer({
	["itemType"] = nil,
	["itemId"] = nil,
	["resalePrice"] = nil
}, {
	[v4.name] = function(_, p6)
		-- upvalues: (copy) v_u_5
		local v7 = {
			["itemType"] = p6.itemType,
			["itemId"] = p6.itemId
		}
		local v8
		if v_u_5 then
			v8 = p6.resalePrice
		else
			v8 = nil
		end
		v7.resalePrice = v8
		return v7
	end
})