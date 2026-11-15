-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.ReportSentDialog
local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v4 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_5 = require(v2.Packages.Roact)
local v6 = require(v2.Packages.RoactRodux)
local v7 = require(v2.Packages.UIBlox)
local v8 = require(v2.Packages.t)
local v_u_9 = v7.Core.Style.withStyle
local v_u_10 = require(v4.Modules.VoiceChat.VoiceChatServiceManager).default
local v11 = script.Parent.Parent
local v12 = require(v11.Dependencies)
local v_u_13 = require(v12.FocusHandler)
local v14 = require(v12.playerInterface)
local v_u_15 = require(v12.Divider)
local v_u_16 = require(v12.ThemedTextLabel)
local v_u_17 = require(v12.withLocalization)
local v_u_18 = v7.App.Button.Button
local v_u_19 = v7.App.Button.Enum.ButtonType
local v_u_20 = require(v11.Thunks.BlockPlayer)
local v_u_21 = require(v11.Components.BlockPlayerItem)
local v_u_22 = require(v11.Actions.EndReportFlow)
require(v11.Actions.OpenBlockPlayerDialog)
local v_u_23 = require(v11.Actions.ShowToast)
local v_u_24 = require(v11.Resources.Constants)
local v_u_25 = require(v11.Resources.Assets)
local v_u_26 = require(v11.Components.ModalDialog)
local v_u_27 = require(v4.Modules.VoiceChat.Constants)
local v28 = v_u_5.PureComponent:extend("ReportSentDialog")
v28.validateProps = v8.strictInterface({
	["isReportSentOpen"] = v8.boolean,
	["screenSize"] = v8.Vector2,
	["inputType"] = v8.optional(v8.string),
	["reportType"] = v8.optional(v8.valueOf(v_u_24.ReportType)),
	["targetPlayer"] = v8.optional(v14),
	["blockPlayer"] = v8.callback,
	["showToast"] = v8.callback,
	["closeDialog"] = v8.callback,
	["reportCategory"] = v8.optional(v8.string)
})
function isPlayerUserIdMuted(p29) -- name: isPlayerUserIdMuted
	-- upvalues: (copy) v_u_10
	local v30 = false
	if v_u_10.participants then
		local v31 = v_u_10.participants[tostring(p29)]
		if v31 then
			v30 = v31.isMutedLocally
		end
	end
	return v30
