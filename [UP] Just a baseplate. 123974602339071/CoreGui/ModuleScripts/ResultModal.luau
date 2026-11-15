-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.ResultModal
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = v3.App.Button.Enum.ButtonType
local v_u_5 = v3.App.Dialog.Alert.InteractiveAlert
local v_u_6 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_7 = v3.App.ImageSet.Images["icons/controls/keys/xboxA"]
local v_u_8 = require(v1.Packages.Roact)
local v9 = require(v1.Packages.RoactRodux)
local v10 = require(v1.Packages.t)
local v_u_11 = require(v1.Workspace.Packages.InputType)
local v_u_12 = require(v1.Workspace.Packages.InputType).getInputGroup
local v13 = script.Parent.Parent
local v_u_14 = require(v13.Thunks.CloseResultModal)
local v_u_15
if game:GetEngineFeature("EnableImagePublish") then
	v_u_15 = Enum.PromptCreatePlatformContentResult
else
	v_u_15 = Enum.PromptPublishAssetResult
end
local v16 = v_u_8.PureComponent:extend("ResultModal")
v16.validateProps = v10.strictInterface({
	["screenSize"] = v10.Vector2,
	["resultModalType"] = v10.enum(v_u_15),
	["closeResultModal"] = v10.callback
})
function v16.init(p17) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_11
	p17:setState({
		["isGamepad"] = v_u_12((v_u_2:GetLastInputType())) == v_u_11.InputTypeConstants.Gamepad
	})
end
function v16.getLocalizedStringForResultPrompt(_, p18) -- name: getLocalizedStringForResultPrompt
	-- upvalues: (copy) v_u_15, (copy) v_u_6
	if p18 == v_u_15.Success then
		return v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessMessage")
	elseif p18 == v_u_15.UploadFailed then
		return v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailed")
	elseif p18 == v_u_15.NoUserInput then
		return v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.NoUserInput")
	else
		return v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.UndefinedError", {
			["RESULT_TYPE"] = tostring(p18)
		})
	end
end
function v16.getLocalizedTitleForResultPrompt(_, p19) -- name: getLocalizedTitleForResultPrompt
	-- upvalues: (copy) v_u_15, (copy) v_u_6
	if p19 == v_u_15.Success then
		return v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessTitle")
	else
		return v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailedTitle")
	end
end
function v16.render(p20) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	local v21 = v_u_8.createElement
	local v22 = v_u_5
	local v23 = {
		["title"] = p20:getLocalizedTitleForResultPrompt(p20.props.resultModalType),
		["bodyText"] = p20:getLocalizedStringForResultPrompt(p20.props.resultModalType),
		["screenSize"] = p20.props.screenSize
	}
	local v24 = {}
	local v25 = {}
	local v26 = {
		["buttonType"] = v_u_4.PrimarySystem,
		["props"] = {
			["onActivated"] = p20.props.closeResultModal,
			["text"] = v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"),
			["inputIcon"] = p20.state.isGamepad and v_u_7 or nil
		}
	}
	__set_list(v25, 1, {v26})
	v24.buttons = v25
	v23.buttonStackInfo = v24
	return v21(v22, v23)
end
return v9.connect(function(p27) -- name: mapStateToProps
	return {
		["resultModalType"] = p27.promptRequest.resultModalType
	}
end, function(p_u_28) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_14
	return {
		["closeResultModal"] = function() -- name: closeResultModal
			-- upvalues: (copy) p_u_28, (ref) v_u_14
			return p_u_28(v_u_14)
		end
	}
end)(v16)