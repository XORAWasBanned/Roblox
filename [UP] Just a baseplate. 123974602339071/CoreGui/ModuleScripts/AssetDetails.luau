-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.AssetDetails
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("Players")
local v4 = script.Parent.Parent
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v_u_7 = require(v1.Workspace.Packages.Style).AppFonts
local v_u_8 = require(v4.Components.DetailsText)
local v_u_9 = require(v4.Components.DetailsThumbnail)
local v_u_10 = require(v4.Components.DetailsDescription)
local v_u_11 = require(v4.Components.DetailsButtons)
local v_u_12 = require(v4.Components.TryOnViewport)
local v_u_13 = require(v4.Actions.OpenOverlay)
local v_u_14 = require(v4.Enums.Overlay)
local v_u_15 = require(v4.Thunks.GetAssetBundles)
local v_u_16 = require(v4.Thunks.ReportOpenDetailsPage)
local v_u_17 = require(v4.Thunks.GetEconomyProductInfo)
local v_u_18 = require(v4.Thunks.GetCollectibleResellableInstances)
local v_u_19 = require(v4.Colors)
local v_u_20 = require(v4.Constants)
local v_u_21 = require(v4.UtilityFunctions)
local v_u_22 = require(v1.Packages.tutils)
local v_u_23 = require(v1.Workspace.Packages.RobloxTranslator)
local v24 = require(v1.Packages.UIBlox)
local v_u_25 = v24.App.ImageSet.Images
local v_u_26 = v24.Core.ImageSet.ImageSetLabel
local v_u_27 = require(v1.Workspace.Packages.ItemDetails).ItemInfoList
local v_u_28 = require(v4.AttributionConstants)
local v_u_29 = require(v4.Components.InspectAndBuyContext)
local v_u_30 = require(v4.Flags.GetFFlagDisplayCollectiblesIcon)
local v_u_31 = require(v4.Thunks.GetItemDetails)
local v_u_32 = require(v4.Actions.SetAssetFromBundleInfo)
local v33 = v2.RobloxGui.Modules
local v_u_34 = require(v33.Settings.Theme)
local v_u_35 = require(v2.RobloxGui.Modules.InGameMenuConstants).ControllerBarHeight
local v_u_36 = require(v1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v37 = v_u_5.PureComponent:extend("AssetDetails")
function v37.setScrollingEnabled(p38, p39) -- name: setScrollingEnabled
	if p38.state.scrollingEnabled ~= p39 then
		p38:setState({
			["scrollingEnabled"] = p39
		})
	end
end
function v37.getInfoRowProps(p_u_40) -- name: getInfoRowProps
	-- upvalues: (copy) v_u_23, (copy) v_u_28, (copy) v_u_14, (copy) v_u_5, (copy) v_u_20
	local v41 = p_u_40.props.assetInfo or {}
	local v42 = p_u_40.props.locale
	local v43 = v41.parentBundleId ~= nil
	local v44 = {
		["infoName"] = nil,
		["infoData"] = nil,
		["hasVerifiedBadge"] = nil,
		["LayoutOrder"] = 1,
		["Selectable"] = false,
		["infoName"] = v_u_23:FormatByKeyForLocale("Feature.Catalog.Label.Filter.Creator", v42),
		["infoData"] = v41.creatorName or "",
		["hasVerifiedBadge"] = v41.creatorHasVerifiedBadge
	}
	local v45 = nil
	local v46 = v41.creatingUniverseId
	if v46 then
		local v_u_47 = p_u_40.props.creatingExperiences[v46]
		if v_u_47 then
			local v48 = v_u_47.playabilityStatus
			if v_u_28.ShowPlayableAttributionMapper[v48] then
				local v49 = v_u_47.name or ""
				v45 = {
					["infoName"] = v_u_23:FormatByKeyForLocale("Feature.Catalog.Label.Attribution", v42),
					["infoData"] = v49,
					["onActivate"] = function() -- name: onActivate
						-- upvalues: (copy) p_u_40, (ref) v_u_14, (copy) v_u_47
						p_u_40.props.openOverlay(v_u_14.AttributionTraversal, v_u_47)
					end,
					["LayoutOrder"] = 2,
					[v_u_5.Ref] = p_u_40.attributionRef,
					["Selectable"] = true
				}
			end
		end
	end
	local v50 = nil
	if v43 then
		v50 = v_u_23:FormatByKeyForLocale("Feature.Catalog.Label.Bundle", v42)
	else
		local v51 = v_u_20.AssetTypeIdToCategory[v41.assetTypeId]
		local v52 = v_u_20.AssetCategoriesLocalized[v51]
		local v53 = v_u_20.AssetTypeIdToTypeLocalized[v41.assetTypeId]
		if v52 and v53 then
			v50 = v_u_23:FormatByKeyForLocale(v52, v42) .. " | " .. v_u_23:FormatByKeyForLocale(v53, v42)
		end
	end
	return {
		v44,
		v45,
		{
			["infoName"] = nil,
			["infoData"] = nil,
			["LayoutOrder"] = 3,
			["Selectable"] = false,
			["infoName"] = v_u_23:FormatByKeyForLocale("Feature.Catalog.Label.CategoryType", v42),
			["infoData"] = v50
		}
	}
end
function v37.init(p54) -- name: init
	-- upvalues: (copy) v_u_5
	p54.state = {
		["scrollingEnabled"] = true
	}
	p54.attributionRef = v_u_5.createRef()
end
function v37.willUpdate(p55, p56) -- name: willUpdate
	-- upvalues: (copy) v_u_21, (copy) v_u_22
	if v_u_21.isCollectibles(p55.props.assetInfo) then
		local v57 = p55.props.assetInfo.collectibleItemId
		local v58 = p55.props.resellableInstances
		local v59 = p56.resellableInstances
		local v60 = v58 and v58[v57]
		if v60 then
			if v59 then
				v60 = v59[v57]
			else
				v60 = v59
			end
		end
		if v60 and v_u_22.fieldCount(v58[v57]) ~= v_u_22.fieldCount(v59[v57]) then
			p55:setState({})
		end
	end
	local v61 = p55.props.assetInfo
	if v61 then
		v61 = p55.props.assetInfo.parentBundleId
	end
	local v62 = p55.props.bundles
	local v63 = p56.bundles
	if v61 and (v62 and (v62[v61] and (v63 and (v63[v61] and v63[v61] ~= v62[v61])))) then
		p55.props.setAssetFromBundleInfo(p55.props.assetInfo.assetId, v63[v61])
	end
end
function v37.didUpdate(p64, p65) -- name: didUpdate
	-- upvalues: (copy) v_u_21
	local v66 = p64.props.reportOpenDetailsPage
	local v67 = p64.props.assetInfo
	local v68 = p65.assetInfo
	local v69
	if v67 then
		v69 = v67 ~= v68
	else
		v69 = v67
	end
	if v69 then
		local v70 = p64.props.bundles
		local v71 = v67.parentBundleId ~= nil
		local v72
		if v71 then
			v72 = v_u_21.getBundleId(v67)
		else
			v72 = v71
		end
		if not v71 and v67.owned == nil or v71 and v70[v72].owned == nil then
			local v73 = v67.assetId
			local v74 = Enum.AvatarItemType.Asset
			if v71 then
				v74 = Enum.AvatarItemType.Bundle
			else
				v72 = v73
			end
			p64.props.getItemDetails(v72, v74)
		end
	end
	local v75 = p64.props.detailsInformation.viewingDetails
	if v75 then
		v75 = not p65.detailsInformation.viewingDetails
	end
	if v75 then
		v66(v67)
	end
end
function v37.render(p_u_76) -- name: render
	-- upvalues: (copy) v_u_25, (copy) v_u_5, (copy) v_u_29, (copy) v_u_30, (copy) v_u_21, (copy) v_u_3, (copy) v_u_22, (copy) v_u_35, (copy) v_u_34, (copy) v_u_19, (copy) v_u_11, (copy) v_u_9, (copy) v_u_36, (copy) v_u_12, (copy) v_u_8, (copy) v_u_26, (copy) v_u_23, (copy) v_u_7, (copy) v_u_10, (copy) v_u_27
	local v_u_77 = p_u_76.props.view
	local v_u_78 = p_u_76.props.detailsInformation
	local v_u_79 = p_u_76.props.assetInfo or {}
	local v_u_80 = p_u_76.props.localPlayerModel
	local v_u_81 = p_u_76.state.scrollingEnabled
	local v_u_82 = p_u_76.props.locale
	local v_u_83 = v_u_25["icons/status/item/owned"]
	local v_u_84 = v_u_83 and v_u_83.ImageRectSize / v_u_25.ImagesResolutionScale or Vector2.new(0, 0)
	local v110 = {
		["render"] = function(p85) -- name: render
			-- upvalues: (copy) v_u_77, (ref) v_u_30, (ref) v_u_21, (copy) v_u_79, (copy) p_u_76, (ref) v_u_3, (ref) v_u_22, (ref) v_u_35, (ref) v_u_34, (ref) v_u_5, (ref) v_u_19, (copy) v_u_78, (ref) v_u_11, (copy) v_u_80, (copy) v_u_81, (ref) v_u_9, (ref) v_u_36, (ref) v_u_12, (ref) v_u_8, (copy) v_u_84, (ref) v_u_26, (copy) v_u_83, (ref) v_u_23, (copy) v_u_82, (ref) v_u_7, (ref) v_u_10, (ref) v_u_27
			local v86 = p85[v_u_77]
			local v87 = 0
			local v88 = v_u_30()
			if v88 then
				v88 = v_u_21.isCollectibles(v_u_79)
			end
			local v89
			if v88 then
				local v90 = p_u_76.props.getCollectibleResellableInstances
				local v91 = p_u_76.props.resellableInstances
				local v92 = v_u_3.LocalPlayer
				if v92 then
					v92 = v_u_3.LocalPlayer.UserId
				end
				v90(v_u_79.collectibleItemId, v92)
				v89 = v91 and (v91[v_u_79.collectibleItemId] and v_u_22.fieldCount(v91[v_u_79.collectibleItemId])) or 0
			else
				v89 = 0
			end
			local v93 = v_u_21.isLimited2Point0_Or_LimitedCollectible(v_u_79)
			if p_u_76.props.gamepadEnabled then
				v87 = -1 * v_u_35
			end
			local v94 = v87 + -v_u_34.DefaultCornerRadius.Offset
			local v95 = v_u_5.createElement
			local v96 = "Frame"
			local v97 = {
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 0,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Visible"] = nil,
				["Position"] = UDim2.new(0, v86.BorderPaddingSize, 0, 0),
				["Size"] = UDim2.new(1, -(2 * v86.BorderPaddingSize), 1, v94),
				["BackgroundColor3"] = v_u_19.Carbon,
				["Visible"] = v_u_78.viewingDetails
			}
			local v98 = {}
			local v99 = {
				["localPlayerModel"] = v_u_80
			}
			v98.DetailsButtons = v_u_5.createElement(v_u_11, v99)
			local v100 = v_u_5.createElement
			local v101 = "ScrollingFrame"
			local v102 = {
				["BackgroundTransparency"] = 1,
				["ScrollBarThickness"] = 0,
				["Size"] = nil,
				["ScrollingEnabled"] = nil,
				["Selectable"] = false,
				["CanvasSize"] = nil,
				["AutomaticCanvasSize"] = nil,
				["Size"] = UDim2.new(1, 0, 1, -55),
				["ScrollingEnabled"] = v_u_81,
				["CanvasSize"] = UDim2.new(1, 0, 0, 0),
				["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
			}
			local v103 = {
				["UIListLayout"] = v_u_5.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["Padding"] = UDim.new(0, 10)
				}),
				["DetailsThumbnail"] = v_u_5.createElement(v_u_9)
			}
			local v104
			if v_u_36 then
				if v_u_78.viewingDetails and v_u_80 then
					local v106 = {
						["localPlayerModel"] = v_u_80,
						["setScrollingEnabled"] = function(p105) -- name: setScrollingEnabled
							-- upvalues: (ref) p_u_76
							p_u_76:setScrollingEnabled(p105)
						end
					}
					v104 = v_u_5.createElement(v_u_12, v106)
				else
					v104 = nil
				end
			else
				v104 = v_u_80
				if v104 then
					local v108 = {
						["localPlayerModel"] = v_u_80,
						["setScrollingEnabled"] = function(p107) -- name: setScrollingEnabled
							-- upvalues: (ref) p_u_76
							p_u_76:setScrollingEnabled(p107)
						end
					}
					v104 = v_u_5.createElement(v_u_12, v108)
				end
			end
			v103.TryOnViewport = v104
			local v109 = {
				["localPlayerModel"] = v_u_80
			}
			v103.DetailsText = v_u_5.createElement(v_u_8, v109)
			if v93 then
				v93 = v_u_5.createElement("Frame", {
					["Size"] = nil,
					["BorderSizePixel"] = 0,
					["LayoutOrder"] = 3,
					["BackgroundColor3"] = nil,
					["Size"] = UDim2.new(1, 0, 0, v_u_84.Y + 20),
					["BackgroundColor3"] = Color3.fromRGB(57, 59, 61)
				}, {
					["Corner"] = v_u_5.createElement("UICorner", {
						["CornerRadius"] = UDim.new(0, 8)
					}),
					["OwnedIcon"] = v_u_5.createElement(v_u_26, {
						["Size"] = nil,
						["Position"] = nil,
						["Image"] = nil,
						["BackgroundTransparency"] = 1,
						["BorderSizePixel"] = 0,
						["Size"] = UDim2.new(0, v_u_84.X, 0, v_u_84.Y),
						["Position"] = UDim2.new(0, 12, 0, 10),
						["Image"] = v_u_83
					}),
					["ItemOwnedLabel"] = v_u_5.createElement("TextLabel", {
						["Size"] = nil,
						["Position"] = nil,
						["Text"] = nil,
						["Font"] = nil,
						["TextSize"] = 12,
						["TextColor3"] = nil,
						["BackgroundTransparency"] = 1,
						["Size"] = UDim2.new(0, v_u_84.X, 0, v_u_84.Y),
						["Position"] = UDim2.new(0, v_u_84.X + 60, 0, 10),
						["Text"] = v_u_23:FormatByKeyForLocale("InGame.InspectMenu.Label.OwnedItems", v_u_82, {
							["QUANTITY"] = tostring(v89)
						}),
						["Font"] = v_u_7.default:getDefault(),
						["TextColor3"] = Color3.new(1, 1, 1)
					})
				})
			end
			v103.ItemOwnedLabelContainer = v93
			v103.DetailsDescription = v_u_5.createElement(v_u_10)
			v103.ItemInfoList = v_u_5.createElement(v_u_27, {
				["rowData"] = nil,
				["LayoutOrder"] = 5,
				["rowData"] = p_u_76:getInfoRowProps()
			})
			v98.Container = v100(v101, v102, v103)
			return v95(v96, v97, v98)
		end
	}
	return v_u_5.createElement(v_u_29.Consumer, v110)