end
function v28.init(p_u_32) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_27
	p_u_32:clearState()
	p_u_32.buttonRef = v_u_5.createRef()
	function p_u_32.onBlockCheckBoxActivated(p33)
		-- upvalues: (copy) p_u_32
		p_u_32:setState({
			["isBlockCheckBoxSelected"] = p33,
			["isMuteCheckBoxSelected"] = p33 and p_u_32:isVoiceReport() and true or p_u_32.state.isMuteCheckBoxSelected
		})
	end
	function p_u_32.onMuteCheckBoxActivated(p34)
		-- upvalues: (copy) p_u_32
		p_u_32:setState({
			["isMuteCheckBoxSelected"] = p34
		})
	end
	function p_u_32.hasMuteChanged()
		-- upvalues: (copy) p_u_32
		return p_u_32.state.isMuteCheckBoxSelected ~= p_u_32.state.wasPlayerMutedWhenDialogOpened
	end
	function p_u_32.getToastMessage(p35)
		-- upvalues: (copy) p_u_32
		local v36 = {
			["title"] = p35.toastDefaultTitle,
			["description"] = p35.toastDefaultDescription
		}
		if p_u_32.state.isMuteCheckBoxSelected and p_u_32.state.isBlockCheckBoxSelected then
			v36.title = p35.toastMutedAndBlockedTitle
			v36.description = p35.toastMutedAndBlockedDescription
			return v36
		end
		if not p_u_32.state.isMuteCheckBoxSelected then
			if p_u_32.state.isBlockCheckBoxSelected then
				v36.title = p35.toastBlockedTitle
				v36.description = p35.toastBlockedDescription
			end
			return v36
		end
		v36.title = p35.toastMutedTitle
		v36.description = p35.toastMutedDescription
		return v36
	end
	function p_u_32.onConfirm(p37)
		-- upvalues: (copy) p_u_32, (ref) v_u_10, (ref) v_u_27
		if p_u_32:isReportingPlayer() then
			local v38 = p_u_32.getToastMessage(p37)
			if p_u_32:hasMuteChanged() then
				v_u_10:ToggleMutePlayer(p_u_32.props.targetPlayer.UserId, v_u_27.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
			if p_u_32.state.isBlockCheckBoxSelected then
				p_u_32.props.blockPlayer(p_u_32.props.targetPlayer, v38.title, v38.description)
			else
				p_u_32.props.showToast(v38.title, v38.description)
			end
		end
		p_u_32.props.closeDialog()
		p_u_32:clearState()
	end
	function p_u_32.onCancel()
		-- upvalues: (copy) p_u_32
		p_u_32.props.closeDialog()
		p_u_32:clearState()
	end
end
function v28.clearState(p39) -- name: clearState
	p39:setState({
		["wasPlayerMutedWhenDialogOpened"] = false,
		["isMuteCheckBoxSelected"] = false,
		["isBlockCheckBoxSelected"] = false
	})
end
function v28.isVoiceReport(p40) -- name: isVoiceReport
	-- upvalues: (copy) v_u_24
	local v41 = p40:isReportingPlayer()
	if v41 then
		v41 = p40.props.reportCategory == v_u_24.Category.Voice
	end
	return v41
end
function v28.doesRequireConfirmation(p42) -- name: doesRequireConfirmation
	return p42.state.isBlockCheckBoxSelected or p42:hasMuteChanged()
end
function v28.isReportingPlayer(p43) -- name: isReportingPlayer
	-- upvalues: (copy) v_u_24
	local v44
	if p43.props.reportType == v_u_24.ReportType.Player then
		v44 = p43.props.targetPlayer ~= nil
	else
		v44 = false
	end
	return v44
end
function v28.renderFocusHandler(p_u_45) -- name: renderFocusHandler
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_24, (copy) v_u_3, (copy) v_u_1
	local v46 = v_u_5.createElement
	local v47 = v_u_13
	local v48 = {}
	local v49
	if p_u_45.props.inputType == v_u_24.InputType.Gamepad then
		v49 = p_u_45.props.isReportSentOpen
	else
		v49 = false
	end
	v48.isFocused = v49
	function v48.didFocus() -- name: didFocus
		-- upvalues: (ref) v_u_3, (copy) p_u_45, (ref) v_u_1
		v_u_3:RemoveSelectionGroup("ReportSentDialogGroup")
		v_u_3:AddSelectionParent("ReportSentDialogGroup", p_u_45.buttonRef:getValue())
		v_u_3.SelectedCoreObject = p_u_45.buttonRef:getValue()
		v_u_1:BindCoreAction("ReporSentDialogSinkAction", function(_, _)
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX)
	end
	function v48.didBlur() -- name: didBlur
		-- upvalues: (ref) v_u_1, (ref) v_u_3
		v_u_1:UnbindCoreAction("ReporSentDialogSinkAction")
		v_u_3:RemoveSelectionGroup("ReportSentDialogGroup")
	end
	return v46(v47, v48)
end
function v28.renderBlockFrame(p_u_50) -- name: renderBlockFrame
	-- upvalues: (copy) v_u_17, (copy) v_u_5, (copy) v_u_15, (copy) v_u_21, (copy) v_u_25
	if p_u_50:isReportingPlayer() then
		return v_u_17({
			["mutePlayerText"] = "CoreScripts.InGameMenu.Report.Mute",
			["mutePlayerDescription"] = "CoreScripts.InGameMenu.Report.MuteDescription",
			["blockPlayerText"] = "CoreScripts.InGameMenu.Report.Block",
			["blockPlayerDescription"] = "CoreScripts.InGameMenu.Report.BlockDescription"
		})(function(p51)
			-- upvalues: (ref) v_u_5, (ref) v_u_15, (copy) p_u_50, (ref) v_u_21, (ref) v_u_25
			local v52 = v_u_5.createElement
			local v53 = "Frame"
			local v54 = {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0)
			}
			local v55 = {
				["Layout"] = v_u_5.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				}),
				["Divider"] = v_u_5.createElement(v_u_15, {
					["LayoutOrder"] = 1,
					["Size"] = nil,
					["Size"] = UDim2.new(1, 0, 0, 1)
				})
			}
			local v56
			if p_u_50:isVoiceReport() then
				v56 = v_u_5.createElement(v_u_21, {
					["layoutOrder"] = 2,
					["size"] = nil,
					["text"] = nil,
					["description"] = nil,
					["icon"] = nil,
					["iconSize"] = nil,
					["isDisabled"] = nil,
					["isCheckBoxSelected"] = nil,
					["onCheckBoxActivated"] = nil,
					["size"] = UDim2.new(1, 0, 0, 72),
					["text"] = p51.mutePlayerText,
					["description"] = p51.mutePlayerDescription,
					["icon"] = v_u_25.Images.MuteIcon.Image,
					["iconSize"] = v_u_25.Images.MuteIcon.Size,
					["isDisabled"] = p_u_50.state.isBlockCheckBoxSelected,
					["isCheckBoxSelected"] = p_u_50.state.isMuteCheckBoxSelected,
					["onCheckBoxActivated"] = p_u_50.onMuteCheckBoxActivated
				})
			else
				v56 = nil
			end
			v55.MutePlayerItem = v56
			v55.BlockPlayerItem = v_u_5.createElement(v_u_21, {
				["layoutOrder"] = 3,
				["size"] = nil,
				["text"] = nil,
				["description"] = nil,
				["icon"] = nil,
				["iconSize"] = nil,
				["isCheckBoxSelected"] = nil,
				["onCheckBoxActivated"] = nil,
				["size"] = UDim2.new(1, 0, 0, 72),
				["text"] = p51.blockPlayerText,
				["description"] = p51.blockPlayerDescription,
				["icon"] = v_u_25.Images.BlockIcon.Image,
				["iconSize"] = v_u_25.Images.BlockIcon.Size,
				["isCheckBoxSelected"] = p_u_50.state.isBlockCheckBoxSelected,
				["onCheckBoxActivated"] = p_u_50.onBlockCheckBoxActivated
			})
			return v52(v53, v54, v55)
		end)
	else
		return nil
	end
