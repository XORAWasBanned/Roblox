-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.DeleteOutfitPrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v_u_7 = v6.App.Dialog.Alert.InteractiveAlert
local v_u_8 = v6.App.Button.Enum.ButtonType
local v_u_9 = v6.App.Loading.LoadableImage
v2:WaitForChild("RobloxGui")
local v_u_10 = require(v1.Workspace.Packages.RobloxTranslator)
local v11 = script.Parent.Parent.Parent
local v_u_12 = require(v11.Thunks.SignalDeleteOutfitPermissionDenied)
local v_u_13 = require(v11.Thunks.PerformDeleteOutfit)
local v14 = require(v11.AvatarEditorPromptsPolicy)
local v15 = v_u_3.PureComponent:extend("DeleteOutfitPrompt")
v15.validateProps = v5.strictInterface({
	["screenSize"] = v5.Vector2,
	["outfitId"] = v5.integer,
	["outfitName"] = v5.string,
	["performDeleteOutfit"] = v5.callback,
	["signalDeleteOutfitPermissionDenied"] = v5.callback,
	["showCustomOutfitNames"] = v5.boolean
})
function v15.init(p_u_16) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_9
	function p_u_16.renderAlertMiddleContent()
		-- upvalues: (copy) p_u_16, (ref) v_u_3, (ref) v_u_9
		local v17 = "rbxthumb://type=Outfit&id=" .. p_u_16.props.outfitId .. "&w=150&h=150"
		local v18 = v_u_3.createElement
		local v19 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 150)
		}
		local v20 = {
			["Thumnail"] = v_u_3.createElement(v_u_9, {
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["useShimmerAnimationWhileLoading"] = true,
				["showFailedStateWhenLoadingFailed"] = true,
				["Position"] = UDim2.fromScale(0.5, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Size"] = UDim2.fromOffset(150, 150),
				["Image"] = v17
			})
		}
		return v18("Frame", v19, v20)
	end
end
function v15.render(p21) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_7, (copy) v_u_8
	local v22
	if p21.props.showCustomOutfitNames then
		v22 = v_u_10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptText", {
			["RBX_NAME"] = p21.props.outfitName
		})
	else
		v22 = v_u_10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTextNoName")
	end
	local v23 = v_u_3.createElement
	local v24 = v_u_7
	local v25 = {
		["title"] = nil,
		["bodyText"] = nil,
		["buttonStackInfo"] = nil,
		["position"] = nil,
		["screenSize"] = nil,
		["middleContent"] = nil,
		["isMiddleContentFocusable"] = false,
		["title"] = v_u_10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTitle"),
		["bodyText"] = v22
	}
	local v26 = {}
	local v27 = {}
	local v28 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p21.props.signalDeleteOutfitPermissionDenied,
			["text"] = v_u_10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptNo")
		}
	}
	local v29 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_8.PrimarySystem,
		["props"] = {
			["onActivated"] = p21.props.performDeleteOutfit,
			["text"] = v_u_10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptYes")
		}
	}
	__set_list(v27, 1, {v28, v29})
	v26.buttons = v27
	v25.buttonStackInfo = v26
	v25.position = UDim2.fromScale(0.5, 0.5)
	v25.screenSize = p21.props.screenSize
	v25.middleContent = p21.renderAlertMiddleContent
	return v23(v24, v25)
end
local v32 = v4.connect(function(p30) -- name: mapStateToProps
	return {
		["screenSize"] = p30.screenSize,
		["outfitId"] = p30.promptInfo.outfitId,
		["outfitName"] = p30.promptInfo.outfitName
	}
end, function(p_u_31) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	return {
		["signalDeleteOutfitPermissionDenied"] = function() -- name: signalDeleteOutfitPermissionDenied
			-- upvalues: (copy) p_u_31, (ref) v_u_12
			return p_u_31(v_u_12)
		end,
		["performDeleteOutfit"] = function() -- name: performDeleteOutfit
			-- upvalues: (copy) p_u_31, (ref) v_u_13
			return p_u_31(v_u_13)
		end
	}
end)(v15)
return v14.connect(function(p33, _)
	return {
		["showCustomOutfitNames"] = p33.getCustomOutfitNames()
	}
end)(v32)