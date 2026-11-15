-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.ShopEntrypoint
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("GuiService")
local v4 = game:GetService("MarketplaceService")
local v_u_5 = game:GetService("Players")
local v6 = game:GetService("StarterGui")
local v_u_7 = require(v2.Packages.React)
local v8 = require(v2.Packages.Signals)
local v_u_9 = require(v1.Service)
local v10 = require(v2.Workspace.Packages.Chrome)
local v11 = require(v1.ChromeShared.Service.WindowSizeSignal)
local v_u_12 = require(v1.ChromeShared.Unibar.Constants)
local v_u_13 = require(v1.Integrations.CommonIcon)
local v14 = require(v1.Integrations.InExperienceShop.initializeShopMenuController)
local v_u_15 = require(v1.Integrations.InExperienceShop.ShopChromeWrapper)
local v_u_16 = require(v1.Integrations.InExperienceShop.ShopWindowLayout)
local v17 = require(v1.ChromeShared.Service.ChromeUtils)
local v18 = v17.MappedSignal
local v19 = v10.Enums.SideSheetPlacement
local v20 = require(v2.Workspace.Packages.InExperienceShop)
local v21 = v20.FFlagEnableFreeTrialBlueDot
local v22 = v20.FFlagEnableShopPrefetch
local v_u_23 = v20.FFlagHideShopMenuOnFailure
local v_u_24 = v20.FFlagCenterInExperienceShopWindow
local v25 = v20.FFlagFixInExperienceShopCursorLock
local v26 = require(v2.Workspace.Packages.SharedFlags)
local v27 = v26.FFlagEnableMenuTrailingBadge
local v28 = v26.FFlagShowOfferBadge
local v_u_29 = v20.FFlagExperienceShopNewIconography
local v30 = v20.FFlagEnableFreeTrialShopMenuBadge
local v_u_31 = v20.FFlagMenuBadgePreferFreeTrialOverOffer
local v32 = game:GetEngineFeature("ShopCoreGuiToggleSupported")
local v33 = game:GetEngineFeature("EnableOpenShopSignal")
local v_u_34 = v18.new(v_u_9:onIntegrationStatusChanged(), function()
	-- upvalues: (copy) v_u_9, (copy) v_u_12
	return v_u_9:isWindowOpen(v_u_12.IN_EXPERIENCE_SHOP_ID)
end)
local v_u_35 = v_u_16.MAX_WINDOW_WIDTH
local v_u_36 = v_u_16.MAX_WINDOW_HEIGHT
local v_u_37 = v11.new(v_u_35, v_u_36, false, true)
local v38 = game:DefineFastString("InExperienceShopNewBadgeStorageKey", "InExperienceShopNewBadgeStorageKey")
local v39 = game:DefineFastInt("NewBadgeDismissalMaxCountInExperienceShop", 5)
local v40 = game:DefineFastFlag("EnableNewBadgeInExperienceShop", false) and v27
local v_u_41 = nil
local v_u_42, v43
if v28 then
	local v44 = require(v2.Workspace.Packages.InExperienceOffers)
	v_u_42 = v44.Utils.createOfferBadgeTextSignal(v44.FeatureKeys.RobloxShop)
	v43 = v_u_42
else
	v_u_42 = nil
	v43 = nil
end
if v30 then
	local v_u_45 = require(v2.Workspace.Packages.InExperienceShop.submitFreeTrialMenuBadge)
	local v_u_46 = v_u_45()
	v43 = v_u_31 and v_u_42 ~= nil and function(p47)
		-- upvalues: (copy) v_u_46, (copy) v_u_42
		local v48 = v_u_46(p47)
		if v48 == nil then
			return v_u_42(p47)
		else
			return v48
		end
	end or (v_u_42 ~= nil and function(p49)
		-- upvalues: (copy) v_u_42, (copy) v_u_46
		local v50 = v_u_42(p49)
		if v50 == nil then
			return v_u_46(p49)
		else
			return v50
		end
	end or v_u_46)
	v_u_41 = v_u_45.dismiss
	local v_u_51 = false
	local function v_u_53() -- name: reportTrialBadgeSeen
		-- upvalues: (ref) v_u_51, (copy) v_u_46, (copy) v_u_31, (copy) v_u_42, (copy) v_u_9, (copy) v_u_12, (copy) v_u_45
		if v_u_51 or v_u_46(false) == nil then
			return
		else
			if not v_u_31 then
				local v52 = v_u_42
				if v52 ~= nil and v52(false) ~= nil then
					return
				end
			end
			if v_u_9:withinCurrentSubmenu(v_u_12.IN_EXPERIENCE_SHOP_ID) then
				v_u_51 = true
				v_u_45.reportMounted()
				v_u_45.reportViewed()
			end
		end
	end
	v_u_9:currentSubMenu():connect(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_12, (ref) v_u_51, (copy) v_u_53
		if v_u_9:withinCurrentSubmenu(v_u_12.IN_EXPERIENCE_SHOP_ID) then
			v_u_53()
		else
			v_u_51 = false
		end
	end)
	v8.createEffect(function(p54)
		-- upvalues: (copy) v_u_46, (copy) v_u_31, (copy) v_u_42, (copy) v_u_53
		v_u_46(p54)
		if not v_u_31 then
			local v55 = v_u_42
			if v55 ~= nil then
				v55(p54)
			end
		end
		v_u_53()
	end)
