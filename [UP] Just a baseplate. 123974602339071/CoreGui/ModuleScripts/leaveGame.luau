-- Path: CoreGui.RobloxGui.Modules.Settings.leaveGame
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("CorePackages")
local v3 = v1:WaitForChild("RobloxGui")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("RbxAnalyticsService")
local v_u_7 = game:GetService("Players")
local v8 = require(v_u_2.Workspace.Packages.SharedFlags)
local v_u_9 = v8.FFlagEnableGameLeftMessage
local v_u_10 = v8.FFlagSurvBloxEventTypeEnabled
local v_u_11 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_12 = require(v3.Modules.Settings.Flags.isExitModalRemoved)
local v_u_13 = require(v_u_2.Workspace.Packages.VoiceChatCore).Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry()
local v_u_14 = require(v3.Modules.Common.PerfUtils)
local v_u_15 = require(v_u_2.Packages.Cryo)
local v_u_16 = require(v_u_2.Workspace.Packages.MessageBus).MessageBus
local v_u_17 = require(v_u_2.Workspace.Packages.OnPlatformSurveys.SurveyEventPublisher)
local v_u_18 = require(v_u_2.Workspace.Packages.OnPlatformSurveys.WebViewEventType)
local v_u_19 = require(script:FindFirstAncestor("Settings").Analytics.CoreGuiFinalStateAnalytics).new()
v3:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v_u_20 = require(v3.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local v_u_21 = require(v3.Modules.Chrome.Flags.FFlagLeaveActionChromeShortcutTelemetry)
local v_u_22 = require(v_u_2.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local v_u_23 = require(v3.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v_u_24 = require(v3.Modules.Common.ReactSchedulingTracker)
local v_u_25
if v_u_13 then
	v_u_25 = require(v3.Modules.VoiceChat.VoiceChatServiceManager).default
else
	v_u_25 = nil
end
return function(p26, p27)
	-- upvalues: (copy) v_u_9, (copy) v_u_16, (copy) v_u_23, (copy) v_u_20, (copy) v_u_14, (copy) v_u_24, (copy) v_u_2, (copy) v_u_4, (copy) v_u_11, (copy) v_u_6, (copy) v_u_21, (copy) v_u_15, (copy) v_u_10, (copy) v_u_17, (copy) v_u_18, (copy) v_u_7, (copy) v_u_19, (copy) v_u_13, (copy) v_u_25, (copy) v_u_5, (copy) v_u_12, (copy) v_u_22
	if v_u_9 and not (p27 and p27.inhibitAppRating) then
		v_u_16.publish(v_u_23.OnAppRatingPromptEventDescriptor, {
			["gameTime"] = game:getGameTime()
		})
	end
	if v_u_20() then
		v_u_14.leavingGame()
	end
	v_u_24:reportSession()
	local v28 = require(v_u_2.Workspace.Packages.Memory).MemoryTracker()
	if v28 then
		v28:destroy()
	end
	v_u_4.SelectedCoreObject = nil
	local v29 = not v_u_11 and "" or v_u_6:GetPlaySessionId()
	local v30 = {
		["confirmed"] = v_u_23.AnalyticsConfirmedName
	}
	local v31 = game.GameId
	v30.universeid = tostring(v31)
	v30.source = v_u_23.AnalyticsLeaveGameSource
	v30.playsessionid = v29
	if v_u_21 and (p27 and p27.telemetryFields) then
		v30 = v_u_15.Dictionary.join(v30, p27.telemetryFields)
	end
	local v32 = v_u_6
	local v33 = v_u_23.AnalyticsTargetName
	local v34
	if p27 and p27.telemetryContext then
		v34 = p27.telemetryContext
	else
		v34 = v_u_23.AnalyticsInGameMenuName
	end
	v32:SetRBXEventStream(v33, v34, v_u_23.AnalyticsLeaveGameName, v30)
	if p26 then
		if v_u_10 then
			v_u_17.publishSurveyEvent(v_u_18.LeaveButtonClick)
		else
			local v35 = {
				["chromeSeenCount"] = tostring(0)
			}
			local v36 = v_u_7.LocalPlayer.UserId
			local v37 = tostring(v36)
			v_u_16.publish(v_u_23.OnSurveyEventDescriptor, {
				["eventType"] = v_u_23.SurveyEventType,
				["userId"] = v37,
				["customProps"] = v35
			})
		end
	end
	v_u_19:sendCoreGuiFinalAnalytic()
	if v_u_13 then
		v_u_25:ReportVoiceVolumeImpressionsIfNeeded()
	end
	v_u_5.RenderStepped:wait()
	v_u_5.RenderStepped:wait()
	if not (v_u_12 and (p27 and p27.shouldNativeExit)) then
		game:Shutdown()
	end
	settings().Rendering.QualityLevel = v_u_22()
	if v_u_12 and (p27 and p27.shouldNativeExit) then
		v_u_4:BroadcastNotification("", v_u_4:GetNotificationTypeList().NATIVE_EXIT)
	end
end