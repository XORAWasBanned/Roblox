-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.DetailsThumbnail
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.UIBlox).App.ImageSet.Images
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Components.LimitedLabel)
local v_u_5 = require(v3.Constants)
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.RoactRodux)
local v_u_8 = require(v3.UtilityFunctions)
local v_u_9 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_10 = require(v3.Components.InspectAndBuyContext)
local v_u_11 = require(v3.Flags.GetFFlagDisplayCollectiblesIcon)
local v_u_12 = require(v3.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local v_u_13 = game:DefineFastFlag("FixBundleThumbnailOnDetailPage", false)
local v14 = v_u_6.PureComponent:extend("DetailsThumbnail")
function v14.getUrl(p15) -- name: getUrl
	-- upvalues: (copy) v_u_8, (copy) v_u_13
	local v16 = p15.props.assetInfo
	local v17 = p15.props.detailsInformation
	local v18 = p15.props.bundles
	local v19 = v_u_8.getBundleId(v16)
	if (v16 and v16.parentBundleId ~= nil and true or false) and (v18[v19] and v18[v19].costumeId) then
		if v_u_13 then
			return "rbxthumb://type=BundleThumbnail&id=" .. tostring(v19) .. "&w=420&h=420"
		else
			return "rbxthumb://type=Outfit&id=" .. v18[v19].costumeId .. "&w=420&h=420"
		end
	else
		return "rbxthumb://type=Asset&id=" .. v17.assetId .. "&w=420&h=420"
	end
end
function v14.render(p_u_20) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_10, (copy) v_u_11, (copy) v_u_8, (copy) v_u_12, (copy) v_u_5, (copy) v_u_9, (copy) v_u_4
	local v_u_21 = p_u_20.props.view
	local v_u_22 = p_u_20.props.detailsInformation
	local v_u_23 = p_u_20.props.tryingOnInfo
	local v_u_24 = p_u_20.props.locale
	local v_u_25 = p_u_20.props.assetInfo
	local v26 = v_u_2["icons/status/item/limited"]
	local v_u_27 = v26 and v26.ImageRectSize / v_u_2.ImagesResolutionScale or Vector2.new(0, 0)
	local v44 = {
		["render"] = function(p28) -- name: render
			-- upvalues: (copy) v_u_21, (ref) v_u_11, (ref) v_u_8, (copy) v_u_25, (ref) v_u_12, (ref) v_u_5, (copy) v_u_27, (ref) v_u_9, (copy) v_u_24, (ref) v_u_6, (copy) v_u_23, (copy) v_u_22, (copy) p_u_20, (ref) v_u_4
			local v29 = p28[v_u_21]
			local v30 = v_u_11()
			if v30 then
				v30 = v_u_8.isCollectibles(v_u_25)
			end
			local v31, v32, v33
			if v_u_12() and v_u_25 then
				v31 = v_u_8.hasLimitedQuantity(v_u_25)
				local v34 = v_u_8.isLimited1Point0_LimitedUnique(v_u_25) or v_u_8.isLimited2Point0_Or_LimitedCollectible(v_u_25)
				local v35
				if v34 then
					v35 = v_u_5.LimitedIconFrameSizeXOffset * 2
				else
					v35 = v_u_5.LimitedIconFrameSizeXOffset
				end
				v32 = UDim2.new(0, v_u_27.X + v35, 0, v_u_27.Y + v_u_5.LimitedIconFrameSizeYOffset)
				if v34 then
					v33 = "#" .. "    " .. v_u_9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", v_u_24)
				else
					v33 = "    " .. v_u_9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", v_u_24)
				end
			else
				v31 = nil
				v32 = nil
				v33 = nil
			end
			local v36 = v_u_6.createElement
			local v37 = "Frame"
			local v38 = {
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 2,
				["Visible"] = nil,
				["Position"] = v29.DetailsThumbnailFramePosition,
				["Size"] = UDim2.new(1, 0, 0, v_u_11() and v_u_5.DetailsThumbnailFrameHeight or 300),
				["Visible"] = not v_u_23.tryingOn
			}
			local v39 = {}
			local v40 = v_u_22.viewingDetails
			if v40 then
				v40 = v_u_6.createElement("ImageLabel", {
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["Position"] = v29.DetailsThumbnailPosition,
					["AnchorPoint"] = v29.DetailsThumbnailAnchorPoint,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Image"] = p_u_20:getUrl()
				}, {
					["AspectRatioConstraint"] = v_u_6.createElement("UIAspectRatioConstraint", {
						["AspectRatio"] = 1,
						["AspectType"] = nil,
						["DominantAxis"] = nil,
						["AspectType"] = Enum.AspectType.FitWithinMaxSize,
						["DominantAxis"] = v29.DetailsThumbnailARDominantAxis
					})
				})
			end
			v39.Thumbnail = v40
			if v_u_12() then
				v30 = v31
			end
			if v30 then
				local v41 = v_u_6.createElement
				local v42 = v_u_4
				local v43 = {}
				if not v_u_12() then
					v32 = UDim2.new(0, v_u_27.X + 18, 0, v_u_27.Y + 6)
				end
				v43.frameSize = v32
				v43.framePosition = UDim2.new(0, 0, 0, v_u_5.DetailsThumbnailFrameHeight - v_u_27.Y - 8)
				v43.imageSize = UDim2.new(0, v_u_27.X, 0, v_u_27.Y)
				v43.imagePosition = UDim2.new(0, 4, 0, 3)
				v43.textSize = UDim2.new(0, 4 + v_u_27.X, 0, v_u_27.Y)
				v43.textPosition = UDim2.new(0, 5 + v_u_27.X, 0, 3)
				if not v_u_12() then
					v33 = "#" .. "    " .. v_u_9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", v_u_24)
				end
				v43.text = v33
				v30 = v41(v42, v43)
			end
			v39.LimitedLabel = v30
			return v36(v37, v38, v39)
		end
	}
	return v_u_6.createElement(v_u_10.Consumer, v44)
end
return v7.UNSTABLE_connect2(function(p45, _)
	local v46 = p45.detailsInformation.assetId
	return {
		["view"] = p45.view,
		["tryingOnInfo"] = p45.tryingOnInfo,
		["detailsInformation"] = p45.detailsInformation,
		["assetInfo"] = p45.assets[v46],
		["locale"] = p45.locale,
		["bundles"] = p45.bundles
	}
end)(v14)