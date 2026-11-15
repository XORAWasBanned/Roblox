-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.ReportDialog
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v7 = script.Parent.Parent
local v8 = require(v7.Dependencies)
local v_u_9 = require(v8.GameIcon)
local v_u_10 = require(v8.PlayerCell)
local v_u_11 = require(v8.ThemedTextLabel)
local v_u_12 = require(v8.withLocalization)
local v13 = require(v8.playerInterface)
local v_u_14 = require(v7.Actions.NavigateBack)
local v_u_15 = require(v7.Actions.EndReportFlow)
local v_u_16 = require(v7.Resources.Constants)
local v_u_17 = require(v7.Thunks.SendReport)
local v_u_18 = require(v7.Components.TextEntryField)
local v_u_19 = require(v7.Components.ModalDialog)
local v_u_20 = require(v7.Utility.SendAnalytics)
local v_u_21 = require(v7.Utility.SessionUtility)
local v_u_22 = v6.Core.Style.Provider
local v_u_23 = v6.Core.Style.withStyle
local v_u_24 = v6.App.Button.ButtonStack
local v_u_25 = v6.App.Button.Enum.ButtonType
local v26 = v6.App.Style.Colors
local v_u_27 = v6.App.Menu.DropdownMenu
local v_u_28 = require(v1.Workspace.Packages.UserLib).Utils.isPlayerVerified
local v29 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_30 = require(v29.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_31 = require(v29.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local v_u_32 = require(v29.Modules.VoiceChat.VoiceStateContext)
local v_u_33 = require(v29.Modules.VoiceChat.Constants)
local v_u_34 = require(v1.Packages.React)
local function v_u_36(p35)
	-- upvalues: (copy) v_u_34, (copy) v_u_32, (copy) v_u_31, (copy) v_u_2
	if v_u_34.useContext(v_u_32.Context).voiceEnabled then
		return v_u_34.createElement(v_u_31, v_u_2.Dictionary.join(p35, {}))
	else
		return nil
	end
end
local v37 = require(v1.Workspace.Packages.DsaIllegalContentReporting)
local v_u_38 = v37.isShowUKOSAIllegalContentReportingLink
local v_u_39 = v37.OSAReportLink
local v_u_40 = {
	"Swearing",
	"Inappropriate Username",
	"Bullying",
	"Scamming",
	"Dating",
	"Cheating/Exploiting",
	"Personal Question",
	"Offsite Links"
}
local v_u_41 = {
	["BackgroundDefault"] = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = v26.Flint
	},
	["BackgroundOnHover"] = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = v26.Flint
	},
	["BackgroundOnPress"] = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = v26.Flint
	}
}
local v42 = v_u_3.PureComponent:extend("ReportDialog")
v42.validateProps = v5.strictInterface({
	["isReportDialogOpen"] = v5.boolean,
	["reportType"] = v5.optional(v5.valueOf(v_u_16.ReportType)),
	["targetPlayer"] = v5.optional(v13),
	["placeName"] = v5.string,
	["screenSize"] = v5.Vector2,
	["navigateBack"] = v5.optional(v5.callback),
	["canNavigateBack"] = v5.optional(v5.boolean),
	["sendReport"] = v5.callback,
	["closeDialog"] = v5.optional(v5.callback),
	["reportCategory"] = v5.optional(v5.string)
})
function v42.init(p_u_43) -- name: init
	p_u_43.state = {
		["reasonText"] = nil,
		["descriptionText"] = ""
	}
	function p_u_43.onReasonChanged(p44)
		-- upvalues: (copy) p_u_43
		p_u_43:setState({
			["reasonText"] = p44
		})
	end
	function p_u_43.onTextChanged(p45)
		-- upvalues: (copy) p_u_43
		p_u_43:setState({
			["descriptionText"] = p45
		})
	end
	function p_u_43.onReport(p46, p47)
		-- upvalues: (copy) p_u_43
		local v48 = p_u_43:getReason()
		p_u_43.props.sendReport(p_u_43.props.reportType, p_u_43.props.targetPlayer, v48, p_u_43.state.descriptionText, p_u_43.props.reportCategory, p46, p47)
	end
	function p_u_43.navigateBack()
		-- upvalues: (copy) p_u_43
		p_u_43.props.navigateBack(p_u_43.state.reasonText, p_u_43.state.descriptionText ~= "")
	end
	function p_u_43.onCancel()
		-- upvalues: (copy) p_u_43
		p_u_43.props.closeDialog(p_u_43.state.reasonText, p_u_43.state.descriptionText ~= "")
	end
