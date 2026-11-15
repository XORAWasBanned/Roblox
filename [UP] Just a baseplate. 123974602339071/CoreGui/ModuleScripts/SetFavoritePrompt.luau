-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.SetFavoritePrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("ContextActionService")
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v7 = require(v1.Packages.t)
local v8 = require(v1.Packages.UIBlox)
v2:WaitForChild("RobloxGui")
local v_u_9 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_10 = v8.App.Dialog.Alert.InteractiveAlert
local v_u_11 = v8.App.Button.Enum.ButtonType
local v_u_12 = v8.App.Loading.LoadableImage
local v13 = script.Parent.Parent.Parent
local v_u_14 = require(v13.Thunks.PerformSetFavorite)
local v_u_15 = require(v13.Thunks.SignalSetFavoritePermissionDenied)
local v_u_16 = game:DefineFastFlag("CloseFavoritePromptWithB", false)
local v17 = v_u_5.PureComponent:extend("SetFavoritePrompt")
v17.validateProps = v7.strictInterface({
	["itemId"] = v7.integer,
	["itemType"] = v7.enum(Enum.AvatarItemType),
	["itemName"] = v7.string,
	["shouldFavorite"] = v7.boolean,
	["screenSize"] = v7.Vector2,
	["performSetFavorite"] = v7.callback,
	["signalSetFavoritePermissionDenied"] = v7.callback
})
function v17.init(p_u_18) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_12, (copy) v_u_16, (copy) v_u_3, (copy) v_u_4
	function p_u_18.renderAlertMiddleContent()
		-- upvalues: (copy) p_u_18, (ref) v_u_5, (ref) v_u_12
		local v19 = "rbxthumb://type=" .. (p_u_18.props.itemType == Enum.AvatarItemType.Asset and "Asset" or (p_u_18.props.itemType == Enum.AvatarItemType.Bundle and "BundleThumbnail" or nil)) .. "&id=" .. p_u_18.props.itemId .. "&w=150&h=150"
		return v_u_5.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 150)
		}, {
			["Thumnail"] = v_u_5.createElement(v_u_12, {
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
				["Image"] = v19
			})
		})
	end
	if v_u_16 then
		p_u_18.menuKey = "favorite_prompt_" .. p_u_18.props.itemId
		v_u_3:SetMenuIsOpen(true, p_u_18.menuKey)
		v_u_4:BindCoreAction(p_u_18.menuKey, function(_, p20, _)
			-- upvalues: (copy) p_u_18
			if p20 ~= Enum.UserInputState.End then
				return Enum.ContextActionResult.Pass
			end
			p_u_18.props.signalSetFavoritePermissionDenied()
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end
function v17.willUnmount(p21) -- name: willUnmount
	-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_4
	if v_u_16 then
		v_u_3:SetMenuIsOpen(false, p21.menuKey)
		v_u_4:UnbindCoreAction(p21.menuKey)
	end
end
function v17.render(p22) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_10, (copy) v_u_11
	local v23, v24
	if p22.props.shouldFavorite then
		v23 = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptTitle")
		v24 = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptText", {
			["RBX_NAME"] = p22.props.itemName
		})
	else
		v23 = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptTitle")
		v24 = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptText", {
			["RBX_NAME"] = p22.props.itemName
		})
	end
	local v25 = v_u_5.createElement
	local v26 = v_u_10
	local v27 = {
		["title"] = nil,
		["bodyText"] = nil,
		["buttonStackInfo"] = nil,
		["position"] = nil,
		["screenSize"] = nil,
		["middleContent"] = nil,
		["isMiddleContentFocusable"] = false,
		["title"] = v23,
		["bodyText"] = v24
	}
	local v28 = {}
	local v29 = {}
	local v30 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p22.props.signalSetFavoritePermissionDenied,
			["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptNo")
		}
	}
	local v31 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_11.PrimarySystem,
		["props"] = {
			["onActivated"] = nil,
			["text"] = nil,
			["isDelayedInput"] = true,
			["enableInputDelayed"] = true,
			["delayInputSeconds"] = 3,
			["onActivated"] = p22.props.performSetFavorite,
			["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptYes")
		}
	}
	__set_list(v29, 1, {v30, v31})
	v28.buttons = v29
	v27.buttonStackInfo = v28
	v27.position = UDim2.fromScale(0.5, 0.5)
	v27.screenSize = p22.props.screenSize
	v27.middleContent = p22.renderAlertMiddleContent
	return v25(v26, v27)
end
return v6.connect(function(p32) -- name: mapStateToProps
	return {
		["itemId"] = p32.promptInfo.itemId,
		["itemType"] = p32.promptInfo.itemType,
		["itemName"] = p32.promptInfo.itemName,
		["shouldFavorite"] = p32.promptInfo.shouldFavorite,
		["screenSize"] = p32.screenSize
	}
end, function(p_u_33) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_14, (copy) v_u_15
	return {
		["performSetFavorite"] = function() -- name: performSetFavorite
			-- upvalues: (copy) p_u_33, (ref) v_u_14
			return p_u_33(v_u_14)
		end,
		["signalSetFavoritePermissionDenied"] = function() -- name: signalSetFavoritePermissionDenied
			-- upvalues: (copy) p_u_33, (ref) v_u_15
			return p_u_33(v_u_15)
		end
	}
end)(v17)