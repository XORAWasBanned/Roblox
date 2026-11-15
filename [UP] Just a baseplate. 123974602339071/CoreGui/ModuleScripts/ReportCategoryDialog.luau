-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.ReportCategoryDialog
game:GetService("ContextActionService")
local v1 = game:GetService("CorePackages")
game:GetService("GuiService")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.t)
local v_u_6 = require(v1.Packages.Cryo)
local v_u_7 = require(v1.Packages.Signals)
local v_u_8 = require(v1.Workspace.Packages.Display)
local v9 = script.Parent.Parent
local v10 = require(v9.Dependencies)
require(v10.FocusHandler)
local v11 = require(v10.playerInterface)
local v_u_12 = require(v10.ThemedTextLabel)
local v_u_13 = require(v10.withLocalization)
local v14 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_15 = require(v14.Modules.VoiceChat.VoiceStateContext).withVoiceState
local v_u_16 = require(v14.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_17 = v4.Core.ImageSet.ImageSetLabel
local v_u_18 = require(v10.GameIcon)
require(v9.Components.BlockPlayerItem)
local v_u_19 = require(v9.Actions.EndReportFlow)
require(v9.Actions.OpenBlockPlayerDialog)
local v_u_20 = require(v9.Actions.SelectReportCategory)
local v_u_21 = require(v9.Utility.SendAnalytics)
local v_u_22 = require(v9.Utility.SessionUtility)
local v_u_23 = require(v9.Resources.Constants)
local v_u_24 = require(v9.Components.ModalDialog)
local v_u_25 = require(v9.Resources.Assets)
require(v9.Components.GameCell)
local v_u_26 = require(v10.BarOnTopScrollingFrame)
local v_u_27 = v4.App.Table.Cell
local v_u_28 = v4.Core.Style.Provider
local v_u_29 = v4.Core.Style.withStyle
local v_u_30 = v4.App.Style.Colors
local v_u_31 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local v_u_32 = {
	["BackgroundDefault"] = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = v_u_30.Flint
	},
	["BackgroundOnHover"] = {
		["Color"] = nil,
		["Transparency"] = 0.666,
		["Color"] = v_u_30.Graphite
	},
	["BackgroundOnPress"] = {
		["Color"] = nil,
		["Transparency"] = 0,
		["Color"] = v_u_30.Graphite
	}
}
local function v_u_34(p33) -- name: Divider
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_30
	return v_u_2.createElement("Frame", v_u_6.Dictionary.join({
		["Size"] = UDim2.new(1, 0, 0, 1)
	}, p33, {
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.5,
		["theme"] = nil,
		["BackgroundColor3"] = v_u_30.Graphite,
		["theme"] = v_u_6.None
	}))
end
local function v_u_48(p35) -- name: CategoryCellContent
	-- upvalues: (copy) v_u_2, (copy) v_u_17, (copy) v_u_12
	local v36 = v_u_2.createElement
	local v37 = "Frame"
	local v38 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 72),
		["AutomaticSize"] = Enum.AutomaticSize.XY
	}
	local v39 = {
		["ListLayout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v40 = v_u_2.createElement
	local v41 = "Frame"
	local v42 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = 1,
		["Size"] = UDim2.new(0, 68, 1, 0)
	}
	local v43 = {
		["Layout"] = v_u_2.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}),
		["CustomIcon"] = p35.iconComponent or nil
	}
	local v44 = p35.icon
	if v44 then
		v44 = v_u_2.createElement(v_u_17, {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = nil,
			["Image"] = p35.icon.Image,
			["Size"] = p35.icon.Size
		})
	end
	v43.Icon = v44
	v39.IconFrame = v40(v41, v42, v43)
	local v45 = v_u_2.createElement
	local v46 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = 2,
		["Size"] = UDim2.new(1, -68, 1, 0)
	}
	local v47 = {
		["ListLayout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, 2)
		}),
		["Text"] = v_u_2.createElement(v_u_12, {
			["AnchorPoint"] = nil,
			["themeKey"] = "TextEmphasis",
			["fontKey"] = "Header2",
			["Size"] = nil,
			["Text"] = nil,
			["TextTruncate"] = nil,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Size"] = UDim2.new(1, 0, 0, 20),
			["Text"] = p35.text,
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		}),
		["SubText"] = v_u_2.createElement(v_u_12, {
			["AnchorPoint"] = nil,
			["fontKey"] = "CaptionBody",
			["themeKey"] = "TextMuted",
			["Size"] = nil,
			["Text"] = nil,
			["TextTruncate"] = nil,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Size"] = UDim2.new(1, 0, 0, 14),
			["Text"] = p35.subtext,
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		})
	}
	v39.TextFrame = v45("Frame", v46, v47)
	return v36(v37, v38, v39)
