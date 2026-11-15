-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetEconomyProductInfo
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Models.AssetInfo)
local v_u_6 = require(v3.Models.BundleInfo)
local v_u_7 = require(v3.Services.Network)
local v_u_8 = require(v3.Actions.SetAssets)
local v_u_9 = require(v3.Actions.SetBundles)
local v10 = require(v3.createInspectAndBuyKeyMapper)
local v_u_11 = require(v3.Thunks.SendCounter)
local v_u_12 = require(v3.Constants)
local v_u_13 = { v_u_7 }
local v_u_14 = v10("getEconomyProductInfo")
return function(p_u_15, p_u_16, p_u_17) -- name: GetEconomyProductInfo
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_7, (copy) v_u_14, (copy) v_u_2, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_11, (copy) v_u_12
	return v_u_4.new(script.Name, v_u_13, function(p_u_18, p19)
		-- upvalues: (ref) v_u_7, (ref) v_u_14, (copy) p_u_15, (ref) v_u_2, (copy) p_u_16, (ref) v_u_5, (ref) v_u_8, (ref) v_u_6, (copy) p_u_17, (ref) v_u_9, (ref) v_u_11, (ref) v_u_12
		local v_u_20 = p19[v_u_7]
		local v21 = v_u_14(p_u_18:getState().storeId, p_u_15)
		return v_u_2.Single(v21, function()
			-- upvalues: (copy) v_u_20, (ref) p_u_15, (ref) p_u_16, (ref) v_u_5, (copy) p_u_18, (ref) v_u_8, (ref) v_u_6, (ref) p_u_17, (ref) v_u_9, (ref) v_u_11, (ref) v_u_12
			return v_u_20.getEconomyProductInfo(p_u_15):andThen(function(p22)
				-- upvalues: (ref) p_u_16, (ref) v_u_5, (ref) p_u_18, (ref) v_u_8, (ref) v_u_6, (ref) p_u_17, (ref) v_u_9, (ref) v_u_11, (ref) v_u_12
				local v23 = not p22.purchasable and p22.reason == "AlreadyOwned" and true or false
				local v24 = p22.price or 0
				local v25 = p22.purchasable
				local v26 = p22.premiumPricing
				local v27 = not p22.purchasable and p22.reason == "InsufficientFunds" and true or v25
				if p_u_16 then
					p_u_18:dispatch(v_u_9({ (v_u_6.fromGetEconomyProductInfo(v23, p_u_17, v24, v27)) }))
				else
					p_u_18:dispatch(v_u_8({ (v_u_5.fromGetEconomyProductInfo(p22, v23, v24, v27, v26)) }))
				end
				p_u_18:dispatch(v_u_11(v_u_12.Counters.GetEconomyProductInfo .. v_u_12.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: (ref) p_u_18, (ref) v_u_11, (ref) v_u_12
				p_u_18:dispatch(v_u_11(v_u_12.Counters.GetEconomyProductInfo .. v_u_12.CounterSuffix.RequestRejected))
			end)
		end)(p_u_18):catch(function(_)
			-- upvalues: (copy) p_u_18, (ref) v_u_11, (ref) v_u_12
			p_u_18:dispatch(v_u_11(v_u_12.Counters.GetEconomyProductInfo .. v_u_12.CounterSuffix.RequestFailed))
		end)
	end)
end