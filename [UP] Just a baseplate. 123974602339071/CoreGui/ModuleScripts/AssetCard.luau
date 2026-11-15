-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.AssetCard
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v_u_3 = require(v1.Packages.UIBlox).App.ImageSet.Images
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = require(v1.Workspace.Packages.Style).AppFonts
local v_u_7 = require(v2.Colors)
local v_u_8 = require(v2.Constants)
local v_u_9 = require(v2.Actions.SetDetailsInformation)
local v_u_10 = require(v2.getSelectionImageObjectRegular)
local v_u_11 = require(v2.Components.InspectAndBuyContext)
local v_u_12 = require(v2.Components.LimitedLabel)
local v_u_13 = require(v2.UtilityFunctions)
local v_u_14 = require(v2.Flags.GetFFlagDisplayCollectiblesIcon)
local v_u_15 = require(v2.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local v16 = v_u_4.Component:extend("AssetCard")
function v16.init(p17) -- name: init
	-- upvalues: (copy) v_u_10
	p17.selectedImage = v_u_10()
end
function v16.render(p_u_18) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_11, (copy) v_u_14, (copy) v_u_13, (copy) v_u_15, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_12
	local v_u_19 = p_u_18.props.view
	local v_u_20 = p_u_18.props.equipped
	local v_u_21 = p_u_18.props.assetInfo
	local v_u_22 = p_u_18.props.openDetails
	local v_u_23 = p_u_18.props.assetCardSizeX
	local v24 = v_u_3["icons/status/item/limited"]
	local v_u_25 = v24 and v24.ImageRectSize / v_u_3.ImagesResolutionScale or Vector2.new(0, 0)
	local v40 = {
		["render"] = function(p26) -- name: render
			-- upvalues: (copy) v_u_19, (ref) v_u_14, (ref) v_u_13, (copy) v_u_21, (ref) v_u_15, (ref) v_u_8, (copy) v_u_25, (ref) v_u_4, (ref) v_u_7, (copy) p_u_18, (copy) v_u_22, (copy) v_u_23, (ref) v_u_6, (copy) v_u_20, (ref) v_u_12
			local v27 = p26[v_u_19]
			local v28 = v_u_14()
			if v28 then
				v28 = v_u_13.isCollectibles(v_u_21)
			end
			local v29, v30, v31
			if v_u_15() then
				v29 = v_u_13.hasLimitedQuantity(v_u_21)
				v30 = v_u_13.isLimited1Point0_LimitedUnique(v_u_21) or v_u_13.isLimited2Point0_Or_LimitedCollectible(v_u_21)
				local v32
				if v30 then
					v32 = v_u_8.LimitedIconFrameSizeXOffset * 2
				else
					v32 = v_u_8.LimitedIconFrameSizeXOffset
				end
				v31 = UDim2.new(0, v_u_25.X + v32, 0, v_u_25.Y + v_u_8.LimitedIconFrameSizeYOffset)
			else
				v29 = nil
				v31 = nil
				v30 = nil
			end
			local v33 = v_u_4.createElement
			local v34 = "ImageButton"
			local v35 = {
				["BackgroundTransparency"] = 0,
				["BorderSizePixel"] = 0,
				["BackgroundColor3"] = v_u_7.Gray2,
				["Selectable"] = true,
				["SelectionImageObject"] = p_u_18.selectedImage,
				[v_u_4.Event.Activated] = function()
					-- upvalues: (ref) v_u_22, (ref) v_u_21
					v_u_22(v_u_21.assetId)
				end
			}
			local v36 = {
				["AssetThumbnail"] = v_u_4.createElement("ImageButton", {
					["Size"] = UDim2.new(1, 0, 0, v_u_23),
					["BackgroundTransparency"] = 0,
					["BorderSizePixel"] = 0,
					["BackgroundColor3"] = v_u_7.Graphite,
					["Selectable"] = false,
					["AutoButtonColor"] = false,
					["Image"] = "rbxthumb://type=Asset&id=" .. v_u_21.assetId .. "&w=150&h=150",
					[v_u_4.Event.Activated] = function()
						-- upvalues: (ref) v_u_22, (ref) v_u_21
						v_u_22(v_u_21.assetId)
					end
				}),
				["AssetNameBackground"] = v_u_4.createElement("Frame", {
					["Size"] = nil,
					["Position"] = nil,
					["BorderSizePixel"] = 0,
					["BackgroundColor3"] = nil,
					["Size"] = UDim2.new(1, 0, 1, -v_u_23),
					["Position"] = UDim2.new(0, 0, 0, v_u_23),
					["BackgroundColor3"] = Color3.fromRGB(44, 45, 47)
				}, {
					["AssetName"] = v_u_4.createElement("TextLabel", {
						["BackgroundTransparency"] = 1,
						["Size"] = nil,
						["TextTruncate"] = nil,
						["Position"] = nil,
						["TextWrapped"] = true,
						["Text"] = nil,
						["TextXAlignment"] = nil,
						["TextYAlignment"] = nil,
						["TextSize"] = 12,
						["TextScaled"] = true,
						["Font"] = nil,
						["TextColor3"] = nil,
						["Size"] = UDim2.new(1, -10, 1, -10),
						["TextTruncate"] = Enum.TextTruncate.AtEnd,
						["Position"] = UDim2.new(0, 5, 0, 5),
						["Text"] = v_u_21.name or "",
						["TextXAlignment"] = Enum.TextXAlignment.Left,
						["TextYAlignment"] = Enum.TextYAlignment.Center,
						["Font"] = v_u_6.default:getDefault(),
						["TextColor3"] = Color3.new(1, 1, 1)
					}, {
						["UITextSizeConstraint"] = v_u_4.createElement("UITextSizeConstraint", {
							["MaxTextSize"] = v27.AssetTextMaxSize
						})
					})
				}),
				["EquippedFrame"] = v_u_4.createElement("ImageLabel", {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["ZIndex"] = 2,
					["Visible"] = nil,
					["Image"] = "rbxasset://textures/ui/InspectMenu/gr-item-selector.png",
					["ImageColor3"] = nil,
					["ScaleType"] = nil,
					["SliceCenter"] = nil,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Visible"] = v_u_20,
					["ImageColor3"] = v_u_7.Green,
					["ScaleType"] = Enum.ScaleType.Slice,
					["SliceCenter"] = Rect.new(2.5, 2.5, 2.5, 2.5)
				}),
				["Corner"] = v_u_4.createElement("ImageLabel", {
					["Position"] = nil,
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["ZIndex"] = 2,
					["Visible"] = nil,
					["Image"] = "rbxasset://textures/ui/InspectMenu/gr-item-selector-triangle.png",
					["ImageColor3"] = nil,
					["Position"] = UDim2.new(1, -25, 0, 0),
					["Size"] = UDim2.new(0, 25, 0, 25),
					["Visible"] = v_u_20,
					["ImageColor3"] = v_u_7.Green
				})
			}
			if v_u_15() then
				v28 = v29
			end
			if v28 then
				local v37 = v_u_4.createElement
				local v38 = v_u_12
				local v39 = {}
				if not v_u_15() then
					v31 = UDim2.new(0, v_u_25.X + 18, 0, v_u_25.Y + 4)
				end
				v39.frameSize = v31
				v39.framePosition = UDim2.new(0, 16, 0, v_u_23 - v_u_25.Y - 20)
				v39.imageSize = UDim2.new(0, v_u_25.X, 0, v_u_25.Y)
				v39.imagePosition = UDim2.new(0, 5, 0, 2)
				v39.textSize = UDim2.new(0, v_u_25.X, 0, v_u_25.Y)
				v39.textPosition = UDim2.new(0, 5 + v_u_25.X, 0, 2)
				v39.text = (not v_u_15() or v30) and "#" or nil
				v28 = v37(v38, v39)
			end
			v36.LimitedLabel = v28
			return v33(v34, v35, v36)
		end
	}
	return v_u_4.createElement(v_u_11.Consumer, v40)
end
return v5.UNSTABLE_connect2(function(p41, p42)
	local v43 = p42.assetInfo.assetId
	return {
		["view"] = p41.view,
		["equipped"] = p41.equippedAssets[v43] == true,
		["locale"] = p41.locale
	}
end, function(p_u_44)
	-- upvalues: (copy) v_u_9
	return {
		["openDetails"] = function(p45) -- name: openDetails
			-- upvalues: (copy) p_u_44, (ref) v_u_9
			p_u_44(v_u_9(true, p45))
		end
	}
end)(v16)