end
local function v_u_50(p49) -- name: CategoryCell
	-- upvalues: (copy) v_u_2, (copy) v_u_27, (copy) v_u_48
	return v_u_2.createElement(v_u_27, {
		["userInteractionEnabled"] = true,
		["onActivated"] = nil,
		["layoutOrder"] = nil,
		["size"] = nil,
		["head"] = nil,
		["tail"] = nil,
		["onActivated"] = p49.onActivated,
		["layoutOrder"] = p49.layoutOrder,
		["size"] = UDim2.new(1, 0, 0, 72),
		["head"] = v_u_48(p49),
		["tail"] = v_u_2.createElement("Frame")
	})
end
local v51 = v_u_2.PureComponent:extend("ReportCategoryDialog")
local v52 = v5.strictInterface
local v53 = {
	["isReportCategoryMenuOpen"] = v5.boolean
}
local v54
if v_u_31 then
	v54 = nil
else
	v54 = v5.Vector2
end
v53.screenSize = v54
v53.inputType = v5.optional(v5.string)
v53.reportType = v5.optional(v5.valueOf(v_u_23.ReportType))
v53.targetPlayer = v5.optional(v11)
v53.closeDialog = v5.callback
v53.selectReportCategory = v5.optional(v5.callback)
v53.playerFocusedFlow = v5.boolean
v51.validateProps = v52(v53)
function v51.init(p_u_55) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_31, (copy) v_u_8, (copy) v_u_7
	p_u_55.buttonRef = v_u_2.createRef()
	function p_u_55.onCancel()
		-- upvalues: (copy) p_u_55
		p_u_55.props.closeDialog()
	end
	if v_u_31 then
		local v_u_56 = v_u_8.GetDisplayStore(false).getViewportSize
		p_u_55.disposeScreenSize = v_u_7.createEffect(function(p57)
			-- upvalues: (copy) p_u_55, (copy) v_u_56
			p_u_55:setState({
				["screenSize"] = v_u_56(p57)
			})
		end)
	end
end
function v51.willUnmount(p58) -- name: willUnmount
	-- upvalues: (copy) v_u_31
	if v_u_31 then
		p58.disposeScreenSize()
	end
