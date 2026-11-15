-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.RenameOutfitPrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v_u_7 = v6.App.Button.Enum.ButtonType
local v_u_8 = v6.App.Dialog.Alert.InteractiveAlert
v2:WaitForChild("RobloxGui")
local v_u_9 = require(v1.Workspace.Packages.RobloxTranslator)
local v10 = script.Parent.Parent
local v11 = v10.Parent
local v_u_12 = require(v10.Prompts.PromptWithTextField)
local v_u_13 = require(v11.Thunks.SignalRenameOutfitPermissionDenied)
local v_u_14 = require(v11.Thunks.PerformRenameOutfit)
local v15 = require(v11.AvatarEditorPromptsPolicy)
local v16 = v_u_3.PureComponent:extend("RenameOutfitNamePrompt")
v16.validateProps = v5.strictInterface({
	["outfitId"] = v5.integer,
	["outfitName"] = v5.string,
	["screenSize"] = v5.Vector2,
	["signalRenameOutfitPermissionDenied"] = v5.callback,
	["performRenameOutfit"] = v5.callback,
	["showCustomOutfitNames"] = v5.boolean
})
function v16.init(p_u_17) -- name: init
	p_u_17:setState({
		["outfitName"] = "",
		["alertPosition"] = nil,
		["alertPosition"] = UDim2.fromScale(0.5, 0.5)
	})
	function p_u_17.textUpdated(p18)
		-- upvalues: (copy) p_u_17
		p_u_17:setState({
			["outfitName"] = p18
		})
	end
	function p_u_17.confirmRenameOutfit()
		-- upvalues: (copy) p_u_17
		p_u_17.props.performRenameOutfit(p_u_17.state.outfitName)
	end
end
function v16.render(p19) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_12
	if not p19.props.showCustomOutfitNames then
		local v20 = v_u_3.createElement
		local v21 = v_u_8
		local v22 = {
			["title"] = nil,
			["bodyText"] = nil,
			["buttonStackInfo"] = nil,
			["position"] = nil,
			["screenSize"] = nil,
			["isMiddleContentFocusable"] = false,
			["title"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptTitle"),
			["bodyText"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptText"),
			["buttonStackInfo"] = {
				["buttons"] = {
					{
						["buttonType"] = nil,
						["props"] = nil,
						["isDefaultChild"] = true,
						["buttonType"] = v_u_7.PrimarySystem,
						["props"] = {
							["onActivated"] = p19.props.signalRenameOutfitPermissionDenied,
							["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptOkay")
						}
					}
				}
			},
			["position"] = UDim2.fromScale(0.5, 0.5),
			["screenSize"] = p19.props.screenSize
		}
		return v20(v21, v22)
	end
	local v23 = v_u_3.createElement
	local v24 = v_u_12
	local v25 = {
		["fieldText"] = p19.state.outfitName,
		["onFieldTextUpdated"] = p19.textUpdated,
		["title"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitNamePromptTitle"),
		["bodyText"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitPromptText", {
			["RBX_NAME"] = p19.props.outfitName
		})
	}
	local v26 = {}
	local v27 = {}
	local v28 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p19.props.signalRenameOutfitPermissionDenied,
			["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
		}
	}
	local v29 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_7.PrimarySystem,
		["props"] = {
			["isDisabled"] = p19.state.outfitName == "",
			["onActivated"] = p19.confirmRenameOutfit,
			["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
		}
	}
	__set_list(v27, 1, {v28, v29})
	v26.buttons = v27
	v25.buttonStackInfo = v26
	return v23(v24, v25)
end
local v33 = v4.connect(function(p30) -- name: mapStateToProps
	return {
		["outfitId"] = p30.promptInfo.outfitId,
		["outfitName"] = p30.promptInfo.outfitName,
		["screenSize"] = p30.screenSize
	}
end, function(p_u_31) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_13, (copy) v_u_14
	return {
		["signalRenameOutfitPermissionDenied"] = function() -- name: signalRenameOutfitPermissionDenied
			-- upvalues: (copy) p_u_31, (ref) v_u_13
			return p_u_31(v_u_13)
		end,
		["performRenameOutfit"] = function(p32) -- name: performRenameOutfit
			-- upvalues: (copy) p_u_31, (ref) v_u_14
			return p_u_31(v_u_14(p32))
		end
	}
end)(v16)
return v15.connect(function(p34, _)
	return {
		["showCustomOutfitNames"] = p34.getCustomOutfitNames()
	}
end)(v33)