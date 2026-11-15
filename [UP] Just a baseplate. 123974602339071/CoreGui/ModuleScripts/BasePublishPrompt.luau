-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.BasePublishPrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("ExperienceAuthService")
local v_u_4 = game:GetService("ContextActionService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("GuiService")
local v_u_8 = require(v1.Packages.Signals)
local v_u_9 = require(v1.Workspace.Packages.Display)
local v_u_10 = require(v1.Packages.Roact)
local v11 = require(v1.Packages.RoactRodux)
local v12 = require(v1.Packages.t)
local v13 = v2:WaitForChild("RobloxGui")
local v_u_14 = require(v1.Workspace.Packages.RobloxTranslator)
local v15 = require(v1.Packages.UIBlox)
local v16 = require(v1.Packages.Foundation)
local v_u_17 = v16.Utility.normalizeFontFace
local v_u_18 = v16.Utility.Flags.FoundationFontFaceMigration
local v_u_19 = v15.Style.withStyle
local v_u_20 = v15.App.Dialog.Modal.FullPageModal
local v_u_21 = v15.App.Dialog.Overlay
local v_u_22 = v15.App.Button.Enum.ButtonType
local v_u_23 = require(v1.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local v_u_24 = require(v1.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v_u_25 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_26 = require(v1.Workspace.Packages.InputType)
local v_u_27 = require(v1.Workspace.Packages.InputType).getInputGroup
local v28 = script.Parent
local v_u_29 = require(v28.Common.LabeledTextBox)
local v_u_30 = require(script.Parent.Parent.Actions.CloseOpenPrompt)
local v_u_31 = require(script.Parent.Parent.Actions.SetPromptVisibility)
local v_u_32 = require(script.Parent.LeaveCreationAlert)
local v_u_33 = require(script.Parent.Parent.Constants)
local v_u_34 = require(v13.Modules.TopBar.Constants)
local v_u_35 = require(v28.Common.PreviewViewport)
local v_u_36 = require(v28.ValidationErrorModal)
local v_u_37 = require(v1.Workspace.Packages.PurchasePrompt).PublishAssetAnalytics
local v38 = v_u_10.PureComponent:extend("BasePublishPrompt")
local v_u_39 = UDim.new(1.5, 0)
v38.validateProps = v12.strictInterface({
	["screenSize"] = v12.Vector2,
	["nameLabel"] = v12.string,
	["defaultName"] = v12.string,
	["promptBody"] = v12.any,
	["titleText"] = v12.string,
	["showingPreviewView"] = v12.boolean,
	["closePreviewView"] = v12.callback,
	["isMakeupPreview"] = v12.optional(v12.boolean),
	["asset"] = v12.optional(v12.union(v12.instanceOf("Model"), v12.instanceIsA("AnimationClip"))),
	["onNameUpdated"] = v12.callback,
	["canSubmit"] = v12.callback,
	["onSubmit"] = v12.callback,
	["enableInputDelayed"] = v12.optional(v12.boolean),
	["isDelayedInput"] = v12.optional(v12.boolean),
	["delayInputSeconds"] = v12.optional(v12.number),
	["priceInRobux"] = v12.optional(v12.number),
	["showTopScrim"] = v12.optional(v12.boolean),
	["guid"] = v12.any,
	["scopes"] = v12.any,
	["errorMessage"] = v12.optional(v12.string),
	["promptVisible"] = v12.optional(v12.boolean),
	["closePrompt"] = v12.callback,
	["SetPromptVisibility"] = v12.callback
})
function v38.init(p_u_40) -- name: init
	-- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_5, (copy) v_u_27, (copy) v_u_26, (copy) v_u_37, (copy) v_u_3
	p_u_40.swipeScrollingFrameRef = v_u_10.createRef()
	p_u_40.inputState = nil
	p_u_40.inputObject = nil
	p_u_40.connection = nil
	p_u_40.disposeUiScaleEffect = v_u_8.createEffect(function(p41)
		-- upvalues: (ref) v_u_9, (copy) p_u_40
		p_u_40:setState({
			["UiScale"] = v_u_9.GetDisplayStore(p41).getUIScale(p41)
		})
	end)
	function p_u_40.storeInput(_, p42, p43)
		-- upvalues: (copy) p_u_40
		p_u_40.inputState = p42
		p_u_40.inputObject = p43
		return Enum.ContextActionResult.Sink
	end
	p_u_40:setState({
		["showUnsavedDataWarning"] = false,
		["isGamepad"] = nil,
		["isGamepad"] = v_u_27((v_u_5:GetLastInputType())) == v_u_26.InputTypeConstants.Gamepad
	})
	function p_u_40.closePrompt()
		-- upvalues: (copy) p_u_40
		p_u_40.props.closePrompt()
		p_u_40.props.SetPromptVisibility(false)
	end
	function p_u_40.showUnsavedDataWarning()
		-- upvalues: (copy) p_u_40, (ref) v_u_37
		p_u_40:setState({
			["showUnsavedDataWarning"] = true
		})
		v_u_37.sendButtonClicked(v_u_37.Section.BuyCreationPage, v_u_37.Element.X)
	end
	function p_u_40.cancelClosePrompt()
		-- upvalues: (copy) p_u_40
		p_u_40:setState({
			["showUnsavedDataWarning"] = false
		})
	end
	function p_u_40.denyAndClose()
		-- upvalues: (ref) v_u_3, (copy) p_u_40
		v_u_3:ScopeCheckUIComplete(p_u_40.props.guid, p_u_40.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {})
		p_u_40.closePrompt()
	end
	function p_u_40.confirmAndUpload()
		-- upvalues: (copy) p_u_40
		if p_u_40.props.canSubmit() then
			p_u_40.props.onSubmit()
		end
	end
end
function v38.setUpGamepad(p_u_44) -- name: setUpGamepad
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_23, (copy) v_u_39
	if v_u_5.GamepadEnabled then
		v_u_4:UnbindCoreAction("ScrollPrompt")
		v_u_4:BindCoreAction("ScrollPrompt", p_u_44.storeInput, false, Enum.KeyCode.Thumbstick2)
		p_u_44.connection = v_u_6.RenderStepped:Connect(function(p45)
			-- upvalues: (copy) p_u_44, (ref) v_u_23, (ref) v_u_39
			if p_u_44.inputState == Enum.UserInputState.Change and p_u_44.inputObject then
				local v46 = p_u_44.inputObject.Position
				local v47 = p_u_44.swipeScrollingFrameRef.current
				local v48 = v47.CanvasPosition.Y + p45 * -v_u_23.normalizeStickByDeadzone(v46).Y * 1000
				if v48 <= v47.AbsoluteSize.Y * v_u_39.Scale + v_u_39.Offset then
					v47.CanvasPosition = Vector2.new(0, v48)
				end
			end
		end)
		v_u_4:UnbindCoreAction("ClosePrompt")
		v_u_4:BindCoreAction("ClosePrompt", p_u_44.storeInput, false, Enum.KeyCode.ButtonB)
	end
end
function v38.cleanupGamepad(p49) -- name: cleanupGamepad
	-- upvalues: (copy) v_u_4
	v_u_4:UnbindCoreAction("ClosePrompt")
	v_u_4:UnbindCoreAction("ScrollPrompt")
	if p49.connection then
		p49.connection:Disconnect()
	end
end
function v38.overrideMouseIconBehavior(p50) -- name: overrideMouseIconBehavior
	-- upvalues: (copy) v_u_24
	local v51
	if p50.state.isGamepad then
		v51 = Enum.OverrideMouseIconBehavior.ForceHide
	else
		v51 = Enum.OverrideMouseIconBehavior.ForceShow
	end
	v_u_24.push("BasePublishPromptOverrideKey", v51)
end
function v38.removeMouseIconBehaviorOverride(_) -- name: removeMouseIconBehaviorOverride
	-- upvalues: (copy) v_u_24
	v_u_24.pop("BasePublishPromptOverrideKey")
end
function v38.didMount(p52) -- name: didMount
	p52:setUpGamepad()
	p52.props.SetPromptVisibility(true)
	p52:overrideMouseIconBehavior()
end
function v38.didUpdate(p53, p54, p55) -- name: didUpdate
	if p54.promptVisible ~= p53.props.promptVisible and p53.props.promptVisible == false then
		p53.closePrompt()
	end
	if p53.state.isGamepad ~= p55.isGamepad then
		p53:overrideMouseIconBehavior()
	end
end
function v38.renderMiddle(p_u_56, p_u_57) -- name: renderMiddle
	-- upvalues: (copy) v_u_19, (copy) v_u_10, (copy) v_u_33, (copy) v_u_29, (copy) v_u_18, (copy) v_u_17
	return v_u_19(function(p58)
		-- upvalues: (ref) v_u_10, (copy) p_u_56, (ref) v_u_33, (ref) v_u_29, (copy) p_u_57, (ref) v_u_18, (ref) v_u_17
		local v59 = p58.Font
		local v60 = v59.BaseSize
		local v61 = p58.Theme
		local v62 = v59.Footer
		local v63 = v61.TextDefault.Color
		local v64 = v_u_10.createFragment
		local v65 = {
			["ScrollingFrame"] = v_u_10.createElement("ScrollingFrame", {
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, -50),
				["CanvasSize"] = UDim2.new(1, 0, 0, 0),
				["ScrollBarThickness"] = 0,
				["ScrollingDirection"] = Enum.ScrollingDirection.Y,
				["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
				["Selectable"] = false,
				[v_u_10.Ref] = p_u_56.swipeScrollingFrameRef
			}, {
				["layout"] = v_u_10.createElement("UIListLayout", {
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Vertical
				}),
				["padding"] = v_u_10.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, v_u_33.PromptSidePadding),
					["PaddingRight"] = UDim.new(0, v_u_33.PromptSidePadding)
				}),
				["NameInput"] = v_u_10.createElement(v_u_29, {
					["LayoutOrder"] = 1,
					["labelText"] = nil,
					["topPadding"] = 24,
					["defaultText"] = nil,
					["onTextUpdated"] = nil,
					["textBoxHeight"] = 30,
					["labelText"] = p_u_56.props.nameLabel,
					["defaultText"] = p_u_56.props.defaultName,
					["onTextUpdated"] = p_u_56.props.onNameUpdated
				}),
				["PromptBody"] = v_u_10.createElement("Frame", {
					["Size"] = nil,
					["AutomaticSize"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 2,
					["Size"] = UDim2.fromScale(1, 0),
					["AutomaticSize"] = Enum.AutomaticSize.Y
				}, p_u_56.props.promptBody)
			}),
			["BottomGradient"] = v_u_10.createElement("Frame", {
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 0,
				["BorderSizePixel"] = 0,
				["ZIndex"] = 2,
				["Size"] = UDim2.new(1, 0, 0, 5),
				["AnchorPoint"] = Vector2.new(0, 1),
				["Position"] = UDim2.new(0, 0, 1, -50),
				["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			}, {
				["gradient"] = v_u_10.createElement("UIGradient", {
					["Rotation"] = 270,
					["Color"] = nil,
					["Transparency"] = nil,
					["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v61.BackgroundUIDefault.Color), ColorSequenceKeypoint.new(1, v61.BackgroundUIDefault.Color) }),
					["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, v61.BackgroundUIDefault.Transparency), NumberSequenceKeypoint.new(0.5, v61.BackgroundUIDefault.Transparency), NumberSequenceKeypoint.new(1, 1) })
				})
			})
		}
		local v66 = v_u_10.createElement
		local v67 = "Frame"
		local v68 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 50),
			["Position"] = UDim2.new(0, 0, 1, -50)
		}
		local v69 = {
			["padding"] = v_u_10.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, v_u_33.PromptSidePadding),
				["PaddingRight"] = UDim.new(0, v_u_33.PromptSidePadding)
			})
		}
		local v70 = v_u_10.createElement
		local v71 = "TextLabel"
		local v72 = {
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["TextWrapped"] = true,
			["Size"] = UDim2.fromScale(1, 1),
			["Text"] = p_u_57.disclaimer
		}
		local v73
		if v_u_18 then
			v73 = nil
		else
			v73 = v62.Font
		end
		v72.Font = v73
		local v74
		if v_u_18 then
			v74 = v_u_17(p58.Tokens.Typography.CaptionSmall.Font)
		else
			v74 = nil
		end
		v72.FontFace = v74
		v72.TextSize = v60 * v62.RelativeSize
		v72.TextColor3 = v63
		v69.Disclaimer = v70(v71, v72)
		v65.DisclaimerContainer = v66(v67, v68, v69)
		return v64(v65)
	end)
