-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.V2.AbuseReportMenu
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("HttpService")
local v_u_4 = game:GetService("LocalizationService")
local v5 = v2.RobloxGui
local v6 = script:FindFirstAncestor("AbuseReportMenu")
local v_u_7 = require(v1.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v_u_8 = require(v1.Packages.React)
local v_u_9 = require(v1.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper
local v_u_10 = require(v1.Workspace.Packages.RoactServiceTags).RoactNetworking
local v_u_11 = require(v1.Workspace.Packages.RoactServices).RoactServices
local v12 = require(v1.Workspace.Packages.FocusNavigationUtils)
local v_u_13 = v12.FocusNavigableSurfaceIdentifierEnum
local v_u_14 = v12.FocusRoot
local v_u_15 = v12.FocusNavigableSurfaceRegistry.useRegistryEntry
local v_u_16 = require(v1.Workspace.Packages.GenericAbuseReporting.DynamicReportInExpContainer)
local v_u_17 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_18 = require(v1.Workspace.Packages.Localization).LocalizationProvider
local v_u_19 = require(v5.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_20 = require(v6.Hooks.useCaptureScreenshotV2)
local v_u_21 = require(script.Parent.useSettingsHubCloseButton)
local v_u_22 = require(v6.Flags.isAbuseReportMenuOpenCloseSignalEnabled)
local v_u_23 = require(v6.Flags.FFlagReportFocusNavCloseButton)
local v_u_24 = require(v6.Flags.FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelay)
local v_u_25 = require(script.Parent.safetyServiceSignals)
local v_u_26 = require(script.Parent.inExpChatMessagesLoader)
local v_u_27 = require(script.Parent.inExpVoiceUsersLoader)
local v_u_28 = require(v1.Packages.LuauPolyfill).setTimeout
local function v_u_42(p29) -- name: AbuseReportMenuContentInner
	-- upvalues: (copy) v_u_15, (copy) v_u_13, (copy) v_u_23, (copy) v_u_21, (copy) v_u_8, (copy) v_u_14, (copy) v_u_16, (copy) v_u_26, (copy) v_u_27, (copy) v_u_19
	local v30 = v_u_15(v_u_13.CentralOverlay) == nil
	local v31, v32
	if v_u_23 then
		v31, v32 = v_u_21(p29.getSettingsHubRef, p29.isReportTabVisible)
	else
		v31 = nil
		v32 = nil
	end
	local v33 = v_u_8.createElement
	local v34 = "Frame"
	local v35 = {
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v36 = {}
	local v37 = v_u_8.createElement
	local v38 = v_u_14
	local v39 = {
		["frameProps"] = nil,
		["isFocusable"] = nil,
		["isAutoFocusRoot"] = nil,
		["isIsolated"] = true,
		["surfaceIdentifier"] = nil
	}
	local v40 = {
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v41
	if v_u_23 and v31 ~= nil then
		v41 = Enum.SelectionBehavior.Escape
	else
		v41 = nil
	end
	v40.SelectionBehaviorUp = v41
	v40.NextSelectionUp = v31
	v39.frameProps = v40
	v39.isFocusable = v30
	v39.isAutoFocusRoot = not v_u_23 and true or not v32
	v39.surfaceIdentifier = v_u_13.RouterView
	v36.FocusNavigationCoreScriptsWrapper = v37(v38, v39, {
		["DynamicReportInExpContainer"] = v_u_8.createElement(v_u_16, {
			["onClose"] = p29.onClose,
			["isReportTabVisible"] = p29.isReportTabVisible,
			["reportAnythingSnapshotRef"] = p29.reportAnythingSnapshotRef,
			["inExpChatMessagesLoader"] = v_u_26,
			["inExpVoiceUsersLoader"] = v_u_27,
			["voiceChatServiceManager"] = v_u_19,
			["preselectedPlayer"] = p29.preselectedPlayer,
			["onReportFinish"] = p29.onReportFinish
		})
	})
	return v33(v34, v35, v36)
end
local function v_u_59(p_u_43) -- name: AbuseReportMenuContent
	-- upvalues: (copy) v_u_8, (copy) v_u_20, (copy) v_u_22, (copy) v_u_25, (copy) v_u_28, (copy) v_u_24, (copy) v_u_42, (copy) v_u_23
	local v_u_44, v_u_45 = v_u_8.useState(false)
	local v46, v_u_47 = v_u_8.useState(nil)
	local v_u_48 = v_u_20()
	local v_u_49 = v_u_8.useRef(p_u_43.hideReportTab)
	v_u_49.current = p_u_43.hideReportTab
	local v_u_50 = v_u_8.useRef(p_u_43.showReportTab)
	v_u_50.current = p_u_43.showReportTab
	local v_u_51 = v_u_8.useRef(false)
	local v_u_52 = v_u_8.useRef(false)
	v_u_8.useEffect(function()
		-- upvalues: (copy) v_u_51, (copy) v_u_45, (copy) v_u_48, (copy) v_u_49, (copy) v_u_50, (copy) p_u_43, (copy) v_u_52, (copy) v_u_47, (ref) v_u_22, (ref) v_u_25, (ref) v_u_28, (ref) v_u_24
		local function v53() -- name: onOpen
			-- upvalues: (ref) v_u_51, (ref) v_u_45, (ref) v_u_48, (ref) v_u_49, (ref) v_u_50
			if not v_u_51.current then
				v_u_51.current = true
				v_u_45(true)
				v_u_48.captureIfApplicable({
					["hide"] = v_u_49.current,
					["show"] = v_u_50.current
				})
			end
		end
		p_u_43.registerOnReportTabDisplaying(v53)
		p_u_43.registerOnReportTabHidden(function()
			-- upvalues: (ref) v_u_48, (ref) v_u_51, (ref) v_u_52, (ref) v_u_45, (ref) v_u_47, (ref) v_u_22, (ref) v_u_25
			if not v_u_48.getIsCapturing() then
				v_u_51.current = false
				v_u_52.current = false
				v_u_45(false)
				v_u_47(nil)
				if v_u_22() then
					v_u_25.reportMenuTabClose()
				end
			end
		end)
		p_u_43.registerSetNextPlayerToReport(function(p54)
			-- upvalues: (ref) v_u_47
			v_u_47(p54)
		end)
		p_u_43.registerOnSettingsHidden(function()
			-- upvalues: (ref) v_u_28, (ref) v_u_51, (ref) v_u_48, (ref) v_u_24
			v_u_28(function()
				-- upvalues: (ref) v_u_51, (ref) v_u_48
				if not v_u_51.current then
					v_u_48.reset()
				end
			end, v_u_24)
		end)
	end, {
		p_u_43.registerOnReportTabHidden,
		p_u_43.registerSetNextPlayerToReport,
		p_u_43.registerOnSettingsHidden,
		p_u_43.registerOnReportTabDisplaying,
		v_u_48.captureIfApplicable,
		v_u_48.getIsCapturing,
		v_u_48.reset
	})
	v_u_8.useEffect(function()
		-- upvalues: (copy) v_u_44, (copy) v_u_52, (ref) v_u_22, (copy) v_u_48, (ref) v_u_25
		if v_u_44 and not v_u_52.current then
			if v_u_22() then
				if not v_u_48.isCaptureApplicable or v_u_48.isScreenshotTaken then
					v_u_52.current = true
					v_u_25.reportMenuTabOpen()
				end
			end
		else
			return
		end
	end, { v_u_44, v_u_48.isScreenshotTaken, v_u_48.isCaptureApplicable })
	local v55 = v_u_8.createElement
	local v56 = v_u_42
	local v57 = {
		["isReportTabVisible"] = v_u_44,
		["preselectedPlayer"] = v46,
		["reportAnythingSnapshotRef"] = v_u_48.snapshotRef
	}
	local v58
	if v_u_23 then
		v58 = p_u_43.getSettingsHubRef
	else
		v58 = nil
	end
	v57.getSettingsHubRef = v58
	v57.onClose = p_u_43.hideReportTab
	function v57.onReportFinish() -- name: onReportFinish
		-- upvalues: (copy) v_u_47
		v_u_47(nil)
	end
	return v55(v56, v57)
end
return function(p60) -- name: AbuseReportMenu
	-- upvalues: (copy) v_u_17, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_18, (copy) v_u_11, (copy) v_u_10, (copy) v_u_9, (copy) v_u_3, (copy) v_u_59
	local v61 = v_u_17.new(v_u_4.RobloxLocaleId)
	local v62 = v_u_8.createElement
	local v63 = v_u_7
	local v64 = v_u_8.createElement
	local v65 = v_u_18
	local v66 = {}
	local v67 = v_u_8.createElement
	local v68 = v_u_11.ServiceProvider
	local v69 = {
		["services"] = {
			[v_u_10] = v_u_9(v_u_3)
		}
	}
	v66.ServicesProvider = v67(v68, v69, {
		["AbuseReportMenuContent"] = v_u_8.createElement(v_u_59, p60)
	})
	return v62(v63, nil, v64(v65, {
		["localization"] = v61
	}, v66))
end