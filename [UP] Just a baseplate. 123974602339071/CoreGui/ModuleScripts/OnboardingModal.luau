-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.OnboardingModal
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Packages.Signals)
local v_u_6 = require(v1.Workspace.Packages.Display)
local v_u_7 = game:GetService("ExperienceStateCaptureService")
local v8 = script.Parent.Parent
local v_u_9 = require(v8.Components.PortedComponents.ThemedTextLabel)
local v_u_10 = require(v8.Components.ModalDialog)
local v_u_11 = v2.App.Button.ButtonStack
local v_u_12 = v2.App.Button.Enum.ButtonType
local v_u_13 = require(v8.Thunks.ShowOnboardingModalThunk)
local v_u_14 = require(v1.Workspace.Packages.Localization).withLocalization
local v15 = v_u_3.PureComponent:extend("OnboardingModal")
local v_u_16 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local v17 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_18 = require(v17.Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)
function v15.init(p_u_19) -- name: init
	-- upvalues: (copy) v_u_7, (copy) v_u_16, (copy) v_u_6, (copy) v_u_5
	function p_u_19.onDismiss()
		-- upvalues: (copy) p_u_19
		p_u_19.props.showOnboardingModal(false)
	end
	function p_u_19.onCancel()
		-- upvalues: (ref) v_u_7
		v_u_7:ToggleCaptureMode()
	end
	if v_u_16 then
		local v_u_20 = v_u_6.GetDisplayStore(false).getViewportSize
		p_u_19.disposeScreenSize = v_u_5.createEffect(function(p21)
			-- upvalues: (copy) p_u_19, (copy) v_u_20
			p_u_19:setState({
				["screenSize"] = v_u_20(p21)
			})
		end)
	end
end
function v15.willUnmount(p22) -- name: willUnmount
	-- upvalues: (copy) v_u_16
	if v_u_16 then
		p22.disposeScreenSize()
	end
end
function v15.render(p_u_23) -- name: render
	-- upvalues: (copy) v_u_14, (copy) v_u_18, (copy) v_u_3, (copy) v_u_10, (copy) v_u_16, (copy) v_u_11, (copy) v_u_12, (copy) v_u_9
	return v_u_14({
		["mainHeader"] = "CoreScripts.Feedback.Onboarding.MainHeader",
		["instructionLabel"] = nil,
		["cancel"] = "CoreScripts.Feedback.Onboarding.Cancel",
		["start"] = "CoreScripts.Feedback.Onboarding.Start",
		["instructionLabel"] = v_u_18() and "CoreScripts.Feedback.Onboarding.InstructionsWithImage" or "CoreScripts.Feedback.Onboarding.Instructions"
	})(function(p24)
		-- upvalues: (ref) v_u_3, (ref) v_u_10, (copy) p_u_23, (ref) v_u_16, (ref) v_u_11, (ref) v_u_12, (ref) v_u_9
		local v25 = v_u_3.createElement
		local v26 = v_u_10
		local v27 = {
			["visible"] = nil,
			["screenSize"] = nil,
			["titleText"] = nil,
			["maxHeight"] = 200,
			["maxWidth"] = 540,
			["showCloseButton"] = true,
			["actionButtons"] = nil,
			["contents"] = nil,
			["onDismiss"] = nil,
			["visible"] = p_u_23.props.visible
		}
		local v28
		if v_u_16 then
			v28 = p_u_23.state.screenSize
		else
			v28 = p_u_23.props.screenSize
		end
		v27.screenSize = v28
		v27.titleText = p24.mainHeader
		local v29 = v_u_3.createElement
		local v30 = v_u_11
		local v31 = {
			["buttonHeight"] = 36,
			["buttons"] = nil
		}
		local v32 = {}
		local v33 = {
			["buttonType"] = v_u_12.Secondary,
			["props"] = {
				["onActivated"] = p_u_23.onCancel,
				["text"] = p24.cancel
			}
		}
		local v34 = {
			["buttonType"] = v_u_12.PrimarySystem,
			["props"] = {
				["isDisabled"] = false,
				["onActivated"] = nil,
				["text"] = nil,
				["onActivated"] = p_u_23.onDismiss,
				["text"] = p24.start
			}
		}
		__set_list(v32, 1, {v33, v34})
		v31.buttons = v32
		v27.actionButtons = v29(v30, v31)
		local v35 = v_u_3.createElement
		local v36 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromScale(1, 1)
		}
		local v37 = {
			["Padding"] = v_u_3.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 24),
				["PaddingRight"] = UDim.new(0, 24),
				["PaddingBottom"] = UDim.new(0, 24)
			}),
			["Layout"] = v_u_3.createElement("UIListLayout", {
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Top
			}),
			["InstructionLabel"] = v_u_3.createElement(v_u_9, {
				["LayoutOrder"] = 1,
				["fontKey"] = "Body",
				["themeKey"] = "TextDefault",
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["TextWrapped"] = true,
				["TextXAlignment"] = nil,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new(0, 76, 0.5, 0),
				["Size"] = UDim2.new(1, 0, 0.4, 36),
				["Text"] = p24.instructionLabel,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
		}
		v27.contents = v35("Frame", v36, v37)
		v27.onDismiss = p_u_23.onDismiss
		return v25(v26, v27)
	end)
end
return v4.connect(function(p38)
	-- upvalues: (copy) v_u_16
	local v39 = {}
	local v40
	if v_u_16 then
		v40 = nil
	else
		v40 = p38.displayOptions.screenSize
	end
	v39.screenSize = v40
	v39.visible = p38.common.showOnboardingModal
	return v39
end, function(p_u_41)
	-- upvalues: (copy) v_u_13
	return {
		["showOnboardingModal"] = function(p42) -- name: showOnboardingModal
			-- upvalues: (copy) p_u_41, (ref) v_u_13
			p_u_41(v_u_13(p42))
		end
	}
end)(v15)