-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.TryOnButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = require(v1.Workspace.Packages.Style).AppFonts
local v7 = script.Parent.Parent
local v_u_8 = require(v7.Colors)
local v_u_9 = require(v7.Constants)
local v_u_10 = require(v7.Actions.SetTryingOnInfo)
local v_u_11 = require(v7.Thunks.TryOnItem)
local v_u_12 = require(v7.getSelectionImageObjectRounded)
local v_u_13 = require(script.Parent.Common.ControllerShortcutKeycodes).TryOn
local v14 = v_u_4.PureComponent:extend("TryOnButton")
function v14.init(p_u_15) -- name: init
	-- upvalues: (copy) v_u_12, (copy) v_u_2, (copy) v_u_13
	p_u_15.selectedImage = v_u_12()
	v_u_2:BindCoreAction("TryOnGamepadShortcut", function(_, p16, _)
		-- upvalues: (copy) p_u_15
		if p16 ~= Enum.UserInputState.End then
			return Enum.ContextActionResult.Pass
		end
		p_u_15:activateButton()
		return Enum.ContextActionResult.Sink
	end, false, v_u_13)
end
function v14.activateButton(p17) -- name: activateButton
	-- upvalues: (copy) v_u_9
	if p17.props.showTryOn then
		local v18 = p17.props.assetInfo
		local v19 = p17.props.tryOnItem
		local v20 = p17.props.takeOffItem
		local v21 = p17.props.tryingOnInfo.tryingOn
		local v22 = p17.props.partOfBundleAndOffsale
		local v23 = p17.props.bundleId
		local v24 = v18 and p17.props.localPlayerModel
		if v24 then
			if v_u_9.LayeredAssetTypes[v18.assetTypeId] == nil then
				v24 = false
			else
				v24 = p17.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6
			end
		end
		if not v24 then
			if v21 then
				v20()
				return
			end
			v19(true, v18.assetId, v18.assetTypeId, v22, v23)
		end
	end
end
function v14.willUnmount(_) -- name: willUnmount
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindCoreAction("TryOnGamepadShortcut")
end
function v14.render(p_u_25) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_8, (copy) v_u_3, (copy) v_u_6
	local v26 = p_u_25.props.tryingOnInfo.tryingOn
	local v27 = p_u_25.props.showTryOn
	local v28 = p_u_25.props.locale
	local v29 = p_u_25.props.assetInfo
	local v30 = p_u_25.props.tryOnButtonRef
	local v31 = v26 and "InGame.InspectMenu.Action.TakeOff" or "InGame.InspectMenu.Action.TryOn"
	local v32 = v29 and p_u_25.props.localPlayerModel
	if v32 then
		if v_u_9.LayeredAssetTypes[v29.assetTypeId] == nil then
			v32 = false
		else
			v32 = p_u_25.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6
		end
	end
	local v33 = v_u_4.createElement
	local v34 = {
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Visible"] = nil,
		["LayoutOrder"] = 2,
		["Image"] = "rbxasset://textures/ui/InspectMenu/Button_outline.png",
		["ImageTransparency"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 0),
		["Size"] = UDim2.new(0.5, -32, 0, 44),
		["Visible"] = v27,
		["ImageTransparency"] = v32 and 0.5 or 0,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(5, 5, 120, 20)
	}
	local v37 = {
		["SelectionGainedImage"] = v_u_4.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Visible"] = false,
			["Image"] = "rbxasset://textures/ui/InspectMenu/Button_white.png",
			["ImageColor3"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["ImageColor3"] = v_u_8.Pumice
		}),
		["TryOnTextKey"] = v_u_4.createElement("TextButton", {
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Text"] = v_u_3:FormatByKeyForLocale(v31, v28),
			["Font"] = v_u_6.default:getDefault(),
			["TextSize"] = 16,
			["TextColor3"] = v_u_8.White,
			["TextTransparency"] = v32 and 0.5 or 0,
			["SelectionImageObject"] = p_u_25.selectedImage,
			["ZIndex"] = 2,
			[v_u_4.Event.SelectionGained] = function(p35)
				-- upvalues: (ref) v_u_8
				p35.Parent.SelectionGainedImage.Visible = true
				p35.TextColor3 = v_u_8.Carbon
			end,
			[v_u_4.Event.SelectionLost] = function(p36)
				-- upvalues: (ref) v_u_8
				p36.Parent.SelectionGainedImage.Visible = false
				p36.TextColor3 = v_u_8.White
			end,
			[v_u_4.Ref] = v30,
			[v_u_4.Event.Activated] = function()
				-- upvalues: (copy) p_u_25
				p_u_25:activateButton()
			end
		})
	}
	return v33("ImageLabel", v34, v37)
end
return v5.UNSTABLE_connect2(function(p38, _)
	local v39 = p38.detailsInformation.assetId
	return {
		["locale"] = p38.locale,
		["view"] = p38.view,
		["assetInfo"] = p38.assets[v39],
		["bundleInfo"] = p38.bundles,
		["tryingOnInfo"] = p38.tryingOnInfo
	}
end, function(p_u_40)
	-- upvalues: (copy) v_u_11, (copy) v_u_10
	return {
		["tryOnItem"] = function(p41, p42, p43, p44, p45) -- name: tryOnItem
			-- upvalues: (copy) p_u_40, (ref) v_u_11
			p_u_40(v_u_11(p41, p42, p43, p44, p45))
		end,
		["takeOffItem"] = function() -- name: takeOffItem
			-- upvalues: (copy) p_u_40, (ref) v_u_10
			p_u_40(v_u_10(false, nil, nil))
		end
	}
end)(v14)