end
return v6.UNSTABLE_connect2(function(p111, _)
	local v112 = p111.detailsInformation.assetId
	return {
		["view"] = p111.view,
		["detailsInformation"] = p111.detailsInformation,
		["assetInfo"] = p111.assets[v112],
		["bundles"] = p111.bundles,
		["gamepadEnabled"] = p111.gamepadEnabled,
		["locale"] = p111.locale,
		["resellableInstances"] = p111.collectibleResellableInstances,
		["creatingExperiences"] = p111.creatingExperiences
	}
end, function(p_u_113)
	-- upvalues: (copy) v_u_15, (copy) v_u_17, (copy) v_u_16, (copy) v_u_18, (copy) v_u_13, (copy) v_u_31, (copy) v_u_32
	return {
		["getAssetBundles"] = function(p114) -- name: getAssetBundles
			-- upvalues: (copy) p_u_113, (ref) v_u_15
			p_u_113(v_u_15(p114))
		end,
		["getEconomyProductInfo"] = function(p115, p116, p117) -- name: getEconomyProductInfo
			-- upvalues: (copy) p_u_113, (ref) v_u_17
			p_u_113(v_u_17(p115, p116, p117))
		end,
		["reportOpenDetailsPage"] = function(p118) -- name: reportOpenDetailsPage
			-- upvalues: (copy) p_u_113, (ref) v_u_16
			p_u_113(v_u_16(p118))
		end,
		["getCollectibleResellableInstances"] = function(p119, p120) -- name: getCollectibleResellableInstances
			-- upvalues: (copy) p_u_113, (ref) v_u_18
			p_u_113(v_u_18(p119, p120))
		end,
		["openOverlay"] = function(p121, p122) -- name: openOverlay
			-- upvalues: (copy) p_u_113, (ref) v_u_13
			p_u_113(v_u_13(p121, p122))
		end,
		["getItemDetails"] = function(p123, p124) -- name: getItemDetails
			-- upvalues: (copy) p_u_113, (ref) v_u_31
			p_u_113(v_u_31(p123, p124))
		end,
		["setAssetFromBundleInfo"] = function(p125, p126) -- name: setAssetFromBundleInfo
			-- upvalues: (copy) p_u_113, (ref) v_u_32
			p_u_113(v_u_32(p125, p126))
		end
	}
end)(v37)