end
local v56 = (v40 or v43 ~= nil) and {
	["localStorageKey"] = v38,
	["maxViewCount"] = not v40 and 0 or v39,
	["customText"] = v43
} or nil
local v_u_57
if v32 then
	v_u_57 = v6:GetCoreGuiEnabled(Enum.CoreGuiType.All) or v6:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop)
else
	v_u_57 = false
end
local v58 = true
local v59 = {
	["initialAvailability"] = nil,
	["id"] = nil,
	["sideSheetPlacement"] = nil,
	["label"] = "Feature.Avatar.Action.Shop",
	["cachePosition"] = true,
	["draggable"] = true,
	["windowSize"] = nil,
	["startingWindowPosition"] = nil,
	["activated"] = nil,
	["menuTrailingBadgeConfig"] = nil,
	["isActivated"] = nil,
	["components"] = nil
}
local v60, v_u_61
if v_u_57 and not v_u_23 then
	v60 = v_u_9.AvailabilitySignal.Available
	v_u_61 = v58
else
	v58 = false
	v60 = v_u_9.AvailabilitySignal.Unavailable
	v_u_61 = v58
end
v59.initialAvailability = v60
v59.id = v_u_12.IN_EXPERIENCE_SHOP_ID
v59.sideSheetPlacement = v19.AboveFold
v59.windowSize = v_u_37
v59.startingWindowPosition = v_u_16.getStartingWindowPosition()
function v59.activated(_) -- name: activated
	-- upvalues: (ref) v_u_41, (copy) v_u_9, (copy) v_u_12, (copy) v_u_24, (copy) v_u_16
	if v_u_41 ~= nil and not v_u_9:isWindowOpen(v_u_12.IN_EXPERIENCE_SHOP_ID) then
		v_u_41()
	end
	if v_u_24 then
		v_u_16.toggleInExperienceShopWindow()
	else
		v_u_9:toggleWindow(v_u_12.IN_EXPERIENCE_SHOP_ID)
	end
end
v59.menuTrailingBadgeConfig = v56
v59.isActivated = v_u_34
v59.components = {
	["Icon"] = function() -- name: Icon
		-- upvalues: (copy) v_u_13, (copy) v_u_29, (copy) v_u_34
		return v_u_13(v_u_29 and "ShoppingBasket" or "BuildingStore", nil, v_u_34)
	end,
	["Window"] = function() -- name: Window
		-- upvalues: (copy) v_u_7, (copy) v_u_15, (copy) v_u_37, (copy) v_u_35, (copy) v_u_36
		local v62 = {
			["windowSize"] = v_u_37,
			["maxWindowWidth"] = v_u_35,
			["maxWindowHeight"] = v_u_36
		}
		return v_u_7.createElement(v_u_15, v62)
	end
}
local v_u_63 = v_u_9:register(v59)
if v25 then
	v14(v3, v_u_34)
end
if v22 then
	local v64 = require(v2.Workspace.Packages.InExperienceShop.prefetchShopDataOnGameJoin)
	if v_u_23 then
		task.spawn(v64, function(p65)
			-- upvalues: (ref) v_u_61, (ref) v_u_57, (copy) v_u_63
			if p65 then
				v_u_61 = true
				if v_u_57 then
					v_u_63.availability:available()
				end
			end
		end)
	else
		task.spawn(v64)
	end
end
if v21 then
	require(v2.Workspace.Packages.InExperienceShop.submitFreeTrialBlueDot)()
end
if v33 then
	v4.OpenShopRequested:Connect(function(p66)
		-- upvalues: (copy) v_u_5, (copy) v_u_23, (ref) v_u_61, (copy) v_u_9, (copy) v_u_12, (ref) v_u_41, (copy) v_u_24, (copy) v_u_16
		if p66 == v_u_5.LocalPlayer then
			if v_u_23 and not v_u_61 then
				return
			end
			if not v_u_9:isWindowOpen(v_u_12.IN_EXPERIENCE_SHOP_ID) then
				if v_u_41 ~= nil and not v_u_9:isWindowOpen(v_u_12.IN_EXPERIENCE_SHOP_ID) then
					v_u_41()
				end
				if v_u_24 then
					v_u_16.toggleInExperienceShopWindow()
					return
				end
				v_u_9:toggleWindow(v_u_12.IN_EXPERIENCE_SHOP_ID)
			end
		end
	end)
end
if v32 then
	v17.setCoreGuiAvailability(v_u_63, Enum.CoreGuiType.ExperienceShop, function(p67)
		-- upvalues: (ref) v_u_57, (copy) v_u_23, (ref) v_u_61, (copy) v_u_63, (copy) v_u_9, (copy) v_u_12
		v_u_57 = p67
		if v_u_57 and (not v_u_23 or v_u_61) then
			v_u_63.availability:available()
		else
			if v_u_9:isWindowOpen(v_u_12.IN_EXPERIENCE_SHOP_ID) then
				v_u_9:toggleWindow(v_u_12.IN_EXPERIENCE_SHOP_ID)
			end
			v_u_63.availability:unavailable()
		end
	end)
end
return v_u_63