end
function v38.renderAlertLocalized(p_u_75, p_u_76) -- name: renderAlertLocalized
	-- upvalues: (copy) v_u_7, (copy) v_u_34, (copy) v_u_19, (copy) v_u_10, (copy) v_u_25, (copy) v_u_5, (copy) v_u_27, (copy) v_u_26, (copy) v_u_21, (copy) v_u_20, (copy) v_u_22, (copy) v_u_32, (copy) v_u_36, (copy) v_u_35
	local v77, _ = v_u_7:GetGuiInset()
	local v_u_78 = UDim2.new(0, 0, 0, -v77.Y)
	local v_u_79 = UDim2.new(1, 0, 1, v77.Y)
	local v_u_80 = v_u_34.TopBarHeight * p_u_75.state.UiScale
	return v_u_19(function(p81)
		-- upvalues: (copy) p_u_75, (copy) p_u_76, (ref) v_u_10, (ref) v_u_25, (ref) v_u_5, (ref) v_u_27, (ref) v_u_26, (copy) v_u_78, (copy) v_u_79, (ref) v_u_21, (copy) v_u_80, (ref) v_u_20, (ref) v_u_22, (ref) v_u_32, (ref) v_u_36, (ref) v_u_35
		local v82 = p81.Theme
		local v83
		if p_u_75.props.priceInRobux and p_u_75.props.priceInRobux > 0 then
			v83 = string.format("%s %i", "\238\128\130", p_u_75.props.priceInRobux)
		else
			v83 = p_u_76.submit
		end
		local v84 = v_u_10.createFragment
		local v86 = {
			["LastInputTypeConnection"] = v_u_10.createElement(v_u_25, {
				["event"] = v_u_5.LastInputTypeChanged,
				["callback"] = function(p85) -- name: callback
					-- upvalues: (ref) p_u_75, (ref) v_u_27, (ref) v_u_26
					p_u_75:setState({
						["isGamepad"] = v_u_27(p85) == v_u_26.InputTypeConstants.Gamepad
					})
				end
			}),
			["BottomScrim"] = v_u_10.createElement("Frame", {
				["Position"] = nil,
				["Size"] = nil,
				["ZIndex"] = -1,
				["BackgroundTransparency"] = 1,
				["Position"] = v_u_78,
				["Size"] = v_u_79
			}, {
				["Overlay"] = v_u_10.createElement(v_u_21, {
					["showGradient"] = false
				}),
				["InputSink"] = v_u_10.createElement("TextButton", {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Text"] = "",
					["Modal"] = true,
					["Size"] = UDim2.fromScale(1, 1)
				})
			})
		}
		local v87 = v_u_10.createElement
		local v88 = "Frame"
		local v89 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Visible"] = nil,
			["Size"] = UDim2.new(1, 0, 1, -v_u_80),
			["Position"] = UDim2.fromOffset(0, v_u_80)
		}
		local v90 = not (p_u_75.state.showUnsavedDataWarning or p_u_75.props.showingPreviewView)
		if v90 then
			v90 = not p_u_75.props.showTopScrim
		end
		v89.Visible = v90
		local v91 = {}
		local v92 = v_u_10.createElement
		local v93 = v_u_20
		local v94 = {
			["title"] = nil,
			["onCloseClicked"] = nil,
			["distanceFromTop"] = 4,
			["marginSize"] = 0,
			["screenSize"] = nil,
			["buttonStackProps"] = nil,
			["title"] = p_u_75.props.titleText,
			["onCloseClicked"] = p_u_75.showUnsavedDataWarning,
			["screenSize"] = p_u_75.props.screenSize
		}
		local v95 = {
			["buttons"] = nil,
			["disableRoactGamepadButtonSelection"] = true,
			["buttons"] = {
				{
					["buttonType"] = v_u_22.PrimarySystem,
					["props"] = {
						["isDisabled"] = not p_u_75.props.canSubmit(),
						["isDelayedInput"] = p_u_75.props.isDelayedInput,
						["enableInputDelayed"] = p_u_75.props.enableInputDelayed,
						["delayInputSeconds"] = p_u_75.props.delayInputSeconds,
						["onActivated"] = p_u_75.confirmAndUpload,
						["text"] = v83,
						["isLoading"] = not p_u_75.props.priceInRobux
					}
				}
			}
		}
		v94.buttonStackProps = v95
		v91.FullPageModal = v92(v93, v94, {
			["middleContent"] = p_u_75:renderMiddle(p_u_76)
		})
		v86.PublishPrompt = v87(v88, v89, v91)
		local v96
		if p_u_75.state.showUnsavedDataWarning then
			v96 = v_u_10.createElement(v_u_32, {
				["screenSize"] = p_u_75.props.screenSize,
				["closePrompt"] = p_u_75.denyAndClose,
				["cancelClosePrompt"] = p_u_75.cancelClosePrompt
			})
		else
			v96 = nil
		end
		v86.LeaveCreationAlert = v96
		local v97
		if p_u_75.props.errorMessage then
			v97 = v_u_10.createElement(v_u_36, {
				["screenSize"] = p_u_75.props.screenSize,
				["closePrompt"] = p_u_75.closePrompt
			})
		else
			v97 = nil
		end
		v86.ValidationErrorAlert = v97
		local v98
		if p_u_75.props.showingPreviewView then
			v98 = v_u_10.createElement("Frame", {
				["Size"] = UDim2.new(1, 0, 1, 0),
				["BackgroundColor3"] = v82.BackgroundUIDefault.Color,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["BackgroundTransparency"] = v82.BackgroundUIDefault.Transparency
			}, {
				["PreviewViewport"] = v_u_10.createElement(v_u_35, {
					["asset"] = p_u_75.props.asset,
					["closePreviewView"] = p_u_75.props.closePreviewView,
					["isMakeupPreview"] = p_u_75.props.isMakeupPreview
				})
			}) or nil
		else
			v98 = nil
		end
		v86.PreviewFrame = v98
		v86.TopScrim = v_u_10.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["ZIndex"] = 2,
			["BackgroundTransparency"] = 1,
			["Visible"] = nil,
			["Position"] = v_u_78,
			["Size"] = v_u_79,
			["Visible"] = p_u_75.props.showTopScrim
		}, {
			["InputSink"] = v_u_10.createElement("TextButton", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Text"] = "",
				["Size"] = UDim2.fromScale(1, 1)
			})
		})
		return v84(v86)
	end)