end
function v42.getReason(p49) -- name: getReason
	-- upvalues: (copy) v_u_16
	if p49.props.reportType == v_u_16.ReportType.Player then
		return p49.state.reasonText
	else
		return p49.props.reportType == v_u_16.ReportType.Place and "Inappropriate Content" or nil
	end
end
function v42.canReport(p50) -- name: canReport
	local v51 = p50:getReason() ~= nil
	local v52 = utf8.len(utf8.nfcnormalize(p50.state.descriptionText))
	local v53
	if v52 >= 0 then
		v53 = v52 <= 160
	else
		v53 = false
	end
	return v51 and v53
end
function v42.renderUKOSALink(_) -- name: renderUKOSALink
	-- upvalues: (copy) v_u_38, (copy) v_u_3, (copy) v_u_39
	if v_u_38() then
		return v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["LayoutOrder"] = 99,
			["Size"] = UDim2.new(1, 0, 0, 40),
			["Position"] = UDim2.new(0, 0, 1, -45)
		}, {
			["OSALink"] = v_u_3.createElement(v_u_39)
		})
	else
		return nil
	end
end
function v42.renderPlayerInfo(p_u_54) -- name: renderPlayerInfo
	-- upvalues: (copy) v_u_16, (copy) v_u_23, (copy) v_u_2, (copy) v_u_41, (copy) v_u_3, (copy) v_u_22, (copy) v_u_10, (copy) v_u_28, (copy) v_u_36, (copy) v_u_30, (copy) v_u_33
	local v_u_55 = p_u_54.props.reportCategory == v_u_16.Category.Voice
	return v_u_23(function(p56)
		-- upvalues: (ref) v_u_2, (ref) v_u_41, (copy) v_u_55, (copy) p_u_54, (ref) v_u_3, (ref) v_u_22, (ref) v_u_10, (ref) v_u_28, (ref) v_u_36, (ref) v_u_30, (ref) v_u_33
		local v57 = {
			["Theme"] = v_u_2.Dictionary.join(p56.Theme, v_u_41)
		}
		local v58 = v_u_2.Dictionary.join(p56, v57)
		local v59 = 0
		if v_u_55 and p_u_54.props.isReportDialogOpen then
			v59 = v59 + 1
		end
		local v60 = v_u_3.createElement
		local v61 = v_u_22
		local v62 = {
			["style"] = v58
		}
		local v63 = {}
		local v64 = v_u_3.createElement
		local v65 = v_u_10
		local v66 = {
			["userId"] = nil,
			["username"] = nil,
			["displayName"] = nil,
			["hasVerifiedBadge"] = nil,
			["isOnline"] = true,
			["isSelected"] = false,
			["LayoutOrder"] = 1,
			["key"] = nil,
			["memoKey"] = nil,
			["userId"] = p_u_54.props.targetPlayer.UserId,
			["username"] = p_u_54.props.targetPlayer.Name,
			["displayName"] = p_u_54.props.targetPlayer.DisplayName,
			["hasVerifiedBadge"] = v_u_28(p_u_54.props.targetPlayer)
		}
		local v67 = p_u_54.props.targetPlayer.UserId
		v66.key = tostring(v67)
		v66.memoKey = v59
		local v68 = {}
		local v69
		if v_u_55 and p_u_54.props.isReportDialogOpen then
			local v70 = v_u_3.createElement
			local v71 = v_u_36
			local v72 = {
				["userId"] = nil,
				["hideOnError"] = true,
				["iconStyle"] = "SpeakerLight",
				["size"] = nil,
				["onClicked"] = nil
			}
			local v73 = p_u_54.props.targetPlayer.UserId
			v72.userId = tostring(v73)
			v72.size = UDim2.fromOffset(36, 36)
			function v72.onClicked() -- name: onClicked
				-- upvalues: (ref) v_u_30, (ref) p_u_54, (ref) v_u_33
				v_u_30:ToggleMutePlayer(p_u_54.props.targetPlayer.UserId, v_u_33.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
			v69 = v70(v71, v72) or nil
		else
			v69 = nil
		end
		v68.VoiceIndicator = v69
		__set_list(v63, 1, {v64(v65, v66, v68)})
		return v60(v61, v62, v63)
	end)
end
function v42.renderDropDownMenu(p_u_74) -- name: renderDropDownMenu
	-- upvalues: (copy) v_u_38, (copy) v_u_3, (copy) v_u_12, (copy) v_u_40, (copy) v_u_27
	local v75 = v_u_38() and 64 or 72
	if p_u_74.props.isReportDialogOpen then
		return v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["ZIndex"] = 10,
			["Position"] = UDim2.fromOffset(0, v75),
			["Size"] = UDim2.new(1, 0, 0, 48)
		}, {
			["DropDown"] = v_u_12({
				["menu1"] = "CoreScripts.InGameMenu.Report.AbuseSwearing",
				["menu2"] = "CoreScripts.InGameMenu.Report.AbuseUsername",
				["menu3"] = "CoreScripts.InGameMenu.Report.AbuseBullying",
				["menu4"] = "CoreScripts.InGameMenu.Report.AbuseScamming",
				["menu5"] = "CoreScripts.InGameMenu.Report.AbuseDating",
				["menu6"] = "CoreScripts.InGameMenu.Report.AbuseExploiting",
				["menu7"] = "CoreScripts.InGameMenu.Report.AbusePersonalQuestion",
				["menu8"] = "CoreScripts.InGameMenu.Report.AbuseOffsiteLink",
				["placeHolderText"] = "CoreScripts.InGameMenu.Report.AbuseTypePlaceHolder"
			})(function(p76)
				-- upvalues: (ref) v_u_40, (copy) p_u_74, (ref) v_u_3, (ref) v_u_27
				local v77 = {}
				local v_u_78 = {}
				for v79, v80 in ipairs(v_u_40) do
					local v81 = p76["menu" .. tostring(v79)]
					table.insert(v77, {
						["text"] = v81
					})
					v_u_78[v81] = v80
				end
				local function v84(p82) -- name: onDropDownChanged
					-- upvalues: (copy) v_u_78, (ref) p_u_74
					local v83 = v_u_78[p82]
					p_u_74.onReasonChanged(v83)
				end
				return v_u_3.createElement(v_u_27, {
					["placeholder"] = nil,
					["onChange"] = nil,
					["height"] = nil,
					["screenSize"] = nil,
					["cellDatas"] = nil,
					["showDropShadow"] = true,
					["fixedListHeight"] = 171,
					["placeholder"] = p76.placeHolderText,
					["onChange"] = v84,
					["height"] = UDim.new(0, 48),
					["screenSize"] = p_u_74.props.screenSize,
					["cellDatas"] = v77
				})
			end)
		})
	else
		return nil
	end
