-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.PromptPurchase
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("MarketplaceService")
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Analytics)
local v_u_6 = require(v3.Constants)
local v_u_7 = require(v3.Actions.SetItemBeingPurchased)
local v_u_8 = require(v3.Thunks.SendCounter)
local v_u_9 = require(v3.Thunks.ReportPurchaseAttemptUnifiedEvent)
local v_u_10 = require(v3.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)
local v_u_11 = game:DefineFastFlag("FixInspectAndBuyThirdPartySales", false)
local v_u_12 = { v_u_5 }
return function(p_u_13, p_u_14, p_u_15, p_u_16, p_u_17, p_u_18, p_u_19) -- name: PromptPurchase
	-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_5, (copy) v_u_6, (copy) v_u_10, (copy) v_u_7, (copy) v_u_2, (copy) v_u_1, (copy) v_u_8, (copy) v_u_11, (copy) v_u_9
	return v_u_4.new(script.Name, v_u_12, function(p20, p21)
		-- upvalues: (ref) v_u_5, (copy) p_u_16, (copy) p_u_14, (ref) v_u_6, (ref) v_u_10, (copy) p_u_18, (ref) v_u_7, (copy) p_u_13, (ref) v_u_2, (ref) v_u_1, (copy) p_u_15, (copy) p_u_17, (ref) v_u_8, (copy) p_u_19, (ref) v_u_11, (ref) v_u_9
		local v22 = p21[v_u_5]
		local v23
		if p_u_16 == nil then
			v23 = false
		else
			v23 = p_u_14 ~= v_u_6.ItemType.Bundle
		end
		local v24
		if v_u_10 and v23 then
			v24 = p_u_18
		else
			v24 = nil
		end
		p20:dispatch(v_u_7(p_u_13, p_u_14, v24))
		if v23 then
			v_u_2:PromptCollectiblesPurchase(v_u_1.LocalPlayer, p_u_13, p_u_15, p_u_17, p_u_16, p_u_18)
			p20:dispatch(v_u_8(v_u_6.Counters.PromptLimitedCollectiblesPurchase))
		elseif p_u_14 == v_u_6.ItemType.Bundle then
			v_u_2:PromptBundlePurchase(v_u_1.LocalPlayer, p_u_13)
			p20:dispatch(v_u_8(v_u_6.Counters.PromptBundlePurchase))
		elseif p_u_14 == v_u_6.ItemType.Asset then
			local v25 = not p_u_19
			if v_u_11 or (p_u_15 == nil or not v25) then
				v_u_2:PromptRobloxPurchase(p_u_13, false)
				p20:dispatch(v_u_8(v_u_6.Counters.PromptRobloxPurchase))
			else
				v_u_2:PromptPurchase(v_u_1.LocalPlayer, p_u_13, false)
				p20:dispatch(v_u_8(v_u_6.Counters.PromptUnlimitedCollectiblePurchase))
			end
		else
			p20:dispatch(v_u_8(v_u_6.Counters.PromptPurchaseUnknownItemType))
		end
		if v_u_10 then
			p20:dispatch(v_u_9(p_u_13, p_u_14, v24))
		else
			v22.reportPurchaseAttempt(p_u_14, p_u_13)
		end
	end)
end