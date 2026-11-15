-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.MenuOfferTooltip
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = require(v2.Packages.React)
local v5 = require(v2.Packages.Foundation)
local v6 = require(v2.Packages.SignalsReact)
local v7 = require(v2.Workspace.Packages.InExperienceOffers)
local v8 = require(v2.Workspace.Packages.SharedFlags)
local v_u_9 = require(v2.Workspace.Packages.Chrome).Hooks.useMappedSignal
local v_u_10 = v8.FFlagOfferNotifyOnGlobalIcon
local v_u_11 = v8.FFlagHideOfferNotificationsWhenShopEmpty
local v_u_12, v_u_13
if v_u_10 then
	v_u_12 = require(v2.Workspace.Packages.InExperienceShop)
	v_u_13 = require(v1.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow
else
	v_u_12 = nil
	v_u_13 = nil
end
local v_u_14 = require(v1.Service)
local v_u_15 = require(v1.ChromeShared.Unibar.Constants)
local v_u_16 = require(v1.ChromeShared.Unibar.Tooltips.TooltipContext)
local v_u_17 = require(v1.ChromeShared.Unibar.Tooltips.useIsTooltipTurn)
local v_u_18 = v5.EducationalTooltip
local v_u_19 = v5.OverlayProvider
local v_u_20 = v5.Enums.ButtonVariant
local v_u_21 = v5.Enums.PopoverSide
local v_u_22 = v5.Enums.PopoverAlign
local v_u_23 = v7.FeatureKeys
local v_u_24 = v7.getOffersStore
local v_u_25 = v7.Utils.isNotificationEligible
local v_u_26 = v7.Utils.selectActiveOffer
local v_u_27 = v7.Hooks.useOffersForKey
local v_u_28 = v7.Hooks.useShopHasItems
local v_u_29 = v6.useSignalState
local v_u_30 = game:DefineFastInt("MenuOfferTooltipPriority", 1500)
local v_u_31 = game:DefineFastInt("MenuOfferTooltipShowDelayMs", 1500)
local v_u_32 = game:DefineFastInt("MenuOfferTooltipDismissDelayMs", 7000)
local function v_u_67(p_u_33) -- name: MenuOfferTooltipContent
	-- upvalues: (copy) v_u_27, (copy) v_u_23, (copy) v_u_29, (copy) v_u_24, (copy) v_u_4, (copy) v_u_25, (copy) v_u_26, (copy) v_u_15, (copy) v_u_14, (ref) v_u_13, (copy) v_u_16, (copy) v_u_17, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_28, (copy) v_u_30, (copy) v_u_31, (copy) v_u_32, (copy) v_u_3, (copy) v_u_20, (copy) v_u_19, (copy) v_u_18, (copy) v_u_21, (copy) v_u_22
	local v_u_34 = v_u_27(v_u_23.RobloxShop)
	local v_u_35 = v_u_29(v_u_24(false).getOfferExposureSnapshot)
	local v38 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_34, (copy) v_u_35, (ref) v_u_25, (ref) v_u_26
		if v_u_34 == nil or v_u_35 == nil then
			return nil
		end
		local v36 = {}
		for _, v37 in v_u_34 do
			if not v_u_25(v37, v_u_35) then
				continue
			end
			table.insert(v36, v37)
		end
		return v_u_26(v36, "tooltip")
	end, { v_u_34, v_u_35 })
	local v_u_39, v_u_40 = v_u_4.useState(false)
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_40, (copy) p_u_33
		local v41 = v_u_40
		local v42
		if p_u_33.anchorRef == nil then
			v42 = false
		else
			v42 = p_u_33.anchorRef.current ~= nil
		end
		v41(v42)
	end, { p_u_33.anchorRef })
	local v43, v_u_44 = v_u_4.useState(false)
	local v_u_45 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_44
		v_u_44(true)
	end, {})
	local v47 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_45, (ref) v_u_15, (ref) v_u_14, (ref) v_u_13, (ref) v_u_24
		v_u_45()
		local v46 = v_u_15.IN_EXPERIENCE_SHOP_ID
		if v_u_14:isWindowOpen(v46) then
			return
		elseif v_u_14:isIntegrationValid(v46) then
			v_u_14:activate(v46)
		elseif v_u_13 and v_u_24(false).getIsInExperienceShopGlobalIconAvailable(false) then
			v_u_13()
		end
	end, { v_u_45 })
	local v48
	if v38 == nil then
		v48 = nil
	else
		v48 = v38.presentationData.tooltip
	end
	local v49
	if v38 == nil then
		v49 = nil
	else
		v49 = v38.offerId
	end
	local v_u_50 = v_u_4.useContext(v_u_16)
	local v51 = v_u_17("MENU_OFFER_TOOLTIP") or false
	local v_u_52 = v_u_4.useRef(v_u_50)
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_52, (copy) v_u_50
		v_u_52.current = v_u_50
	end, { v_u_50 })
	local v53 = v_u_14:integrations()[v_u_15.IN_EXPERIENCE_SHOP_ID]
	local v54 = v_u_9
	local v55
	if v53 then
		v55 = v53.availability
	else
		v55 = nil
	end
	local v56 = v54(v55) == v_u_14.AvailabilitySignal.Available
	local v57
	if v_u_10 then
		v57 = v_u_29(v_u_24(false).getHasInExperienceShopOpened)
	else
		v57 = false
	end
	local v58 = v_u_11
	if v58 then
		v58 = not v_u_28()
	end
	local v59 = v48 ~= nil and p_u_33.visible == true and v56
	if v59 then
		v_u_39 = v_u_39
		if v_u_39 then
			v59 = not v43
		end
	end
	if v_u_10 then
		if v48 == nil or p_u_33.visible ~= true then
			v_u_39 = false
		elseif v_u_39 then
			v_u_39 = not v43
			if v_u_39 then
				v_u_39 = not v57
			end
		end
	else
		v_u_39 = v59
	end
	if v58 then
		v_u_39 = false
	end
	local v60 = { v_u_39, v49 }
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_52, (ref) v_u_39, (ref) v_u_30, (ref) v_u_31, (ref) v_u_32
		local v_u_61 = v_u_52.current
		if not v_u_39 or v_u_61 == nil then
			return nil
		end
		v_u_61.registerTooltip("MENU_OFFER_TOOLTIP", v_u_30, v_u_31, v_u_32)
		return function()
			-- upvalues: (copy) v_u_61
			v_u_61.unregisterTooltip("MENU_OFFER_TOOLTIP")
		end
	end, v60)
	local v62 = v_u_39 and v51
	local v63 = { v_u_39, v_u_45 }
	v_u_4.useEffect(function()
		-- upvalues: (ref) v_u_39, (ref) v_u_14, (copy) v_u_45, (ref) v_u_3
		if not v_u_39 then
			return nil
		end
		local v_u_64 = v_u_14:onIntegrationActivated():connect(function()
			-- upvalues: (ref) v_u_45
			v_u_45()
		end)
		local v_u_65 = v_u_3.MenuOpened:Connect(function()
			-- upvalues: (ref) v_u_45
			v_u_45()
		end)
		return function()
			-- upvalues: (copy) v_u_64, (copy) v_u_65
			v_u_64:disconnect()
			v_u_65:Disconnect()
		end
	end, v63)
	if v48 == nil or not v62 then
		return nil
	end
	local v66 = {
		{
			["text"] = v48.buttonText,
			["variant"] = v_u_20.Emphasis,
			["onActivated"] = v47
		}
	}
	return v_u_4.createElement(v_u_19, nil, {
		["Tooltip"] = v_u_4.createElement(v_u_18, {
			["anchorRef"] = nil,
			["title"] = nil,
			["side"] = nil,
			["align"] = nil,
			["isOpen"] = true,
			["actions"] = nil,
			["onClose"] = nil,
			["onPressedOutside"] = nil,
			["testId"] = "menu-offer-tooltip",
			["anchorRef"] = p_u_33.anchorRef,
			["title"] = v48.title .. string.rep(" ", 10),
			["side"] = v_u_21.Bottom,
			["align"] = v_u_22.Start,
			["actions"] = v66,
			["onClose"] = v_u_45,
			["onPressedOutside"] = v_u_45
		})
	})