end
function v42.renderPlayerContents(p_u_85) -- name: renderPlayerContents
	-- upvalues: (copy) v_u_12, (copy) v_u_38, (copy) v_u_3, (copy) v_u_18
	return v_u_12({
		["placeHolderText"] = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
	})(function(p86)
		-- upvalues: (ref) v_u_38, (ref) v_u_3, (copy) p_u_85, (ref) v_u_18
		local v87 = v_u_38() and 118 or 132
		local v88 = v_u_38() and -150 or -132
		return v_u_3.createFragment({
			["PlayerInfo"] = p_u_85:renderPlayerInfo(),
			["DropDownMenu"] = p_u_85:renderDropDownMenu(),
			["TextField"] = v_u_3.createElement(v_u_18, {
				["enabled"] = nil,
				["text"] = nil,
				["textChanged"] = nil,
				["maxTextLength"] = 160,
				["autoFocusOnEnabled"] = false,
				["PlaceholderText"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["enabled"] = p_u_85.props.isReportDialogOpen,
				["text"] = p_u_85.state.descriptionText,
				["textChanged"] = p_u_85.onTextChanged,
				["PlaceholderText"] = p86.placeHolderText,
				["Position"] = UDim2.fromOffset(0, v87),
				["Size"] = UDim2.new(1, 0, 1, v88)
			}),
			["OSALinkFrame"] = p_u_85:renderUKOSALink()
		})
	end)
end
function v42.renderPlaceContents(p_u_89) -- name: renderPlaceContents
	-- upvalues: (copy) v_u_12, (copy) v_u_38, (copy) v_u_3, (copy) v_u_9, (copy) v_u_11, (copy) v_u_18
	local v90 = v_u_12
	local v91 = {
		["labelText"] = nil,
		["placeHolderText"] = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder",
		["labelText"] = {
			"CoreScripts.InGameMenu.Report.ReportingGame",
			["RBX_NAME"] = p_u_89.props.placeName
		}
	}
	return v90(v91)(function(p92)
		-- upvalues: (ref) v_u_38, (ref) v_u_3, (ref) v_u_9, (ref) v_u_11, (ref) v_u_18, (copy) p_u_89
		local v93 = v_u_38() and 12 or 24
		local v94 = v_u_38() and 90 or 112
		local v95 = v_u_38() and -135 or -112
		return v_u_3.createFragment({
			["PlaceInfo"] = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["Size"] = nil,
				["Position"] = UDim2.fromOffset(0, v93),
				["Size"] = UDim2.new(1, 0, 0, 64)
			}, {
				["GameIcon"] = v_u_3.createElement(v_u_9, {
					["gameId"] = nil,
					["iconSize"] = 64,
					["cornerRadius"] = nil,
					["gameId"] = game.GameId,
					["cornerRadius"] = UDim.new(0, 8)
				}),
				["Label"] = v_u_3.createElement(v_u_11, {
					["fontKey"] = "Body",
					["themeKey"] = "TextDefault",
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = 1,
					["Position"] = nil,
					["Size"] = nil,
					["Text"] = nil,
					["TextWrapped"] = true,
					["TextXAlignment"] = nil,
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["Position"] = UDim2.new(0, 76, 0.5, 0),
					["Size"] = UDim2.new(1, -76, 0, 40),
					["Text"] = p92.labelText,
					["TextXAlignment"] = Enum.TextXAlignment.Left
				})
			}),
			["TextField"] = v_u_3.createElement(v_u_18, {
				["enabled"] = nil,
				["text"] = nil,
				["textChanged"] = nil,
				["maxTextLength"] = 160,
				["autoFocusOnEnabled"] = false,
				["PlaceholderText"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["enabled"] = p_u_89.props.isReportDialogOpen,
				["text"] = p_u_89.state.descriptionText,
				["textChanged"] = p_u_89.onTextChanged,
				["PlaceholderText"] = p92.placeHolderText,
				["Position"] = UDim2.fromOffset(0, v94),
				["Size"] = UDim2.new(1, 0, 1, v95)
			}),
			["OSALinkFrame"] = p_u_89:renderUKOSALink()
		})
	end)
