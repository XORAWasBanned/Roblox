-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.UtilityFunctions
local v1 = script.Parent
local v_u_2 = require(v1.Constants)
local v_u_3 = require(v1.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local v_u_26 = {
	["getBundleId"] = function(p4) -- name: getBundleId
		if p4.parentBundleId == nil then
			return nil
		else
			return p4.parentBundleId
		end
	end,
	["isCollectibles"] = function(p5) -- name: isCollectibles
		-- upvalues: (copy) v_u_2
		local v6 = p5 and p5.productType
		if v6 then
			v6 = p5.productType == v_u_2.ProductType.CollectibleItem
		end
		return v6
	end,
	["hasLimitedQuantity"] = function(p7) -- name: hasLimitedQuantity
		-- upvalues: (copy) v_u_3
		if not p7 then
			return nil
		end
		local v8 = p7.isLimited
		local v9
		if v_u_3() then
			v9 = p7.isLimitedUnique
		else
			v9 = nil
		end
		return v8 or (v9 or p7.collectibleIsLimited)
	end,
	["isLimited1Point0"] = function(p10) -- name: isLimited1Point0
		if p10 then
			return p10.isLimited or p10.isLimitedUnique
		else
			return nil
		end
	end,
	["isLimited1Point0_LimitedUnique"] = function(p11) -- name: isLimited1Point0_LimitedUnique
		if p11 then
			return p11.isLimitedUnique
		else
			return nil
		end
	end,
	["isLimited2Point0_Or_LimitedCollectible"] = function(p12) -- name: isLimited2Point0_Or_LimitedCollectible
		if p12 then
			return p12.collectibleIsLimited
		else
			return nil
		end
	end,
	["isUnlimitedCollectibleAsset"] = function(p13, p14) -- name: isUnlimitedCollectibleAsset
		-- upvalues: (copy) v_u_26, (copy) v_u_2
		if not (p13 and p14) then
			return nil
		end
		local v15 = not v_u_26.hasLimitedQuantity(p14)
		local v16 = p14.productType == v_u_2.ProductType.CollectibleItem
		local v17 = p13 == v_u_2.ItemType.Asset
		if v15 then
			if not v16 then
				v17 = v16
			end
		else
			v17 = v15
		end
		return v17
	end,
	["isLimitedBundle"] = function(p18, p19) -- name: isLimitedBundle
		-- upvalues: (copy) v_u_2
		if p18 and p19 then
			return p19.collectibleIsLimited and p18 == v_u_2.ItemType.Bundle
		else
			return nil
		end
	end,
	["isUnlimitedCollectibleBundle"] = function(p20, p21) -- name: isUnlimitedCollectibleBundle
		-- upvalues: (copy) v_u_2
		if not (p20 and p21) then
			return nil
		end
		local v22 = not p21.collectibleIsLimited
		local v23 = p21.productType == v_u_2.ProductType.CollectibleItem
		local v24 = p20 == v_u_2.ItemType.Bundle
		if v22 then
			if not v23 then
				v24 = v23
			end
		else
			v24 = v22
		end
		return v24
	end,
	["isLimitedCollectible"] = function(p25) -- name: isLimitedCollectible
		-- upvalues: (copy) v_u_26, (copy) v_u_2
		if p25 then
			return v_u_26.hasLimitedQuantity(p25) and p25.productType == v_u_2.ProductType.CollectibleItem
		else
			return nil
		end
	end
}
return v_u_26