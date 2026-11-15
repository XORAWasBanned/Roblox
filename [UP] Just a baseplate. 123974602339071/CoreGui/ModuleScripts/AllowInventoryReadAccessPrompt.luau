-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.AllowInventoryReadAccessPrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v_u_7 = v6.App.Dialog.Alert.InteractiveAlert
local v_u_8 = v6.App.Button.Enum.ButtonType
v2:WaitForChild("RobloxGui")
local v_u_9 = require(v1.Workspace.Packages.RobloxTranslator)
local v10 = script.Parent.Parent.Parent
local v_u_11 = require(v10.Thunks.SetAllowInventoryReadAccess)
local v12 = v_u_3.PureComponent:extend("AllowInventoryReadAccessPrompt")
v12.validateProps = v5.strictInterface({
	["gameName"] = v5.string,
	["screenSize"] = v5.Vector2,
	["setAvatarReadAccessAllowed"] = v5.callback,
	["setAvatarReadAccessDenied"] = v5.callback
})
function v12.render(p13) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8
	local v14 = v_u_3.createElement
	local v15 = v_u_7
	local v16 = {
		["title"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptTitle"),
		["bodyText"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptText", {
			["RBX_NAME"] = p13.props.gameName
		})
	}
	local v17 = {}
	local v18 = {}
	local v19 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p13.props.setAvatarReadAccessDenied,
			["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptNo")
		}
	}
	local v20 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_8.PrimarySystem,
		["props"] = {
			["onActivated"] = p13.props.setAvatarReadAccessAllowed,
			["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptYes")
		}
	}
	__set_list(v18, 1, {v19, v20})
	v17.buttons = v18
	v16.buttonStackInfo = v17
	v16.position = UDim2.fromScale(0.5, 0.5)
	v16.screenSize = p13.props.screenSize
	return v14(v15, v16)
end
return v4.connect(function(p21) -- name: mapStateToProps
	return {
		["gameName"] = p21.gameName,
		["screenSize"] = p21.screenSize
	}
end, function(p_u_22) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_11
	return {
		["setAvatarReadAccessDenied"] = function() -- name: setAvatarReadAccessDenied
			-- upvalues: (copy) p_u_22, (ref) v_u_11
			return p_u_22(v_u_11(false))
		end,
		["setAvatarReadAccessAllowed"] = function() -- name: setAvatarReadAccessAllowed
			-- upvalues: (copy) p_u_22, (ref) v_u_11
			return p_u_22(v_u_11(true))
		end
	}
end)(v12)