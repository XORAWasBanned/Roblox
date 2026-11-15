-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.LeaveCreationAlert
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v_u_3 = v2.App.Button.Enum.ButtonType
local v_u_4 = v2.App.Dialog.Alert.InteractiveAlert
local v_u_5 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_6 = require(v1.Packages.React)
return function(p7) -- name: LeaveCreationAlert
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
	local v8 = v_u_6.createElement
	local v9 = v_u_4
	local v10 = {
		["title"] = v_u_5:FormatByKey("CoreScripts.PublishAvatarPrompt.LeaveCreationTitle"),
		["bodyText"] = v_u_5:FormatByKey("CoreScripts.PublishCommon.UnsavedWarning")
	}
	local v11 = {}
	local v12 = {}
	local v13 = {
		["props"] = nil,
		["isDefaultChild"] = false,
		["props"] = {
			["onActivated"] = p7.closePrompt,
			["text"] = v_u_5:FormatByKey("CoreScripts.PublishCommon.Leave")
		}
	}
	local v14 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = true,
		["buttonType"] = v_u_3.PrimarySystem,
		["props"] = {
			["onActivated"] = p7.cancelClosePrompt,
			["text"] = v_u_5:FormatByKey("CoreScripts.PublishCommon.Stay")
		}
	}
	__set_list(v12, 1, {v13, v14})
	v11.buttons = v12
	v10.buttonStackInfo = v11
	v10.position = UDim2.fromScale(0.5, 0.5)
	v10.screenSize = p7.screenSize
	return v8(v9, v10)
end