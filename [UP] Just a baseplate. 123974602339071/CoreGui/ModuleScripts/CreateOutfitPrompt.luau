-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.CreateOutfitPrompt
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
local v_u_10 = require(v8.Prompts.PromptWithAvatarViewport)
local v_u_11 = require(v9.Thunks.SignalCreateOutfitPermissionDenied)
local v_u_12 = require(v9.Actions.CreateOutfitConfirmed)
local v_u_13 = require(v9.Thunks.PerformCreateOutfit)
local v14 = require(v9.AvatarEditorPromptsPolicy)
local v15 = v_u_3.PureComponent:extend("CreateOutfitPrompt")
v15.validateProps = v5.strictInterface({
	["humanoidDescription"] = v5.instanceOf("HumanoidDescription"),
	["rigType"] = v5.enum(Enum.HumanoidRigType),
	["createOutfitConfirmed"] = v5.callback,
	["signalCreateOutfitPermissionDenied"] = v5.callback,
	["performCreateOutfit"] = v5.callback,
	["showCustomOutfitNames"] = v5.boolean
})
function v15.render(p16) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6
	local v17
	if p16.props.showCustomOutfitNames then
		v17 = p16.props.createOutfitConfirmed
	else
		v17 = p16.props.performCreateOutfit
	end
	local v18 = v_u_3.createElement
	local v19 = v_u_10
	local v20 = {
		["humanoidDescription"] = p16.props.humanoidDescription,
		["rigType"] = p16.props.rigType,
		["title"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptTitle"),
		["bodyText"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptText")
	}
	local v21 = {}
	local v22 = {}
	local v23 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p16.props.signalCreateOutfitPermissionDenied,
			["text"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptNo")
		}
	}
	local v24 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_6.PrimarySystem,
		["props"] = {
			["onActivated"] = v17,
			["text"] = v_u_7:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptYes")
		}
	}
	__set_list(v22, 1, {v23, v24})
	v21.buttons = v22
	v20.buttonStackInfo = v21
	return v18(v19, v20)
end
local v27 = v4.connect(function(p25) -- name: mapStateToProps
	return {
		["humanoidDescription"] = p25.promptInfo.humanoidDescription,
		["rigType"] = p25.promptInfo.rigType
	}
end, function(p_u_26) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_13
	return {
		["signalCreateOutfitPermissionDenied"] = function() -- name: signalCreateOutfitPermissionDenied
			-- upvalues: (copy) p_u_26, (ref) v_u_11
			return p_u_26(v_u_11)
		end,
		["createOutfitConfirmed"] = function() -- name: createOutfitConfirmed
			-- upvalues: (copy) p_u_26, (ref) v_u_12
			return p_u_26(v_u_12())
		end,
		["performCreateOutfit"] = function() -- name: performCreateOutfit
			-- upvalues: (copy) p_u_26, (ref) v_u_13
			return p_u_26(v_u_13(""))
		end
	}
end)(v15)
return v14.connect(function(p28, _)
	return {
		["showCustomOutfitNames"] = p28.getCustomOutfitNames()
	}
end)(v27)