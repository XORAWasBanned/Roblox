-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.InspectAndBuyBaseContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = game:GetService("CoreGui")
local v4 = script.Parent.Parent
local v_u_5 = require(v1.Packages.React)
local v6 = require(v1.Workspace.Packages.AvatarExperienceFlags)
local v_u_7 = require(v4.Components.AvatarViewport)
local v8 = require(v1.Workspace.Packages.AvatarExperienceInspectAndBuy)
local v_u_9 = require(v1.Workspace.Packages.AvatarExperienceTimedOptions).PopoverFocusRestorationContext
local v_u_10 = v8.Hooks.useViewBreakpoints
local v_u_11 = v8.Components.ResponsivePanelLayout
local v_u_12 = v8.Hooks.useResponsivePanelLayoutProps
local v_u_13 = v8.Utils.applyTryOnItemToHumanoidDescription
local v_u_14 = v8.Hooks.useInspectAndBuyFocusNavigation
local v_u_15 = v8.Utils.buildBulkPurchaseAnalyticsPayload
local v_u_16 = require(v4.Actions.UpdateBulkPuchaseResults)
local v_u_17 = require(v4.Thunks.GetProductInfo)
local v_u_18 = require(v4.Thunks.GetFavoriteForAsset)
local v_u_19 = require(v4.Thunks.GetFavoriteForBundle)
local v_u_20 = require(v4.Thunks.CreateFavoriteForAsset)
local v_u_21 = require(v4.Thunks.DeleteFavoriteForAsset)
local v_u_22 = require(v4.Thunks.CreateFavoriteForBundle)
local v_u_23 = require(v4.Thunks.DeleteFavoriteForBundle)
local v_u_24 = require(v4.Thunks.PromptPurchase)
local v_u_25 = require(v4.Thunks.GetItemDetails)
local v26 = require(v1.Workspace.Packages.RoactUtils)
local v_u_27 = v26.Hooks.RoactRodux.useDispatch
local v_u_28 = v26.Hooks.RoactRodux.useSelector
local v_u_29 = require(v1.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local v_u_30 = require(v4.Actions.OpenOverlay)
local v_u_31 = require(v4.Enums.Overlay)
local v_u_32 = require(v4.Components.Overlay)
local v_u_33 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience
local v_u_34 = require(v1.Packages.Signals)
local v_u_35 = require(v1.Packages.SignalsReact).useSignalState
local v_u_36 = require(v1.Workspace.Packages.DataHydration.AvatarBackground)
local v_u_37 = require(v1.Packages.Foundation)
local v_u_38 = v_u_37.Hooks.useTokens
local v39 = v3.RobloxGui.Modules
local v_u_40 = require(v39.Settings.Theme)
local v_u_41 = require(v39.TopBar.Constants)
local v_u_42 = require(v1.Packages.tutils)
local v_u_43 = game:DefineFastFlag("EnableAvatarViewportAutoRotation", false)
local v_u_44 = game:DefineFastInt("AXViewportCameraFieldOfView", 68)
local v_u_45 = v6.FFlagAXEnableBatchItemDetailsFetchV2
local v_u_46 = v6.FFlagAXEnableInspectAndBuyFocusNavigation
local v_u_47 = v6.FFlagAXInspectAndBuyAvatarBackground
local v48 = v8.Contexts.ItemSelectionStoreContext
local v_u_49 = v48.Provider
local v_u_50 = v48.useItemSelectionStore
local function v_u_52(p51)
	return p51.assets
end
local function v_u_54(p53)
	return p53.collectibleResellableInstances
end
local function v_u_56(p55)
	return p55.bundles
end
local function v_u_61(p_u_57) -- name: useAvatarBackgroundImageUrl
	-- upvalues: (copy) v_u_5, (copy) v_u_36, (copy) v_u_34, (copy) v_u_35
	return v_u_35((v_u_5.useMemo(function()
		-- upvalues: (copy) p_u_57, (ref) v_u_36, (ref) v_u_34
		local v_u_58
		if p_u_57 == nil then
			v_u_58 = nil
		else
			v_u_58 = v_u_36.getAvatarBackgroundStore(false).getAndFetchAvatarBackground(p_u_57)
		end
		return v_u_34.createComputed(function(p59)
			-- upvalues: (copy) v_u_58, (ref) v_u_36
			local v60 = v_u_58
			if v60 then
				v60 = v_u_58.data(p59)
			end
			if v60 then
				v60 = v60.assetId
			end
			if v60 then
				return v_u_36.getAvatarBackgroundImageUrl(v60)
			else
				return nil
			end
		end)
	end, { p_u_57 })))
end
local function v_u_117(p_u_62) -- name: InspectAndBuyBaseContainer
	-- upvalues: (copy) v_u_10, (copy) v_u_41, (copy) v_u_38, (copy) v_u_27, (copy) v_u_50, (copy) v_u_35, (copy) v_u_28, (copy) v_u_52, (copy) v_u_42, (copy) v_u_54, (copy) v_u_56, (copy) v_u_47, (copy) v_u_61, (copy) v_u_5, (copy) v_u_2, (copy) v_u_16, (copy) v_u_29, (copy) v_u_15, (copy) v_u_25, (copy) v_u_18, (copy) v_u_17, (copy) v_u_45, (copy) v_u_19, (copy) v_u_21, (copy) v_u_20, (copy) v_u_23, (copy) v_u_22, (copy) v_u_30, (copy) v_u_31, (copy) v_u_24, (copy) v_u_13, (copy) v_u_7, (copy) v_u_43, (copy) v_u_44, (copy) v_u_12, (copy) v_u_33, (copy) v_u_46, (copy) v_u_14, (copy) v_u_37, (copy) v_u_40, (copy) v_u_11, (copy) v_u_32, (copy) v_u_9
	local v63 = v_u_10(v_u_41.TopBarHeight)
	local v64 = v_u_38()
	local v_u_65 = v_u_27()
	local v_u_66 = v_u_35(v_u_50().getItemDataMap)
	local v_u_67 = v_u_28(v_u_52, v_u_42.deepEqual)
	local v_u_68 = v_u_28(v_u_54, v_u_42.deepEqual)
	local v_u_69 = v_u_28(v_u_56, v_u_42.deepEqual)
	local v70
	if v_u_47 then
		v70 = v_u_61(p_u_62.playerId)
	else
		v70 = nil
	end
	local v95 = v_u_12({
		["onInspectMenuClosed"] = v_u_5.useCallback(function()
			-- upvalues: (ref) v_u_2
			v_u_2:CloseInspectMenu()
		end, {}),
		["onBulkPurchaseFinished"] = v_u_5.useCallback(function(_, _, p71)
			-- upvalues: (copy) v_u_65, (ref) v_u_16, (ref) v_u_29, (copy) v_u_66, (ref) v_u_15, (copy) v_u_67, (copy) v_u_69, (copy) v_u_68, (copy) p_u_62, (ref) v_u_25
			v_u_65(v_u_16(p71))
			for _, v72 in p71.Items do
				if v72.status ~= Enum.MarketplaceItemPurchaseStatus.Success then
					continue
				end
				local v73 = v72.type == Enum.MarketplaceProductType.AvatarAsset
				local v74 = v72.id
				local v75
				if v73 then
					v75 = Enum.AvatarItemType.Asset
				else
					v75 = Enum.AvatarItemType.Bundle
				end
				local v76
				if v73 then
					v76 = v_u_29.Asset
				else
					v76 = v_u_29.Bundle
				end
				local v77 = v_u_66[tostring(v74)]
				local v78 = v_u_15({
					["itemId"] = tostring(v74),
					["itemType"] = v76,
					["assetsMap"] = v_u_67,
					["bundlesMap"] = v_u_69,
					["collectibleResellableInstances"] = v_u_68,
					["storedData"] = v77
				})
				if v78 then
					p_u_62.analytics.reportPurchaseSuccessUnifiedEvent(v76, v74, v78)
				end
				v_u_65(v_u_25(v74, v75))
			end
		end, {
			v_u_65,
			v_u_67,
			v_u_69,
			v_u_68,
			v_u_66,
			p_u_62.analytics.reportPurchaseSuccessUnifiedEvent
		}),
		["onItemDetailsOpened"] = v_u_5.useCallback(function(p79)
			-- upvalues: (ref) v_u_29, (copy) v_u_65, (ref) v_u_18, (ref) v_u_17, (ref) v_u_45, (ref) v_u_25, (ref) v_u_19
			if p79.itemType == v_u_29.Asset then
				v_u_65(v_u_18(p79.id))
				v_u_65(v_u_17(p79.id))
				if v_u_45 then
					v_u_65(v_u_25(p79.id, Enum.AvatarItemType.Asset))
					return
				end
			elseif p79.itemType == v_u_29.Bundle then
				v_u_65(v_u_19(p79.id))
			end
		end, { v_u_65 }),
		["onToggleFavorite"] = v_u_5.useCallback(function(p80, p81)
			-- upvalues: (ref) v_u_29, (copy) v_u_65, (ref) v_u_21, (ref) v_u_20, (ref) v_u_23, (ref) v_u_22
			if p80.itemType == v_u_29.Asset then
				if p81 then
					v_u_65(v_u_21(p80.id))
				else
					v_u_65(v_u_20(p80.id))
				end
			else
				if p80.itemType == v_u_29.Bundle then
					if p81 then
						v_u_65(v_u_23(p80.id))
						return
					end
					v_u_65(v_u_22(p80.id))
				end
				return
			end
		end, { v_u_65 }),
		["openAttributionOverlay"] = v_u_5.useCallback(function(p82)
			-- upvalues: (copy) v_u_65, (ref) v_u_30, (ref) v_u_31
			v_u_65(v_u_30(v_u_31.AttributionTraversal, p82))
		end, { v_u_65 }),
		["onPromptPurchase"] = function(p83, p84, p85, p86, p87, p88, p89)
			-- upvalues: (copy) v_u_65, (ref) v_u_24
			v_u_65(v_u_24(p83, p84, p85, p86, p87, p88, p89))
		end,
		["renderTryOnViewport"] = v_u_5.useCallback(function(p90)
			-- upvalues: (copy) p_u_62, (ref) v_u_13, (ref) v_u_5, (ref) v_u_7, (ref) v_u_43, (ref) v_u_44
			if not (p_u_62.localPlayerModel and p_u_62.localPlayerModel.Humanoid) then
				return nil
			end
			local v91 = p_u_62.localPlayerModel.Humanoid.HumanoidDescription:Clone()
			v_u_13(p90, v91)
			local v92 = v_u_5.createElement
			local v93 = v_u_7
			local v94 = {
				["size"] = nil,
				["position"] = nil,
				["humanoidDescription"] = nil,
				["model"] = nil,
				["visible"] = true,
				["backgroundTransparency"] = 1,
				["disableAutoRotation"] = nil,
				["offsetOptions"] = nil,
				["cameraFieldOfView"] = nil,
				["resetCameraAndAutoRotationOnModelChange"] = true,
				["size"] = UDim2.new(1, 0, 1, 0),
				["position"] = UDim2.new(0.5, 0, 0.5, 0),
				["humanoidDescription"] = v91,
				["model"] = p_u_62.localPlayerModel,
				["disableAutoRotation"] = not v_u_43,
				["offsetOptions"] = {
					["defaultCameraOffset"] = CFrame.new(0, 0.5, -5),
					["toolOffset"] = CFrame.new(0, 2, -8)
				},
				["cameraFieldOfView"] = v_u_44
			}
			return v92(v93, v94)
		end, { p_u_62.localPlayerModel }),
		["localPlayerModel"] = p_u_62.localPlayerModel,
		["analytics"] = p_u_62.analytics,
		["avatarBackgroundImageUrl"] = v70
	})
	v_u_33()
	if not v_u_46 then
		local v96 = v_u_5.createElement
		local v97 = v_u_37.View
		local v98 = {
			["Size"] = v63.OverlaySize,
			["Position"] = v63.OverlayPosition,
			["backgroundStyle"] = v64.Color.Common.Shadow,
			["stateLayer"] = {
				["affordance"] = v_u_37.Enums.StateLayerAffordance.None
			},
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) v_u_2
				v_u_2:CloseInspectMenu()
			end
		}
		local v99 = {}
		local v100 = v_u_5.createElement
		local v101 = v_u_37.View
		local v102 = {
			["AnchorPoint"] = nil,
			["ClipsDescendants"] = true,
			["Size"] = nil,
			["Position"] = nil,
			["backgroundStyle"] = nil,
			["stateLayer"] = nil,
			["onActivated"] = nil,
			["AnchorPoint"] = v63.ContainerAnchorPoint,
			["Size"] = v63.ContainerSize,
			["Position"] = v63.ContainerPosition,
			["backgroundStyle"] = {
				["Color3"] = v_u_40.color("MenuContainer"),
				["Transparency"] = v_u_40.transparency("MenuContainer", 1) * v_u_2.PreferredTransparency
			},
			["stateLayer"] = {
				["affordance"] = v_u_37.Enums.StateLayerAffordance.None
			},
			["onActivated"] = function() -- name: onActivated end
		}
		local v103 = {
			["UICorner"] = v_u_5.createElement("UICorner", {
				["CornerRadius"] = v_u_40.DefaultCornerRadius
			}),
			["ResponsivePanelLayout"] = v_u_5.createElement(v_u_11, v95)
		}
		v99.ContainerView = v100(v101, v102, v103)
		v99.Overlay = v_u_5.createElement(v_u_32)
		return v96(v97, v98, v99)
	end
	local v104 = v_u_14()
	local v105 = v_u_5.createElement
	local v106 = {
		["ref"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["SelectionGroup"] = nil,
		["SelectionBehaviorDown"] = nil,
		["SelectionBehaviorLeft"] = nil,
		["SelectionBehaviorRight"] = nil,
		["SelectionBehaviorUp"] = nil,
		["ref"] = v104.setFocusRef,
		["Size"] = UDim2.fromScale(1, 1),
		["SelectionGroup"] = v104.focusNavigationProps.SelectionGroup,
		["SelectionBehaviorDown"] = v104.focusNavigationProps.SelectionBehaviorDown,
		["SelectionBehaviorLeft"] = v104.focusNavigationProps.SelectionBehaviorLeft,
		["SelectionBehaviorRight"] = v104.focusNavigationProps.SelectionBehaviorRight,
		["SelectionBehaviorUp"] = v104.focusNavigationProps.SelectionBehaviorUp
	}
	local v107 = {}
	local v108 = v_u_5.createElement
	local v109 = v_u_37.View
	local v110 = {
		["Size"] = v63.OverlaySize,
		["Position"] = v63.OverlayPosition,
		["backgroundStyle"] = v64.Color.Common.Shadow,
		["stateLayer"] = {
			["affordance"] = v_u_37.Enums.StateLayerAffordance.None
		},
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (ref) v_u_2
			v_u_2:CloseInspectMenu()
		end
	}
	local v111 = {}
	local v112 = v_u_5.createElement
	local v113 = v_u_37.View
	local v114 = {
		["AnchorPoint"] = nil,
		["ClipsDescendants"] = true,
		["Size"] = nil,
		["Position"] = nil,
		["backgroundStyle"] = nil,
		["stateLayer"] = nil,
		["onActivated"] = nil,
		["AnchorPoint"] = v63.ContainerAnchorPoint,
		["Size"] = v63.ContainerSize,
		["Position"] = v63.ContainerPosition,
		["backgroundStyle"] = {
			["Color3"] = v_u_40.color("MenuContainer"),
			["Transparency"] = v_u_40.transparency("MenuContainer", 1) * v_u_2.PreferredTransparency
		},
		["stateLayer"] = {
			["affordance"] = v_u_37.Enums.StateLayerAffordance.None
		},
		["onActivated"] = function() -- name: onActivated end
	}
	local v115 = {
		["UICorner"] = v_u_5.createElement("UICorner", {
			["CornerRadius"] = v_u_40.DefaultCornerRadius
		}),
		["ResponsivePanelLayout"] = v_u_5.createElement(v_u_11, v95)
	}
	v111.ContainerView = v112(v113, v114, v115)
	v111.Overlay = v_u_5.createElement(v_u_32)
	v107.Content = v108(v109, v110, v111)
	local v116 = {
		["InspectAndBuyContent"] = v105("Frame", v106, v107)
	}
	return v_u_5.createElement(v_u_9.Provider, {
		["value"] = true
	}, v116)
end
return function(p118) -- name: InspectAndBuyBaseContainerWithSignalsProvider
	-- upvalues: (copy) v_u_5, (copy) v_u_49, (copy) v_u_117
	return v_u_5.createElement(v_u_49, {}, {
		["Inner"] = v_u_5.createElement(v_u_117, p118)
	})
end