end
function v51.renderContents(p_u_59, p60, p61) -- name: renderContents
	-- upvalues: (copy) v_u_2, (copy) v_u_16, (copy) v_u_6, (copy) v_u_50, (copy) v_u_25, (copy) v_u_23, (copy) v_u_34, (copy) v_u_18, (copy) v_u_29, (copy) v_u_32, (copy) v_u_28, (copy) v_u_26
	local _ = p_u_59.props
	local v_u_62 = {
		["ListLayout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	if p60 then
		local v63 = v_u_16:getRecentUsersInteractionData()
		if v63 and not v_u_6.isEmpty(v63) then
			if p_u_59.props.playerFocusedFlow then
				p60 = p_u_59.props.targetPlayer
				if p60 then
					local v64 = p_u_59.props.targetPlayer.UserId
					p60 = v63[tostring(v64)] ~= nil
				end
			end
		else
			p60 = false
		end
	end
	if p60 then
		local v65 = v_u_2.createElement
		local v66 = v_u_50
		local v67 = {
			["text"] = p61.voiceHeader,
			["subtext"] = p61.voiceDescription,
			["icon"] = v_u_25.Images.VoiceChatIcon,
			["layoutOrder"] = #v_u_62 + 1,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_59, (ref) v_u_23
				p_u_59.props.selectReportCategory(v_u_23.Category.Voice)
			end
		}
		table.insert(v_u_62, v65(v66, v67))
		local v68 = v_u_2.createElement
		local v69 = v_u_34
		local v70 = {
			["LayoutOrder"] = #v_u_62 + 1
		}
		table.insert(v_u_62, v68(v69, v70))
	end
	local v71 = v_u_2.createElement
	local v72 = v_u_50
	local v73 = {
		["text"] = p61.textHeader,
		["subtext"] = p61.textDescription,
		["icon"] = v_u_25.Images.TextChatIcon,
		["layoutOrder"] = #v_u_62 + 1,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (copy) p_u_59, (ref) v_u_23
			p_u_59.props.selectReportCategory(v_u_23.Category.Text)
		end
	}
	table.insert(v_u_62, v71(v72, v73))
	local v74 = v_u_2.createElement
	local v75 = v_u_34
	local v76 = {
		["LayoutOrder"] = #v_u_62 + 1
	}
	table.insert(v_u_62, v74(v75, v76))
	if not p_u_59.props.playerFocusedFlow then
		local v77 = v_u_2.createElement
		local v78 = v_u_50
		local v79 = {
			["iconComponent"] = v_u_2.createElement(v_u_18, {
				["gameId"] = nil,
				["iconSize"] = 33,
				["cornerRadius"] = nil,
				["gameId"] = game.GameId,
				["cornerRadius"] = UDim.new(0, 8)
			}),
			["text"] = p61.experienceHeader,
			["subtext"] = p61.experienceDescription,
			["layoutOrder"] = #v_u_62 + 1,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_59, (ref) v_u_23
				p_u_59.props.selectReportCategory(v_u_23.Category.Experience)
			end
		}
		table.insert(v_u_62, v77(v78, v79))
		local v80 = v_u_2.createElement
		local v81 = v_u_34
		local v82 = {
			["LayoutOrder"] = #v_u_62 + 1
		}
		table.insert(v_u_62, v80(v81, v82))
	end
	local v83 = v_u_2.createElement
	local v84 = v_u_50
	local v85 = {
		["text"] = p61.otherHeader,
		["subtext"] = p61.otherDescription,
		["icon"] = v_u_25.Images.OtherIcon,
		["layoutOrder"] = #v_u_62 + 1,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (copy) p_u_59, (ref) v_u_23
			p_u_59.props.selectReportCategory(v_u_23.Category.Other)
		end
	}
	table.insert(v_u_62, v83(v84, v85))
	local v86 = v_u_2.createElement
	local v87 = v_u_34
	local v88 = {
		["LayoutOrder"] = #v_u_62 + 1
	}
	table.insert(v_u_62, v86(v87, v88))
	return v_u_29(function(p89)
		-- upvalues: (ref) v_u_6, (ref) v_u_32, (ref) v_u_2, (ref) v_u_28, (ref) v_u_26, (copy) p_u_59, (copy) v_u_62
		local v90 = {
			["Theme"] = v_u_6.Dictionary.join(p89.Theme, v_u_32)
		}
		local v91 = v_u_6.Dictionary.join(p89, v90)
		return v_u_2.createElement(v_u_28, {
			["style"] = v91
		}, { v_u_2.createElement(v_u_26, {
				["Size"] = UDim2.fromScale(1, 1),
				["CanvasSize"] = UDim2.new(1, 0, 0, 72),
				["scrollingFrameRef"] = p_u_59.scrollingFrameRef
			}, v_u_62) })
	end)
end
function v51.render(p_u_92) -- name: render
	-- upvalues: (copy) v_u_15, (copy) v_u_13, (copy) v_u_2, (copy) v_u_24, (copy) v_u_31
	return v_u_15(function(p_u_93)
		-- upvalues: (ref) v_u_13, (ref) v_u_2, (ref) v_u_24, (copy) p_u_92, (ref) v_u_31
		return v_u_13({
			["titleText"] = "CoreScripts.InGameMenu.Report.MenuTitle",
			["dismissText"] = "CoreScripts.InGameMenu.Report.Done",
			["voiceHeader"] = "CoreScripts.InGameMenu.Report.Category.Header.Voice",
			["voiceDescription"] = "CoreScripts.InGameMenu.Report.Category.Description.Voice",
			["textHeader"] = "CoreScripts.InGameMenu.Report.Category.Header.Text",
			["textDescription"] = "CoreScripts.InGameMenu.Report.Category.Description.Text",
			["experienceHeader"] = "CoreScripts.InGameMenu.Report.Category.Header.Experience",
			["experienceDescription"] = "CoreScripts.InGameMenu.Report.Category.Description.Experience",
			["otherHeader"] = "CoreScripts.InGameMenu.Report.Category.Header.Other",
			["otherDescription"] = "CoreScripts.InGameMenu.Report.Category.Description.Other"
		})(function(p94)
			-- upvalues: (ref) v_u_2, (ref) v_u_24, (ref) p_u_92, (ref) v_u_31, (copy) p_u_93
			local v95 = v_u_2.createFragment
			local v96 = {}
			local v97 = v_u_2.createElement
			local v98 = v_u_24
			local v99 = {
				["visible"] = nil,
				["screenSize"] = nil,
				["titleText"] = nil,
				["contents"] = nil,
				["showCloseButton"] = true,
				["onDismiss"] = nil,
				["visible"] = p_u_92.props.isReportCategoryMenuOpen
			}
			local v100
			if v_u_31 then
				v100 = p_u_92.state.screenSize
			else
				v100 = p_u_92.props.screenSize
			end
			v99.screenSize = v100
			v99.titleText = p94.titleText
			v99.contents = p_u_92:renderContents(p_u_93.voiceEnabled, p94)
			v99.onDismiss = p_u_92.onCancel
			v96.ModalDialog = v97(v98, v99)
			return v95(v96)
		end)
	end)
end
return v3.UNSTABLE_connect2(function(p101, _)
	-- upvalues: (copy) v_u_23, (copy) v_u_31
	local v102 = {
		["isReportCategoryMenuOpen"] = p101.report.currentPage == v_u_23.Page.Category,
		["reportType"] = p101.report.reportType,
		["targetPlayer"] = p101.report.targetPlayer
	}
	local v103
	if v_u_31 then
		v103 = nil
	else
		v103 = p101.displayOptions.screenSize
	end
	v102.screenSize = v103
	v102.playerFocusedFlow = p101.report.beginningReportType == v_u_23.ReportType.Player
	return v102
end, function(p_u_104)
	-- upvalues: (copy) v_u_20, (copy) v_u_19, (copy) v_u_21, (copy) v_u_23, (copy) v_u_22
	return {
		["selectReportCategory"] = function(p105) -- name: selectReportCategory
			-- upvalues: (copy) p_u_104, (ref) v_u_20
			p_u_104(v_u_20(p105))
		end,
		["closeDialog"] = function() -- name: closeDialog
			-- upvalues: (copy) p_u_104, (ref) v_u_19, (ref) v_u_21, (ref) v_u_23, (ref) v_u_22
			p_u_104(v_u_19())
			v_u_21(v_u_23.Analytics.ReportType, v_u_23.Analytics.ReportFlowAbandoned, {
				["source"] = v_u_23.Analytics.ReportType
			})
			v_u_22.endAbuseReportSession()
		end
	}
end)(v51)