end
local function v78(p68) -- name: MenuOfferTooltip
	-- upvalues: (copy) v_u_10, (copy) v_u_29, (copy) v_u_24, (copy) v_u_14, (copy) v_u_15, (copy) v_u_9, (ref) v_u_12, (copy) v_u_4, (copy) v_u_67
	if v_u_10 then
		local v69 = v_u_29(v_u_24(false).getIsInExperienceShopGlobalIconAvailable)
		local v70 = v_u_14:integrations()[v_u_15.IN_EXPERIENCE_SHOP_ID]
		local v71 = v_u_9
		local v72
		if v70 then
			v72 = v70.availability
		else
			v72 = nil
		end
		local v73 = v71(v72) == v_u_14.AvailabilitySignal.Available
		local v76 = v_u_29(function(p74)
			-- upvalues: (ref) v_u_12
			local v75 = v_u_12.GetShopGlobalIconStore
			if v75 then
				return v75(p74).getIconInstance(p74)
			else
				return nil
			end
		end)
		local v77 = v_u_4.useRef(v76)
		v77.current = v76
		if v69 then
			if v77.current == nil then
				return nil
			else
				return v_u_4.createElement(v_u_67, {
					["anchorRef"] = nil,
					["visible"] = true,
					["anchorRef"] = v77
				})
			end
		end
		if not v73 then
			return nil
		end
	end
	return v_u_4.createElement(v_u_67, p68)
end
return v_u_4.memo(v78)