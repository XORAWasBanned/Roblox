-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.ValidationErrorModal
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v_u_3 = v2.App.Button.Enum.ButtonType
local v_u_4 = v2.App.Dialog.Alert.InteractiveAlert
local v_u_5 = v2.App.Dialog.Overlay
local v_u_6 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_7 = v2.App.ImageSet.Images["icons/controls/keys/xboxA"]
local v8 = require(v1.Workspace.Packages.RoactUtils)
local v_u_9 = v8.Hooks.useIsGamepad
local v_u_10 = v8.Hooks.RoactRodux.useDispatch
local v_u_11 = require(v1.Packages.React)
local v12 = script.Parent.Parent
local v_u_13 = require(v12.Actions.CloseOpenPrompt)
return function(p14)
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_13, (copy) v_u_11, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7
	local v15 = v_u_9()
	local v_u_16 = v_u_10()
	local function v17()
		-- upvalues: (copy) v_u_16, (ref) v_u_13
		v_u_16(v_u_13())
	end
	local v18 = v_u_11.createElement
	local v19 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["ZIndex"] = 3,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v20 = {
		["Overlay"] = v_u_11.createElement(v_u_5, {
			["showGradient"] = false,
			["ZIndex"] = 3
		})
	}
	local v21 = v_u_11.createElement
	local v22 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["ZIndex"] = 4,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v23 = {}
	local v24 = v_u_11.createElement
	local v25 = v_u_4
	local v26 = {
		["title"] = "Something Went Wrong",
		["bodyText"] = "Your creation could not be created due to an error. A report has been sent to the developer of this experience.",
		["screenSize"] = nil,
		["buttonStackInfo"] = nil,
		["screenSize"] = p14.screenSize
	}
	local v27 = {}
	local v28 = {}
	local v29 = {
		["buttonType"] = v_u_3.PrimarySystem,
		["props"] = {
			["onActivated"] = v17,
			["text"] = v_u_6:FormatByKey("InGame.CommonUI.Button.Ok"),
			["inputIcon"] = v15 and v_u_7 or nil
		}
	}
	__set_list(v28, 1, {v29})
	v27.buttons = v28
	v26.buttonStackInfo = v27
	v23.InteractiveAlert = v24(v25, v26)
	v20.InteractiveAlertWrapper = v21("Frame", v22, v23)
	return v18("Frame", v19, v20)
end