end
function v38.render(p99) -- name: render
	-- upvalues: (copy) v_u_14
	return p99:renderAlertLocalized({
		["submit"] = v_u_14:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"),
		["disclaimer"] = v_u_14:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
	})
end
function v38.willUnmount(p100) -- name: willUnmount
	p100:removeMouseIconBehaviorOverride()
	p100:cleanupGamepad()
	if p100.disposeUiScaleEffect then
		p100.disposeUiScaleEffect()
	end
	p100.props.SetPromptVisibility(false)
end
return v11.connect(function(p101) -- name: mapStateToProps
	return {
		["guid"] = p101.promptRequest.promptInfo.guid,
		["scopes"] = p101.promptRequest.promptInfo.scopes,
		["errorMessage"] = p101.promptRequest.promptInfo.errorMessage,
		["promptVisible"] = p101.promptRequest.promptInfo.promptVisible
	}
end, function(p_u_102) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_30, (copy) v_u_31
	return {
		["closePrompt"] = function() -- name: closePrompt
			-- upvalues: (copy) p_u_102, (ref) v_u_30
			return p_u_102(v_u_30())
		end,
		["SetPromptVisibility"] = function(p103) -- name: SetPromptVisibility
			-- upvalues: (copy) p_u_102, (ref) v_u_31
			return p_u_102(v_u_31(p103))
		end
	}
end)(v38)