end
function v28.renderContents(p_u_57) -- name: renderContents
	-- upvalues: (copy) v_u_9, (copy) v_u_17, (copy) v_u_5, (copy) v_u_16
	return v_u_9(function(_)
		-- upvalues: (ref) v_u_17, (copy) p_u_57, (ref) v_u_5, (ref) v_u_16
		local v58 = v_u_17
		local v59 = {
			["bodyText"] = "CoreScripts.InGameMenu.Report.ThanksForReportDescription",
			["otherStepsText"] = nil,
			["otherStepsText"] = {
				"CoreScripts.InGameMenu.Report.OtherStepsTitle",
				["RBX_NAME"] = p_u_57.props.targetPlayer.Name
			}
		}
		return v58(v59)(function(p60)
			-- upvalues: (ref) v_u_5, (ref) v_u_16, (ref) p_u_57
			local v61 = v_u_5.createElement
			local v62 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0)
			}
			local v63 = {
				["Layout"] = v_u_5.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				})
			}
			local v64 = v_u_5.createElement
			local v65 = {
				["BackgroundTransparency"] = 1,
				["AutomaticSize"] = nil,
				["Size"] = nil,
				["LayoutOrder"] = 1,
				["AutomaticSize"] = Enum.AutomaticSize.XY,
				["Size"] = UDim2.new(1, 0, 0, 0)
			}
			local v66 = {
				["Layout"] = v_u_5.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["Padding"] = UDim.new(0, 12)
				}),
				["Padding"] = v_u_5.createElement("UIPadding", {
					["PaddingTop"] = UDim.new(0, 12),
					["PaddingBottom"] = UDim.new(0, 12),
					["PaddingLeft"] = UDim.new(0, 24),
					["PaddingRight"] = UDim.new(0, 24)
				}),
				["BodyText"] = v_u_5.createElement(v_u_16, {
					["LayoutOrder"] = 1,
					["AutomaticSize"] = nil,
					["Size"] = nil,
					["themeKey"] = "TextEmphasis",
					["Text"] = nil,
					["TextWrapped"] = true,
					["TextXAlignment"] = nil,
					["AutomaticSize"] = Enum.AutomaticSize.Y,
					["Size"] = UDim2.new(1, 0, 0, 0),
					["Text"] = p60.bodyText,
					["TextXAlignment"] = Enum.TextXAlignment.Left
				}),
				["OtherStepsText"] = v_u_5.createElement(v_u_16, {
					["LayoutOrder"] = 2,
					["AutomaticSize"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["fontKey"] = "Footer",
					["themeKey"] = "TextDefault",
					["Text"] = nil,
					["TextWrapped"] = true,
					["TextXAlignment"] = nil,
					["AutomaticSize"] = Enum.AutomaticSize.Y,
					["Position"] = UDim2.new(0, 0, 0, 12),
					["Size"] = UDim2.new(1, 0, 0, 0),
					["Text"] = p60.otherStepsText,
					["TextXAlignment"] = Enum.TextXAlignment.Left
				})
			}
			v63.BodyFrame = v64("Frame", v65, v66)
			v63.BlockFrame = p_u_57:renderBlockFrame()
			return v61("Frame", v62, v63)
		end)
	end)
