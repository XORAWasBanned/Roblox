-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.UpdateOutfitPrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v_u_6 = require(v1.Packages.UIBlox).App.Button.Enum.ButtonType
v2:WaitForChild("RobloxGui")
local v_u_7 = require(v1.Workspace.Packages.RobloxTranslator)
local v8 = script.Parent.Parent
local v9 = v8.Parent
local v_u_10 = require(v9.Thunks.SignalUpdateOutfitPermissionDenied)
local v_u_11 = require(v9.Thunks.PerformUpdateOutfit)
local v_u_12 = require(v8.Prompts.PromptWithAvatarViewport)
local v13 = require(v9.AvatarEditorPromptsPolicy)
local v14 = v_u_3.PureComponent:extend("UpdateOutfitPrompt")
v14.validateProps = v5.strictInterface({
	["screenSize"] = v5.Vector2,
	["humanoidDescription"] = v5.instanceOf("HumanoidDescription"),
	["rigType"] = v5.enum(Enum.HumanoidRigType),
	["outfitName"] = v5.string,
	["signalUpdateOutfitPermissionDenied"] = v5.callback,
	["performUpdateOutfit"] = v5.callback,
	["showCustomOutfitNames"] = v5.boolean
})
function v14.render(p15) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_12, (copy) v_u_6
	local v16
	if p15.props.showCustomOutfitNames then
		v16 = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptText", {
			["RBX_NAME"] = p15.props.outfitName
		})
	else
		v16 = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTextNoOutfitName")
	end
	local v17 = v_u_3.createElement
	local v18 = v_u_12
	local v19 = {
		["humanoidDescription"] = p15.props.humanoidDescription,
		["rigType"] = p15.props.rigType,
		["title"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTitle"),
		["bodyText"] = v16
	}
	local v20 = {}
	local v21 = {}
	local v22 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p15.props.signalUpdateOutfitPermissionDenied,
			["text"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptNo")
		}
	}
	local v23 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_6.PrimarySystem,
		["props"] = {
			["onActivated"] = p15.props.performUpdateOutfit,
			["text"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptYes")
		}
	}
	__set_list(v21, 1, {v22, v23})
	v20.buttons = v21
	v19.buttonStackInfo = v20
	return v17(v18, v19)
end
local v26 = v4.connect(function(p24) -- name: mapStateToProps
	return {
		["screenSize"] = p24.screenSize,
		["humanoidDescription"] = p24.promptInfo.humanoidDescription,
		["rigType"] = p24.promptInfo.rigType,
		["outfitName"] = p24.promptInfo.outfitName
	}
end, function(p_u_25) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	return {
		["signalUpdateOutfitPermissionDenied"] = function() -- name: signalUpdateOutfitPermissionDenied
			-- upvalues: (copy) p_u_25, (ref) v_u_10
			return p_u_25(v_u_10)
		end,
		["performUpdateOutfit"] = function()
			-- upvalues: (copy) p_u_25, (ref) v_u_11
			return p_u_25(v_u_11)
		end or nil
	}
end)(v14)
return v13.connect(function(p27, _)
	return {
		["showCustomOutfitNames"] = p27.getCustomOutfitNames()
	}
end)(v26)