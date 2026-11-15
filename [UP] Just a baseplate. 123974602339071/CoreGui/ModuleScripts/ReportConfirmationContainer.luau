-- Path: CoreGui.RobloxGui.Modules.Settings.Components.ReportConfirmation.ReportConfirmationContainer
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Roact)
local v4 = require(v2.Packages.t)
local v_u_5 = require(v2.Packages.Promise)
local v6 = require(v2.Packages.enumerate)
local v_u_7 = require(v2.Packages.UIBlox).Core.Style.withStyle
local v_u_8 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v9 = require(v2.Workspace.Packages.BlockingUtility)
local v_u_10 = require(v2.Workspace.Packages.RobloxTranslator)
local v11 = require(v1.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_12 = require(v1.Modules.VoiceChat.Constants)
local v_u_13 = require(v1.Modules.Flags.GetFFlagVoiceARUnblockingUnmutingEnabled)
local v_u_14 = require(script.Parent.ReportActionSelection)
local v_u_15 = require(script.Parent.ReportActionAreYouSure)
local v_u_16 = v6("ReportPages", {
	["SelectActions"] = 1,
	["ConfirmAction"] = 2
})
local v17 = v_u_3.PureComponent:extend("ReportConfirmationContainer")
v17.defaultProps = {
	["blockingUtility"] = nil,
	["voiceChatServiceManager"] = nil,
	["isVoiceReport"] = false,
	["closeMenu"] = nil,
	["blockingUtility"] = v9,
	["voiceChatServiceManager"] = v11,
	["closeMenu"] = function() end
}
local v18 = v4.interface
local v19 = {
	["player"] = v4.strictInterface({
		["UserId"] = v4.number,
		["Name"] = v4.string,
		["DisplayName"] = v4.string
	}),
	["isVoiceReport"] = v4.boolean,
	["closeMenu"] = v4.callback,
	["blockingAnalytics"] = v4.optional(v4.table),
	["reportAbuseAnalytics"] = v4.optional(v4.table)
}
v17.validateProps = v18(v19)
function v17.init(p_u_20) -- name: init
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_16, (copy) v_u_5
	local v_u_21 = p_u_20.props.player
	local v22 = p_u_20.props.voiceChatServiceManager.participants
	p_u_20:setState({
		["absoluteWidth"] = 0
	})
	if p_u_20.props.onSizeChanged then
		p_u_20.props.onSizeChanged:Connect(function(p23)
			-- upvalues: (copy) p_u_20
			p_u_20:setState({
				["absoluteWidth"] = p23.X
			})
		end)
	end
	local v24 = v_u_21.UserId
	local v25 = v22[tostring(v24)]
	p_u_20.userFullName = v_u_21.DisplayName .. "(@" .. v_u_21.Name .. ")"
	function p_u_20.onMuteCheckboxActivated(p26)
		-- upvalues: (copy) p_u_20
		p_u_20:setState({
			["muteFlipped"] = p26
		})
	end
	function p_u_20.onBlockCheckboxActivated(p27)
		-- upvalues: (copy) p_u_20
		p_u_20:setState({
			["blockFlipped"] = p27
		})
	end
	function p_u_20.processMuteAndBlocking()
		-- upvalues: (copy) p_u_20, (copy) v_u_21, (ref) v_u_13, (ref) v_u_12
		local v28 = p_u_20.state.blockFlipped
		local v29 = p_u_20.state.muteFlipped
		if v28 and not p_u_20.state.targetInitiallyBlocked then
			if p_u_20.props.blockingUtility:BlockPlayerAsync(v_u_21) then
				p_u_20.props.blockingAnalytics:action("SettingsHub", "blockUser", {
					["blockeeUserId"] = v_u_21.UserId
				})
			end
		elseif not v28 and (p_u_20.state.targetInitiallyBlocked and (v_u_13() and p_u_20.props.blockingUtility:UnblockPlayerAsync(v_u_21))) then
			p_u_20.props.blockingAnalytics:action("SettingsHub", "unblockUser", {
				["blockeeUserId"] = v_u_21.UserId
			})
		end
		local v30 = p_u_20.props.voiceChatServiceManager.participants
		local v31 = v_u_21.UserId
		local v32 = v30[tostring(v31)]
		if v29 and not p_u_20.state.targetInitiallyVoiceMuted then
			p_u_20.props.blockingUtility:MutePlayer(v_u_21)
			p_u_20.props.reportAbuseAnalytics:reportEventAndIncrement("muteUser")
			if v32 and not v32.isMutedLocally then
				p_u_20.props.voiceChatServiceManager:ToggleMutePlayer(v_u_21.UserId, v_u_12.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
		elseif not v29 and (p_u_20.state.targetInitiallyVoiceMuted and v_u_13()) then
			p_u_20.props.blockingUtility:UnmutePlayer(v_u_21)
			p_u_20.props.reportAbuseAnalytics:reportEventAndIncrement("unmuteUser")
			if v32 and v32.isMutedLocally then
				p_u_20.props.voiceChatServiceManager:ToggleMutePlayer(v_u_21.UserId, v_u_12.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
		end
		p_u_20.props.closeMenu()
	end
	function p_u_20.onActionSelectionDoneActivated(p33, p34)
		-- upvalues: (copy) p_u_20, (ref) v_u_16
		p_u_20:setState({
			["blockFlipped"] = p33,
			["muteFlipped"] = p34
		})
		if (p33 or p34) and (p34 ~= p_u_20.state.targetInitiallyVoiceMuted or p33 ~= p_u_20.state.targetInitiallyBlocked) then
			p_u_20:setState({
				["currentPage"] = v_u_16.ConfirmAction
			})
		else
			p_u_20.processMuteAndBlocking()
		end
	end
	function p_u_20.onYesOrNoConfirmation()
		-- upvalues: (copy) p_u_20
		p_u_20.processMuteAndBlocking()
	end
	function p_u_20.onYesOrNoCancel()
		-- upvalues: (copy) p_u_20, (ref) v_u_16
		p_u_20:setState({
			["currentPage"] = v_u_16.SelectActions
		})
	end
	p_u_20:setState({
		["currentPage"] = v_u_16.SelectActions
	})
	if v25 then
		p_u_20:setState({
			["targetInitiallyVoiceMuted"] = v25.isMutedLocally,
			["muteFlipped"] = v25.isMutedLocally
		})
	else
		p_u_20:setState({
			["targetInitiallyVoiceMuted"] = false,
			["muteFlipped"] = false
		})
	end
	local v_u_35 = p_u_20.props.blockingUtility
	local v_u_36 = v_u_21.UserId
	v_u_5.new(function(p37, _)
		-- upvalues: (copy) v_u_35, (copy) v_u_36
		p37(v_u_35:IsPlayerBlockedByUserId(v_u_36))
	end):andThen(function(p38)
		-- upvalues: (copy) p_u_20
		p_u_20:setState({
			["targetInitiallyBlocked"] = p38,
			["blockFlipped"] = p38
		})
	end)
end
function v17.renderContent(p39) -- name: renderContent
	-- upvalues: (copy) v_u_3, (copy) v_u_14, (copy) v_u_10, (copy) v_u_15, (copy) v_u_16
	local v40 = p39.state.currentPage
	local v41
	if p39.props.onSizeChanged then
		local v42 = p39.state.absoluteWidth
		v41 = v42 >= 800 and 1.3 or (v42 > 600 and 1 or v42 / 600)
	else
		v41 = 1.3
	end
	local v43
	if p39.state.muteFlipped == nil then
		v43 = false
	else
		v43 = p39.state.muteFlipped
	end
	local v44
	if p39.state.blockFlipped == nil then
		v44 = false
	else
		v44 = p39.state.blockFlipped
	end
	local v45 = v_u_3.createElement(v_u_14, {
		["titleText"] = v_u_10:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"),
		["subtitleText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.ThankYou"),
		["instructionText"] = v_u_10:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"),
		["muteText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", {
			["Player"] = p39.userFullName
		}),
		["blockText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", {
			["Player"] = p39.userFullName
		}),
		["doneText"] = v_u_10:FormatByKey("Feature.SettingsHub.Action.Report.Done"),
		["showVoiceMuting"] = p39.props.isVoiceReport,
		["isVoiceMuted"] = v43 or p39.state.targetInitiallyVoiceMuted,
		["isBlocked"] = v44 or p39.state.targetInitiallyBlocked,
		["onMuteCheckboxActivated"] = p39.onMuteCheckboxActivated,
		["onBlockCheckboxActivated"] = p39.onBlockCheckboxActivated,
		["onDoneActivated"] = p39.onActionSelectionDoneActivated,
		["uiScale"] = v41,
		["ZIndex"] = p39.props.ZIndex
	})
	local v46 = v_u_3.createElement(v_u_15, {
		["mutedTitleText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", {
			["Player"] = p39.userFullName
		}),
		["blockedTitleText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", {
			["Player"] = p39.userFullName
		}),
		["mutedAndBlockedTitleText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockPlayer", {
			["DisplayName"] = p39.userFullName
		}),
		["mutedSubtitleText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutedSubtitleText", {
			["Player"] = p39.userFullName
		}),
		["blockedSubtitleText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockedSubtitleText", {
			["Player"] = p39.userFullName
		}),
		["mutedAndBlockedSubtitleText"] = v_u_10:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockWarning", {
			["Player"] = p39.userFullName
		}),
		["cancelText"] = v_u_10:FormatByKey("InGame.InspectMenu.Action.Cancel"),
		["confirmText"] = v_u_10:FormatByKey("InGame.InspectMenu.Action.Confirm"),
		["isMuted"] = p39.state.muteFlipped,
		["isBlocked"] = p39.state.blockFlipped,
		["onCancelActivated"] = p39.onYesOrNoCancel,
		["onConfirmActivated"] = p39.onYesOrNoConfirmation,
		["uiScale"] = v41,
		["ZIndex"] = p39.props.ZIndex
	})
	local v47 = nil
	if v40 == v_u_16.SelectActions then
		return v45
	end
	if v40 ~= v_u_16.ConfirmAction then
		v46 = v47
	end
	return v46
end
function v17.render(p_u_48) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_7
	if v_u_8 then
		return p_u_48:renderContent()
	else
		return v_u_7(function(_)
			-- upvalues: (copy) p_u_48
			return p_u_48:renderContent()
		end)
	end
end
return v17