end
function v28.render(p_u_67) -- name: render
	-- upvalues: (copy) v_u_17, (copy) v_u_5, (copy) v_u_26, (copy) v_u_18, (copy) v_u_19
	if p_u_67:isReportingPlayer() then
		return v_u_17({
			["titleText"] = "CoreScripts.InGameMenu.Report.ThanksForReport",
			["dismissText"] = nil,
			["toastDefaultTitle"] = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport",
			["toastDefaultDescription"] = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription",
			["toastMutedTitle"] = "CoreScripts.InGameMenu.Report.Confirmation.Muted",
			["toastMutedDescription"] = nil,
			["toastMutedAndBlockedTitle"] = "CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlocked",
			["toastMutedAndBlockedDescription"] = nil,
			["toastBlockedTitle"] = "CoreScripts.InGameMenu.Report.Confirmation.Blocked",
			["toastBlockedDescription"] = nil,
			["dismissText"] = p_u_67:doesRequireConfirmation() and "CoreScripts.InGameMenu.Report.Confirm" or "CoreScripts.InGameMenu.Report.Done",
			["toastMutedDescription"] = {
				"CoreScripts.InGameMenu.Report.Confirmation.MutedDescriptionWithUser",
				["RBX_NAME"] = p_u_67.props.targetPlayer.Name
			},
			["toastMutedAndBlockedDescription"] = {
				"CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlockedDescriptionWithUser",
				["RBX_NAME"] = p_u_67.props.targetPlayer.Name
			},
			["toastBlockedDescription"] = {
				"CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlockedDescriptionWithUser",
				["RBX_NAME"] = p_u_67.props.targetPlayer.Name
			}
		})(function(p_u_68)
			-- upvalues: (ref) v_u_5, (ref) v_u_26, (copy) p_u_67, (ref) v_u_18, (ref) v_u_19
			local v69 = v_u_5.createFragment
			local v70 = {}
			local v71 = v_u_5.createElement
			local v72 = v_u_26
			local v73 = {
				["visible"] = p_u_67.props.isReportSentOpen,
				["screenSize"] = p_u_67.props.screenSize,
				["titleText"] = p_u_68.titleText,
				["contents"] = p_u_67:renderContents(),
				["actionButtons"] = v_u_5.createElement(v_u_18, {
					["buttonType"] = v_u_19.PrimarySystem,
					["size"] = UDim2.new(1, 0, 1, 0),
					["onActivated"] = function() -- name: onActivated
						-- upvalues: (ref) p_u_67, (copy) p_u_68
						return p_u_67.onConfirm(p_u_68)
					end,
					["text"] = p_u_68.dismissText,
					[v_u_5.Ref] = p_u_67.buttonRef
				}),
				["onDismiss"] = p_u_67.onCancel
			}
			v70.ModalDialog = v71(v72, v73)
			v70.FocusHandler = p_u_67:renderFocusHandler()
			return v69(v70)
		end)
	else
		return nil
	end
end
function v28.didUpdate(p74, p75, _) -- name: didUpdate
	if not p75.isReportSentOpen and (p74.props.isReportSentOpen and p74:isVoiceReport()) then
		local v76 = isPlayerUserIdMuted(p74.props.targetPlayer.UserId)
		p74:setState({
			["wasPlayerMutedWhenDialogOpened"] = v76,
			["isMuteCheckBoxSelected"] = v76
		})
	end
end
return v6.UNSTABLE_connect2(function(p77, _)
	-- upvalues: (copy) v_u_24
	return {
		["isReportSentOpen"] = p77.report.currentPage == v_u_24.Page.ReportSent,
		["reportType"] = p77.report.reportType,
		["targetPlayer"] = p77.report.targetPlayer,
		["screenSize"] = p77.displayOptions.screenSize,
		["reportCategory"] = p77.report.reportCategory
	}
end, function(p_u_78)
	-- upvalues: (copy) v_u_22, (copy) v_u_20, (copy) v_u_23
	return {
		["closeDialog"] = function() -- name: closeDialog
			-- upvalues: (copy) p_u_78, (ref) v_u_22
			p_u_78(v_u_22())
		end,
		["blockPlayer"] = function(p79, p80, p81) -- name: blockPlayer
			-- upvalues: (copy) p_u_78, (ref) v_u_20
			p_u_78(v_u_20(p79, p80, p81))
		end,
		["showToast"] = function(p82, p83) -- name: showToast
			-- upvalues: (copy) p_u_78, (ref) v_u_23
			p_u_78(v_u_23(p82, p83))
		end
	}
end)(v28)