-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.ReportMenu
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Cryo)
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v6 = require(v1.Packages.UIBlox)
local v7 = require(v1.Packages.t)
local v8 = script.Parent.Parent
local v9 = require(v8.Dependencies)
local v_u_10 = require(v9.BarOnTopScrollingFrame)
local v_u_11 = require(v9.Divider)
local v_u_12 = require(v9.PlayerCell)
local v_u_13 = require(v9.PlayerSearchPredicate)
local v_u_14 = require(v9.SearchBar)
require(v9.ThemedTextLabel)
local v_u_15 = require(v9.withLocalization)
local v_u_16 = require(v8.Actions.NavigateBack)
local v_u_17 = require(v8.Actions.EndReportFlow)
local v_u_18 = require(v8.Actions.SelectReportListing)
require(v8.Resources.Assets)
local v_u_19 = require(v8.Resources.Constants)
local v_u_20 = require(v8.Components.ModalDialog)
local v_u_21 = require(v8.Components.GameCell)
local v_u_22 = require(v8.Utility.SendAnalytics)
local v_u_23 = require(v8.Utility.SessionUtility)
local v24 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_25 = require(v24.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_26 = require(v24.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local v_u_27 = require(v24.Modules.VoiceChat.VoiceStateContext)
local v_u_28 = require(v24.Modules.VoiceChat.Constants)
local v_u_29 = require(v1.Packages.React)
local v30 = v6.App.Style.Colors
local v_u_31 = v6.App.Bar.HeaderBar
local v_u_32 = v6.App.Button.IconButton
local v_u_33 = v6.App.ImageSet.Enum.IconSize
local v_u_34 = v6.Core.Style.Provider
local v_u_35 = v6.App.ImageSet.Images
local v_u_36 = v6.Core.Style.withStyle
local v_u_37 = require(v1.Workspace.Packages.UserLib).Utils.isPlayerVerified
local v_u_38 = require(v1.Workspace.Packages.AppHeaderBar).makeBackButton
local v_u_39 = {
	["BackgroundDefault"] = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = v30.Flint
	}
}
local v40 = v_u_4.PureComponent:extend("ReportMenu")
local function v_u_42(p41)
	-- upvalues: (copy) v_u_29, (copy) v_u_27, (copy) v_u_26, (copy) v_u_3
	if v_u_29.useContext(v_u_27.Context).voiceEnabled then
		return v_u_29.createElement(v_u_26, v_u_3.Dictionary.join(p41, {}))
	else
		return nil
	end
end
v40.validateProps = v7.strictInterface({
	["isReportMenuOpen"] = v7.boolean,
	["screenSize"] = v7.Vector2,
	["closeDialog"] = v7.callback,
	["openReportDialog"] = v7.callback,
	["canNavigateBack"] = v7.boolean,
	["reportCategory"] = v7.optional(v7.string),
	["navigateBack"] = v7.optional(v7.callback)
})
function v40.init(p_u_43) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_25
	p_u_43.scrollingFrameRef = v_u_4.createRef()
	p_u_43.state = {
		["isFilterMode"] = false,
		["filterText"] = nil
	}
	function p_u_43.onSearch()
		-- upvalues: (copy) p_u_43
		p_u_43:setState({
			["isFilterMode"] = true,
			["filterText"] = ""
		})
	end
	function p_u_43.onTextChanged(p44)
		-- upvalues: (copy) p_u_43
		p_u_43:setState({
			["filterText"] = p44
		})
	end
	function p_u_43.onCancel()
		-- upvalues: (copy) p_u_43, (ref) v_u_4
		p_u_43:setState({
			["isFilterMode"] = false,
			["filterText"] = nil,
			["filterText"] = v_u_4.None
		})
	end
	function p_u_43.scrollToTop()
		-- upvalues: (copy) p_u_43
		local v45 = p_u_43.scrollingFrameRef:getValue()
		if v45 then
			v45:scrollToTop()
		end
	end
	function p_u_43.navigateBack()
		-- upvalues: (copy) p_u_43
		p_u_43.props.navigateBack(p_u_43.state.filterText ~= nil)
	end
	function p_u_43.closeDialog()
		-- upvalues: (copy) p_u_43
		p_u_43.props.closeDialog(p_u_43.state.filterText ~= nil)
	end
	p_u_43.layoutBindings = {}
	function p_u_43.getLayoutBinding(p46, p47)
		-- upvalues: (copy) p_u_43, (ref) v_u_4
		local v48 = p_u_43.layoutBindings[p46]
		if not v48 then
			local v49, v50 = v_u_4.createBinding(p47)
			v48 = {
				["valueBinding"] = v49,
				["setValue"] = v50,
				["value"] = p47
			}
			p_u_43.layoutBindings[p46] = v48
		end
		if v48.value ~= p47 then
			v48.value = p47
			v48.setValue(p47)
		end
		return v48.valueBinding
	end
	function p_u_43.playerIsVoiceActive(p51)
		-- upvalues: (ref) v_u_25
		return v_u_25.participants[tostring(p51)] ~= nil
	end
	p_u_43.sortedUserIds = {}
end
local function v_u_54(p52, p53) -- name: sortPlayers
	return p52.DisplayName:lower() < p53.DisplayName:lower()
end
function v40.getPlayerList(p55) -- name: getPlayerList
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_54, (copy) v_u_13
	local v56 = v_u_3.List.sort(v_u_2:GetPlayers(), v_u_54)
	local v57 = {}
	for _, v58 in ipairs(v56) do
		if v58 == v_u_2.LocalPlayer then
			continue
		end
		if p55.state.isFilterMode then
			if not v_u_13(p55.state.filterText, v58.Name, v58.DisplayName) then
				continue
			end
			table.insert(v57, v58)
		else
			table.insert(v57, v58)
		end
	end
	return v_u_3.List.sort(v57, function(p59, p60)
		return p59.DisplayName:lower() < p60.DisplayName:lower()
	end)
end
local v_u_61 = {
	[v_u_19.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat",
	[v_u_19.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat",
	[v_u_19.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other"
}
function v40.categoryTitle(p62) -- name: categoryTitle
	-- upvalues: (copy) v_u_61
	return v_u_61[p62.props.reportCategory] or "CoreScripts.InGameMenu.Report.MenuTitle"
end
function v40.renderHeaderBar(p_u_63) -- name: renderHeaderBar
	-- upvalues: (copy) v_u_38, (copy) v_u_4, (copy) v_u_32, (copy) v_u_33, (copy) v_u_35, (copy) v_u_15, (copy) v_u_31, (copy) v_u_14
	local v_u_64
	if p_u_63.props.canNavigateBack then
		v_u_64 = v_u_38(p_u_63.navigateBack)
	else
		v_u_64 = function()
			-- upvalues: (ref) v_u_4, (ref) v_u_32, (ref) v_u_33, (ref) v_u_35, (copy) p_u_63
			return v_u_4.createElement(v_u_32, {
				["iconSize"] = v_u_33.Medium,
				["icon"] = v_u_35["icons/navigation/close"],
				["onActivated"] = p_u_63.closeDialog
			})
		end
	end
	if p_u_63.state.isFilterMode then
		return v_u_4.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["Position"] = UDim2.fromOffset(24, 6),
			["Size"] = UDim2.new(1, -48, 1, -12)
		}, { v_u_4.createElement(v_u_14, {
				["size"] = nil,
				["text"] = nil,
				["autoCaptureFocus"] = true,
				["onTextChanged"] = nil,
				["onCancelled"] = nil,
				["size"] = UDim2.fromScale(1, 1),
				["text"] = p_u_63.state.filterText,
				["onTextChanged"] = p_u_63.onTextChanged,
				["onCancelled"] = p_u_63.onCancel
			}) })
	else
		return v_u_15({
			["titleText"] = p_u_63:categoryTitle()
		})(function(p65)
			-- upvalues: (ref) v_u_4, (ref) v_u_31, (ref) v_u_64, (ref) v_u_32, (ref) v_u_33, (ref) v_u_35, (copy) p_u_63
			return v_u_4.createElement(v_u_31, {
				["backgroundTransparency"] = 1,
				["barHeight"] = 48,
				["renderLeft"] = nil,
				["renderRight"] = nil,
				["onHeaderActivated"] = nil,
				["title"] = nil,
				["renderLeft"] = v_u_64,
				["renderRight"] = function() -- name: renderRight
					-- upvalues: (ref) v_u_4, (ref) v_u_32, (ref) v_u_33, (ref) v_u_35, (ref) p_u_63
					return v_u_4.createElement(v_u_32, {
						["iconSize"] = v_u_33.Medium,
						["icon"] = v_u_35["icons/common/search"],
						["onActivated"] = p_u_63.onSearch
					})
				end,
				["onHeaderActivated"] = p_u_63.scrollToTop,
				["title"] = p65.titleText
			})
		end)
	end
end
function v40.renderContents(p_u_66) -- name: renderContents
	-- upvalues: (copy) v_u_19, (copy) v_u_4, (copy) v_u_21, (copy) v_u_25, (copy) v_u_11, (copy) v_u_12, (copy) v_u_37, (copy) v_u_42, (copy) v_u_28, (copy) v_u_36, (copy) v_u_3, (copy) v_u_39, (copy) v_u_34, (copy) v_u_10
	local v_u_67 = p_u_66.props
	local v68 = p_u_66.props.reportCategory == v_u_19.Category.Voice
	local v69 = 0
	local v_u_70 = {
		["ListLayout"] = v_u_4.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	if not p_u_66.state.isFilterMode and p_u_66.props.reportCategory == v_u_19.Category.None then
		v_u_70.GameCell = v_u_4.createElement(v_u_21, {
			["gameId"] = game.GameId,
			["layoutOrder"] = p_u_66.getLayoutBinding("GameCell", v69),
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) v_u_67, (ref) v_u_19
				v_u_67.openReportDialog(v_u_19.ReportType.Place, nil)
			end
		})
	end
	local v71 = v69 + 1
	local v72 = p_u_66:getPlayerList()
	local v73 = not v68 and {} or v_u_25:getRecentUsersInteractionData()
	p_u_66.sortedUserIds = {}
	local v_u_74 = 72
	for _, v_u_75 in pairs(v72) do
		local v76 = v_u_75.UserId
		local v77 = tostring(v76)
		if v68 then
			local v78 = v_u_75.UserId
			if not v73[tostring(v78)] then
				continue
			end
		end
		local v79 = p_u_66.sortedUserIds
		local v80 = v_u_75.UserId
		table.insert(v79, v80)
		local v81 = 0
		if v68 then
			v81 = v81 + 1
		end
		if p_u_66.props.isReportMenuOpen then
			v81 = v81 + 2
		end
		v_u_70["Divider" .. v77] = v_u_4.createElement(v_u_11, {
			["LayoutOrder"] = p_u_66.getLayoutBinding("Divider" .. v77, v71),
			["Size"] = UDim2.new(1, 0, 0, 1)
		})
		local v82 = v71 + 1
		local v83 = "PlayerCell" .. v77
		local v84 = v_u_4.createElement
		local v85 = v_u_12
		local v86 = {
			["userId"] = nil,
			["username"] = nil,
			["displayName"] = nil,
			["hasVerifiedBadge"] = nil,
			["isOnline"] = true,
			["isSelected"] = false,
			["LayoutOrder"] = nil,
			["onActivated"] = nil,
			["memoKey"] = nil,
			["userId"] = v_u_75.UserId,
			["username"] = v_u_75.Name,
			["displayName"] = v_u_75.DisplayName,
			["hasVerifiedBadge"] = v_u_37(v_u_75),
			["LayoutOrder"] = p_u_66.getLayoutBinding("PlayerCell" .. v77, v82),
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) v_u_67, (ref) v_u_19, (copy) v_u_75
				v_u_67.openReportDialog(v_u_19.ReportType.Player, v_u_75)
			end,
			["memoKey"] = v81
		}
		local v87 = {}
		local v88
		if v68 and p_u_66.props.isReportMenuOpen then
			local v89 = v_u_4.createElement
			local v90 = v_u_42
			local v91 = {
				["userId"] = nil,
				["hideOnError"] = true,
				["iconStyle"] = "SpeakerLight",
				["size"] = nil,
				["onClicked"] = nil
			}
			local v92 = v_u_75.UserId
			v91.userId = tostring(v92)
			v91.size = UDim2.fromOffset(36, 36)
			function v91.onClicked() -- name: onClicked
				-- upvalues: (ref) v_u_25, (copy) v_u_75, (ref) v_u_28
				v_u_25:ToggleMutePlayer(v_u_75.UserId, v_u_28.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
			v88 = v89(v90, v91) or nil
		else
			v88 = nil
		end
		v87.VoiceIndicator = v88
		v_u_70[v83] = v84(v85, v86, v87)
		v71 = v82 + 1
		v_u_74 = v_u_74 + 73
	end
	v_u_70.DividerEnd = v_u_4.createElement(v_u_11, {
		["LayoutOrder"] = p_u_66.getLayoutBinding("DividerEnd", v71),
		["Size"] = UDim2.new(1, 0, 0, 1)
	})
	local _ = v71 + 1
	return v_u_36(function(p93)
		-- upvalues: (ref) v_u_3, (ref) v_u_39, (ref) v_u_4, (ref) v_u_34, (ref) v_u_10, (ref) v_u_74, (copy) p_u_66, (copy) v_u_70
		local v94 = {
			["Theme"] = v_u_3.Dictionary.join(p93.Theme, v_u_39)
		}
		local v95 = v_u_3.Dictionary.join(p93, v94)
		return v_u_4.createElement(v_u_34, {
			["style"] = v95
		}, { v_u_4.createElement(v_u_10, {
				["Size"] = UDim2.fromScale(1, 1),
				["CanvasSize"] = UDim2.new(1, 0, 0, v_u_74),
				["scrollingFrameRef"] = p_u_66.scrollingFrameRef
			}, v_u_70) })
	end)
end
function v40.render(p96) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_20
	local v97 = p96.props.reportCategory ~= nil
	return v_u_4.createFragment({
		["ModalDialog"] = v_u_4.createElement(v_u_20, {
			["visible"] = p96.props.isReportMenuOpen,
			["screenSize"] = p96.props.screenSize,
			["headerBar"] = p96:renderHeaderBar(),
			["showCloseButton"] = not v97,
			["contents"] = p96:renderContents(),
			["onDismiss"] = p96.closeDialog
		})
	})
end
function v40.didUpdate(p98, p99) -- name: didUpdate
	-- upvalues: (copy) v_u_4
	if p99.isReportMenuOpen and not p98.props.isReportMenuOpen then
		p98:setState({
			["isFilterMode"] = false,
			["filterText"] = nil,
			["filterText"] = v_u_4.None
		})
		local v100 = p98.scrollingFrameRef:getValue()
		if v100 and v100.CanvasPosition.Y > 0 then
			v100.CanvasPosition = Vector2.new(0, 0)
		end
	end
end
return v5.UNSTABLE_connect2(function(p101, _)
	-- upvalues: (copy) v_u_19
	return {
		["isReportMenuOpen"] = p101.report.currentPage == v_u_19.Page.Listing,
		["screenSize"] = p101.displayOptions.screenSize,
		["reportCategory"] = p101.report.reportCategory,
		["canNavigateBack"] = #p101.report.history > 1
	}
end, function(p_u_102)
	-- upvalues: (copy) v_u_16, (copy) v_u_22, (copy) v_u_19, (copy) v_u_17, (copy) v_u_23, (copy) v_u_18
	return {
		["navigateBack"] = function(p103) -- name: navigateBack
			-- upvalues: (copy) p_u_102, (ref) v_u_16, (ref) v_u_22, (ref) v_u_19
			p_u_102(v_u_16())
			v_u_22(v_u_19.Page.Listing, v_u_19.Analytics.ReportFlowBack, {
				["source"] = v_u_19.Page.Listing,
				["filterTextChanged"] = p103
			})
		end,
		["closeDialog"] = function(p104) -- name: closeDialog
			-- upvalues: (copy) p_u_102, (ref) v_u_17, (ref) v_u_22, (ref) v_u_19, (ref) v_u_23
			p_u_102(v_u_17())
			v_u_22(v_u_19.Page.Listing, v_u_19.Analytics.ReportFlowAbandoned, {
				["source"] = v_u_19.Page.Listing,
				["filterTextChanged"] = p104
			})
			v_u_23.endAbuseReportSession()
		end,
		["openReportDialog"] = function(p105, p106, p107) -- name: openReportDialog
			-- upvalues: (copy) p_u_102, (ref) v_u_18, (ref) v_u_22, (ref) v_u_19
			p_u_102(v_u_18(p105, p106, p107))
			v_u_22(v_u_19.Page.Listing, v_u_19.Analytics.ReportFlowAdvance, {
				["source"] = v_u_19.Page.Listing,
				["reportType"] = p105
			})
		end
	}
end)(v40)