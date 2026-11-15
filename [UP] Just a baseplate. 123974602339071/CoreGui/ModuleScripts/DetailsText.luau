-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.DetailsText
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Packages.Cryo)
local v6 = require(v1.Packages.UIBlox)
local v_u_7 = require(v1.Workspace.Packages.Style).AppFonts
local v8 = v6.App.ImageSet.Images
local v_u_9 = v6.App.Constant.IconSize
local v_u_10 = require(v2.Components.Notification)
local v_u_11 = require(v2.Components.Favorites)
local v_u_12 = require(v2.UtilityFunctions)
local v_u_13 = require(v2.Colors)
local v_u_14 = require(v2.Constants)
local v_u_15 = require(v2.getSelectionImageObjectRegular)
local v_u_16 = require(v2.Components.InspectAndBuyContext)
local v_u_17 = v8["icons/status/premium"]
local v18 = v_u_3.PureComponent:extend("DetailsText")
function v18.init(p19) -- name: init
	-- upvalues: (copy) v_u_15
	p19.name = ""
	p19.creator = ""
	p19.selectedImage = v_u_15()
end
function v18.setText(p20) -- name: setText
	-- upvalues: (copy) v_u_12
	local v21 = p20.props.assetInfo or {}
	local v22 = v21.parentBundleId ~= nil
	local v23 = p20.props.bundleInfo or {}
	if v22 then
		local v24 = v_u_12.getBundleId(v21)
		if v23[v24] then
			p20.name = v23[v24].name or ""
			p20.creator = v23[v24].creatorName or ""
			return
		end
	elseif v21 then
		p20.name = v21.name or ""
		p20.creator = v21.creatorName or ""
	end
end
function v18.render(p_u_25) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_14, (copy) v_u_12, (copy) v_u_3, (copy) v_u_16, (copy) v_u_10, (copy) v_u_5, (copy) v_u_17, (copy) v_u_7, (copy) v_u_13, (copy) v_u_11
	p_u_25:setText()
	local v_u_26 = p_u_25.props.view
	local v_u_27 = p_u_25.props.showFavoritesCount
	local v28 = p_u_25.props.assetInfo or {}
	local v29 = v28.parentBundleId ~= nil
	local v30 = p_u_25.props.assetBundles[v28.assetId]
	local v31
	if v29 then
		v31 = #v30 > 1
	else
		v31 = v29
	end
	local v_u_32 = v28.premiumPricing ~= nil
	local v_u_33 = v_u_32 and v_u_9.Regular + 5 or 0
	local v34 = v_u_14.LayeredAssetTypes[v28.assetTypeId] ~= nil and p_u_25.props.localPlayerModel
	if v34 then
		v34 = p_u_25.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6
	end
	local v35 = v_u_12.isLimited1Point0(v28)
	local v_u_36 = nil
	if v31 then
		v_u_36 = v_u_14.NotificationKeys.MultipleBundleNoticeKey
	elseif v29 then
		v_u_36 = v_u_14.NotificationKeys.SingleBundleNoticeKey
	elseif v35 then
		v_u_36 = v_u_14.NotificationKeys.LimitedItemNoticeKey
	elseif v34 then
		v_u_36 = v_u_14.NotificationKeys.LayeredClothingOnR6Key
	end
	local v51 = {
		["render"] = function(p37) -- name: render
			-- upvalues: (copy) v_u_26, (ref) v_u_3, (ref) v_u_36, (ref) v_u_10, (copy) v_u_32, (ref) v_u_5, (ref) v_u_17, (ref) v_u_9, (copy) v_u_33, (copy) p_u_25, (ref) v_u_7, (ref) v_u_13, (copy) v_u_27, (ref) v_u_11
			local v38 = p37[v_u_26]
			local v39 = v_u_3.createElement
			local v40 = "Frame"
			local v41 = {
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Position"] = v38.DetailsFramePosition,
				["Size"] = UDim2.new(1, 0, 0, 131)
			}
			local v42 = {
				["Layout"] = v_u_3.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
					["VerticalAlignment"] = Enum.VerticalAlignment.Top,
					["FillDirection"] = Enum.FillDirection.Vertical
				})
			}
			local v43 = v_u_36
			if v43 then
				local v44 = {
					["noticeKey"] = v_u_36
				}
				v43 = v_u_3.createElement(v_u_10, v44)
			end
			v42.Notification = v43
			local v45 = v_u_3.createElement
			local v46 = "Frame"
			local v47 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, -10, 0, 50)
			}
			local v48 = {}
			local v49
			if v_u_32 then
				v49 = v_u_3.createElement("ImageLabel", v_u_5.Dictionary.join(v_u_17, {
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["ImageColor3"] = nil,
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["Position"] = UDim2.new(0, 0, 0.5, 0),
					["Size"] = UDim2.new(0, v_u_9.Regular, 0, v_u_9.Regular),
					["ImageColor3"] = Color3.new(1, 1, 1)
				})) or nil
			else
				v49 = nil
			end
			v48.PremiumIcon = v49
			v48.PlayerName = v_u_3.createElement("TextLabel", {
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["Size"] = nil,
				["LayoutOrder"] = 1,
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["TextScaled"] = true,
				["TextSize"] = 20,
				["Font"] = nil,
				["TextColor3"] = nil,
				["Position"] = UDim2.new(0, v_u_33, 0, 0),
				["Size"] = UDim2.new(1, v_u_33, 0, 50),
				["Text"] = p_u_25.name or "",
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextYAlignment"] = Enum.TextYAlignment.Center,
				["Font"] = v_u_7.default:getBold(),
				["TextColor3"] = v_u_13.White
			}, {
				["UITextSizeConstraint"] = v_u_3.createElement("UITextSizeConstraint", {
					["MaxTextSize"] = 32
				})
			})
			v42.AssetName = v45(v46, v47, v48) or v_u_3.createElement("TextLabel", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["LayoutOrder"] = 1,
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["TextScaled"] = true,
				["TextSize"] = 20,
				["Font"] = nil,
				["TextColor3"] = nil,
				["Size"] = UDim2.new(1, -10, 0, 50),
				["Text"] = p_u_25.name or "",
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextYAlignment"] = Enum.TextYAlignment.Center,
				["Font"] = v_u_7.default:getBold(),
				["TextColor3"] = v_u_13.White
			}, {
				["UITextSizeConstraint"] = v_u_3.createElement("UITextSizeConstraint", {
					["MaxTextSize"] = 32
				})
			})
			local v50 = v_u_27
			if v50 then
				v50 = v_u_3.createElement(v_u_11)
			end
			v42.FavoriteContainer = v50
			return v39(v40, v41, v42)
		end
	}
	return v_u_3.createElement(v_u_16.Consumer, v51)
end
return v4.connect(function(p52, _)
	local v53 = p52.detailsInformation.assetId
	return {
		["view"] = p52.view,
		["locale"] = p52.locale,
		["assetInfo"] = p52.assets[v53],
		["bundleInfo"] = p52.bundles,
		["assetBundles"] = p52.assetBundles,
		["showFavoritesCount"] = not p52.isSubjectToChinaPolicies
	}
end)(v18)