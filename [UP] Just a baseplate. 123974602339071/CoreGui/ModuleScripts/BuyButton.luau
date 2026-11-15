-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.BuyButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("MarketplaceService")
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v_u_7 = require(v1.Workspace.Packages.Style).AppFonts
local v8 = script.Parent.Parent
local v_u_9 = require(v8.Colors)
local v_u_10 = require(v8.Thunks.PromptPurchase)
local v_u_11 = require(v8.getSelectionImageObjectRounded)
local v_u_12 = require(v8.UtilityFunctions)
local v13 = v_u_5.PureComponent:extend("BuyButton")
function v13.init(p_u_14) -- name: init
	-- upvalues: (copy) v_u_11, (copy) v_u_3
	p_u_14.selectedImage = v_u_11()
	p_u_14.connections = {}
	p_u_14.lastGamepadFocus = nil
	function p_u_14.onPromptPurchaseFinished()
		-- upvalues: (copy) p_u_14, (ref) v_u_3
		if p_u_14.props.gamepadEnabled and p_u_14.props.visible then
			v_u_3.SelectedCoreObject = p_u_14.lastGamepadFocus
		end
	end
end
function v13.render(p_u_15) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_9, (copy) v_u_3, (copy) v_u_7
	local v_u_16 = p_u_15.props.itemType
	local v_u_17 = p_u_15.props.itemId
	local v18 = p_u_15.props.showRobuxIcon
	local v_u_19 = p_u_15.props.forSale
	local v_u_20 = p_u_15.props.promptPurchase
	local v21 = p_u_15.props.buyText
	local v22 = p_u_15.props.buyButtonRef
	local v_u_23 = p_u_15.props.collectibleItemId
	local v_u_24 = p_u_15.props.collectibleLowestAvailableResaleProductId
	local v_u_25 = p_u_15.props.collectibleLowestAvailableResaleItemInstanceId
	local v_u_26 = p_u_15.props.collectibleLowestResalePrice
	local v_u_27 = v_u_12.isLimited2Point0_Or_LimitedCollectible(p_u_15.props.assetInfo)
	local v28 = UDim2.new(0, p_u_15:getBuyButtonTextSize(v21), 1, 0)
	local v29 = v_u_19 and 0 or 0.5
	return v_u_5.createElement("ImageButton", {
		["AnchorPoint"] = Vector2.new(0.5, 0),
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0.5, -32, 0, 44),
		["Image"] = "rbxasset://textures/ui/InspectMenu/Button_white.png",
		["ImageColor3"] = v_u_9.Green,
		["SelectionImageObject"] = p_u_15.selectedImage,
		["LayoutOrder"] = 3,
		["ImageTransparency"] = v29,
		[v_u_5.Ref] = v22,
		[v_u_5.Event.Activated] = function()
			-- upvalues: (copy) v_u_19, (copy) p_u_15, (ref) v_u_3, (copy) v_u_20, (copy) v_u_17, (copy) v_u_16, (copy) v_u_23, (copy) v_u_24, (copy) v_u_25, (copy) v_u_26, (copy) v_u_27
			if v_u_19 then
				if p_u_15.props.gamepadEnabled and p_u_15.props.visible then
					p_u_15.lastGamepadFocus = v_u_3.SelectedCoreObject
					v_u_3.SelectedCoreObject = nil
				end
				v_u_20(v_u_17, v_u_16, v_u_23, v_u_24, v_u_25, v_u_26, v_u_27)
			end
		end
	}, {
		["UIListLayout"] = v_u_5.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		}),
		["RobuxIcon"] = v_u_5.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Image"] = "rbxasset://textures/ui/common/robux_small.png",
			["ImageTransparency"] = nil,
			["ImageColor3"] = nil,
			["LayoutOrder"] = 1,
			["Visible"] = nil,
			["Size"] = UDim2.new(0, 16, 0, 16),
			["ImageTransparency"] = v29,
			["ImageColor3"] = v_u_9.White,
			["Visible"] = v18
		}),
		["BuyText"] = v_u_5.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = 16,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["LayoutOrder"] = 2,
			["TextXAlignment"] = nil,
			["Size"] = v28,
			["Text"] = tostring(v21),
			["Font"] = v_u_7.default:getDefault(),
			["TextColor3"] = v_u_9.White,
			["TextTransparency"] = v29,
			["TextXAlignment"] = Enum.TextXAlignment.Center
		})
	})
end
function v13.didMount(p30) -- name: didMount
	-- upvalues: (copy) v_u_4
	local v31 = v_u_4.PromptPurchaseFinished:Connect(p30.onPromptPurchaseFinished)
	local v32 = v_u_4.PromptBundlePurchaseFinished:Connect(p30.onPromptPurchaseFinished)
	local v33 = p30.connections
	table.insert(v33, v31)
	local v34 = p30.connections
	table.insert(v34, v32)
end
function v13.willUnmount(p35) -- name: willUnmount
	for _, v36 in pairs(p35.connections) do
		v36:Disconnect()
	end
end
function v13.getBuyButtonTextSize(p37, p38) -- name: getBuyButtonTextSize
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	if not p37.props.buyButtonRef.current then
		return 0
	end
	local v39 = v_u_2:GetTextSize(tostring(p38), 16, v_u_7.default:getDefault(), Vector2.new(p37.props.buyButtonRef.current.AbsoluteSize.X, 5000))
	p37.props.buyButtonRef.Size = UDim2.new(0, 1, 0, v39.Y)
	return v39.X > 32 and v39.X or 32
end
return v6.UNSTABLE_connect2(function(p40, _)
	local v41 = p40.detailsInformation.assetId
	return {
		["locale"] = p40.locale,
		["view"] = p40.view,
		["assetInfo"] = p40.assets[v41],
		["gamepadEnabled"] = p40.gamepadEnabled,
		["visible"] = p40.visible
	}
end, function(p_u_42)
	-- upvalues: (copy) v_u_10
	return {
		["promptPurchase"] = function(p43, p44, p45, p46, p47, p48, p49) -- name: promptPurchase
			-- upvalues: (copy) p_u_42, (ref) v_u_10
			p_u_42(v_u_10(p43, p44, p45, p46, p47, p48, p49))
		end
	}
end)(v13)