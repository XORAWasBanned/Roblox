-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.UpdateOwnedStatus
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Thunk)
local v_u_3 = require(v1.Constants)
local v_u_4 = require(v1.Models.BundleInfo)
local v_u_5 = require(v1.Models.AssetInfo)
local v_u_6 = require(v1.Actions.SetBundles)
local v_u_7 = require(v1.Actions.SetAssets)
return function(p_u_8, p_u_9) -- name: UpdateOwnedStatus
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	return v_u_2.new(script.Name, {}, function(p10, _)
		-- upvalues: (copy) p_u_9, (ref) v_u_3, (copy) p_u_8, (ref) v_u_5, (ref) v_u_7, (ref) v_u_4, (ref) v_u_6
		local v11 = p10:getState()
		if p_u_9 == v_u_3.ItemType.Asset then
			if v11.assets[p_u_8] then
				p10:dispatch(v_u_7({ (v_u_5.fromPurchaseSuccess(p_u_8)) }))
				return
			end
		elseif p_u_9 == v_u_3.ItemType.Bundle and v11.bundles[p_u_8] then
			p10:dispatch(v_u_6({ (v_u_4.fromPurchaseSuccess(p_u_8)) }))
		end
	end)
end