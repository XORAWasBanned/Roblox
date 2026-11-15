-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetItemDetails
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Models.AssetInfo)
local v_u_6 = require(v3.Models.BundleInfo)
local v_u_7 = require(v3.Services.Network)
local v_u_8 = require(v3.Actions.SetAssets)
local v_u_9 = require(v3.Actions.SetBundles)
local v_u_10 = require(v3.Thunks.GetExperiencePlayability)
local v_u_11 = require(v3.Thunks.GetExperienceInfo)
local v12 = require(v3.createInspectAndBuyKeyMapper)
local v_u_13 = require(v3.Thunks.SendCounter)
local v_u_14 = require(v3.Constants)
local v_u_15 = { v_u_7 }
local v_u_16 = v12("getItemDetails")
return function(p_u_17, p_u_18) -- name: GetItemDetails
	-- upvalues: (copy) v_u_4, (copy) v_u_15, (copy) v_u_7, (copy) v_u_16, (copy) v_u_2, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_13, (copy) v_u_14, (copy) v_u_10, (copy) v_u_11
	return v_u_4.new(script.Name, v_u_15, function(p_u_19, p20)
		-- upvalues: (ref) v_u_7, (ref) v_u_16, (copy) p_u_17, (copy) p_u_18, (ref) v_u_2, (ref) v_u_5, (ref) v_u_8, (ref) v_u_6, (ref) v_u_9, (ref) v_u_13, (ref) v_u_14, (ref) v_u_10, (ref) v_u_11
		local v_u_21 = p20[v_u_7]
		local v22 = v_u_16(p_u_19:getState().storeId, p_u_17, p_u_18)
		return v_u_2.Single(v22, function()
			-- upvalues: (copy) v_u_21, (ref) p_u_17, (ref) p_u_18, (ref) v_u_5, (copy) p_u_19, (ref) v_u_8, (ref) v_u_6, (ref) v_u_9, (ref) v_u_13, (ref) v_u_14, (ref) v_u_10, (ref) v_u_11
			return v_u_21.getItemDetails(p_u_17, p_u_18):andThen(function(p23)
				-- upvalues: (ref) p_u_18, (ref) v_u_5, (ref) p_u_19, (ref) v_u_8, (ref) v_u_6, (ref) v_u_9, (ref) v_u_13, (ref) v_u_14, (ref) v_u_10, (ref) v_u_11
				if p_u_18 == Enum.AvatarItemType.Asset then
					p_u_19:dispatch(v_u_8({ (v_u_5.fromGetItemDetails(p23)) }))
				elseif p_u_18 == Enum.AvatarItemType.Bundle then
					p_u_19:dispatch(v_u_9({ (v_u_6.fromGetItemDetails(p23)) }))
				else
					p_u_19:dispatch(v_u_13(v_u_14.Counters.GetItemDetailsRespondedWithUnknownItemType))
				end
				if p23.CreatingUniverseId then
					p_u_19:dispatch(v_u_10(p23.CreatingUniverseId))
					p_u_19:dispatch(v_u_11(p23.CreatingUniverseId))
				end
				p_u_19:dispatch(v_u_13(v_u_14.Counters.GetItemDetails .. v_u_14.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_19, (ref) v_u_13, (ref) v_u_14
				p_u_19:dispatch(v_u_13(v_u_14.Counters.GetItemDetails .. v_u_14.CounterSuffix.RequestRejected))
			end)
		end)(p_u_19):catch(function(_)
			-- upvalues: (copy) p_u_19, (ref) v_u_13, (ref) v_u_14
			p_u_19:dispatch(v_u_13(v_u_14.Counters.GetItemDetails .. v_u_14.CounterSuffix.RequestFailed))
		end)
	end)
end