end
function v42.renderContents(p96) -- name: renderContents
	-- upvalues: (copy) v_u_16
	if p96.props.reportType == v_u_16.ReportType.Player then
		return p96:renderPlayerContents()
	elseif p96.props.reportType == v_u_16.ReportType.Place then
		return p96:renderPlaceContents()
	else
		return nil
	end
end
local v_u_97 = {
	[v_u_16.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat",
	[v_u_16.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat",
	[v_u_16.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other",
	[v_u_16.Category.Experience] = "CoreScripts.InGameMenu.Report.Title.Experience"
}
function v42.categoryTitle(p98) -- name: categoryTitle
	-- upvalues: (copy) v_u_16, (copy) v_u_97
	return p98.props.reportType ~= v_u_16.ReportType.Place and (v_u_97[p98.props.reportCategory] or "CoreScripts.InGameMenu.Report.ReportTitle") or v_u_97[v_u_16.Category.Experience]
end
function v42.render(p_u_99) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_19, (copy) v_u_24, (copy) v_u_25
	return v_u_12({
		["titleText"] = nil,
		["cancelText"] = "CoreScripts.InGameMenu.Cancel",
		["reportText"] = "CoreScripts.InGameMenu.Report.SendReport",
		["toastDefaultTitle"] = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport",
		["toastDefaultDescription"] = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription",
		["titleText"] = p_u_99:categoryTitle()
	})(function(p_u_100)
		-- upvalues: (ref) v_u_3, (ref) v_u_19, (copy) p_u_99, (ref) v_u_24, (ref) v_u_25
		local v101 = v_u_3.createElement
		local v102 = v_u_19
		local v103 = {
			["visible"] = p_u_99.props.isReportDialogOpen,
			["screenSize"] = p_u_99.props.screenSize,
			["titleText"] = p_u_100.titleText,
			["contents"] = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Size"] = UDim2.fromScale(1, 1)
			}, {
				["Padding"] = v_u_3.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, 24),
					["PaddingRight"] = UDim.new(0, 24)
				}),
				["Contents"] = p_u_99:renderContents()
			})
		}
		local v104 = v_u_3.createElement
		local v105 = v_u_24
		local v106 = {
			["buttonHeight"] = 48,
			["buttons"] = nil,
			["buttons"] = {
				{
					["buttonType"] = v_u_25.Secondary,
					["props"] = {
						["onActivated"] = p_u_99.onCancel,
						["text"] = p_u_100.cancelText
					}
				},
				{
					["buttonType"] = v_u_25.PrimarySystem,
					["props"] = {
						["isDisabled"] = not p_u_99:canReport(),
						["onActivated"] = function() -- name: onActivated
							-- upvalues: (ref) p_u_99, (copy) p_u_100
							return p_u_99.onReport(p_u_100.toastDefaultTitle, p_u_100.toastDefaultDescription)
						end,
						["text"] = p_u_100.reportText
					}
				}
			}
		}
		v103.actionButtons = v104(v105, v106)
		v103.onDismiss = p_u_99.onCancel
		local v107
		if p_u_99.props.canNavigateBack then
			v107 = p_u_99.navigateBack
		else
			v107 = nil
		end
		v103.onBackButtonActivated = v107
		return v101(v102, v103)
	end)
end
function v42.didUpdate(p108, p109) -- name: didUpdate
	-- upvalues: (copy) v_u_3
	if p109.isReportDialogOpen and not p108.props.isReportDialogOpen then
		p108:setState({
			["reasonText"] = nil,
			["descriptionText"] = "",
			["reasonText"] = v_u_3.None
		})
	end
end
return v4.UNSTABLE_connect2(function(p110, _)
	-- upvalues: (copy) v_u_16
	return {
		["reportCategory"] = p110.report.reportCategory,
		["isReportDialogOpen"] = p110.report.currentPage == v_u_16.Page.ReportForm,
		["reportType"] = p110.report.reportType,
		["targetPlayer"] = p110.report.targetPlayer,
		["canNavigateBack"] = #p110.report.history > 1,
		["placeName"] = p110.placeInfo.name,
		["screenSize"] = p110.displayOptions.screenSize
	}
end, function(p_u_111)
	-- upvalues: (copy) v_u_14, (copy) v_u_20, (copy) v_u_16, (copy) v_u_15, (copy) v_u_21, (copy) v_u_17
	return {
		["navigateBack"] = function(p112, p113) -- name: navigateBack
			-- upvalues: (copy) p_u_111, (ref) v_u_14, (ref) v_u_20, (ref) v_u_16
			p_u_111(v_u_14())
			v_u_20(v_u_16.Page.ReportForm, v_u_16.Analytics.ReportFlowBack, {
				["source"] = v_u_16.Page.ReportForm,
				["reason"] = p112,
				["descriptionTextChanged"] = p113
			})
		end,
		["closeDialog"] = function(p114, p115) -- name: closeDialog
			-- upvalues: (copy) p_u_111, (ref) v_u_15, (ref) v_u_20, (ref) v_u_16, (ref) v_u_21
			p_u_111(v_u_15())
			v_u_20(v_u_16.Page.ReportForm, v_u_16.Analytics.ReportFlowAbandoned, {
				["source"] = v_u_16.Page.ReportForm,
				["reason"] = p114,
				["descriptionTextChanged"] = p115
			})
			v_u_21.endAbuseReportSession()
		end,
		["sendReport"] = function(p116, p117, p118, p119, p120, p121, p122) -- name: sendReport
			-- upvalues: (copy) p_u_111, (ref) v_u_17
			p_u_111(v_u_17(p116, p117, p118, p119, p120, p121, p122))
		end
	}
end)(v42)