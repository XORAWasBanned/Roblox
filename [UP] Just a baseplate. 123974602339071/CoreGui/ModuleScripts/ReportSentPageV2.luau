-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ReportSentPageV2
local v1 = game:GetService("Players")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v4 = v2:WaitForChild("RobloxGui")
local v5 = v4:WaitForChild("Modules")
local v6 = game:GetService("RbxAnalyticsService")
local v7 = game:GetService("EventIngestService")
local v8 = require(v3.Workspace.Packages.Analytics).Analytics.new(v6)
local v9 = require(v3.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local v_u_10 = require(v3.Packages.Roact)
local v11 = script:FindFirstAncestor("Settings")
local v_u_12 = require(v5.Settings.SettingsPageFactory)
local v_u_13 = require(v3.Workspace.Packages.AppCommonLib).Create
local v14 = require(v4.Modules.AbuseReportMenu).ReportAbuseAnalytics
local v15 = require(v11.Analytics.BlockingAnalytics)
local v_u_16 = require(v3.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v17 = require(v3.Workspace.Packages.FocusNavigationUtils)
local v_u_18 = v17.FocusRoot
local v_u_19 = v17.FocusNavigableSurfaceIdentifierEnum
local v_u_20 = require(v11.Components.ReportConfirmation.ReportConfirmationContainer)
local v21 = v4.Modules.Chrome
local v_u_22 = require(v3.Workspace.Packages.Chrome).Enabled()
local v_u_23
if v_u_22 then
	v_u_23 = require(v21.Service)
else
	v_u_23 = nil
end
local v_u_24 = require(v3.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v25 = nil
local v26 = v1.LocalPlayer
local v_u_27 = v25
while not v26 do
	v1.ChildAdded:wait()
	v26 = v1.LocalPlayer
end
local v_u_28 = v14.new(v9.new(v7), v8.Diag, v14.MenuContexts.LegacySentPage)
local v_u_29 = v15.new(v26.UserId, {
	["EventStream"] = v6
})
local v_u_31 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	local v30 = v_u_12:CreateNewPage()
	v30.TabHeader = nil
	v30.PageListLayout.Parent = nil
	v30.ShouldShowBottomBar = false
	v30.ShouldShowHubBar = false
	v30.IsPageClipped = false
	v30.Page.Name = "ReportSentPageV2"
	v30.Page.Size = UDim2.fromScale(1, 0)
	v30.Page.AutomaticSize = Enum.AutomaticSize.Y
	v30.Root = v_u_13("Frame")({
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Name"] = "ReportSentContents",
		["Parent"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["Parent"] = v30.Page
	})
	return v30
end)()
function v_u_31.UpdateMenu(p_u_32) -- name: UpdateMenu
	-- upvalues: (ref) v_u_27, (copy) v_u_10, (copy) v_u_28, (copy) v_u_29, (copy) v_u_16, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_22, (copy) v_u_24, (copy) v_u_23
	local v33 = p_u_32.ReportedPlayer
	if v_u_27 ~= nil then
		v_u_10.unmount(v_u_27)
		v_u_27 = nil
	end
	if p_u_32.settingsShowChangedSignal then
		p_u_32.settingsShowChangedSignal:disconnect()
		p_u_32.settingsShowChangedSignal = nil
	end
	p_u_32.settingsShowChangedSignal = p_u_32.HubRef.SettingsShowSignal:connect(function(p34)
		-- upvalues: (copy) p_u_32
		if not p34 then
			p_u_32:HandleDone()
		end
	end)
	local v_u_35 = Instance.new("BindableEvent")
	p_u_32.SizeChangedSignal = p_u_32.Root:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: (copy) v_u_35, (copy) p_u_32
		v_u_35:Fire(p_u_32.Root.AbsoluteSize)
	end)
	local v36 = {
		["player"] = {
			["UserId"] = v33.UserId,
			["Name"] = v33.Name,
			["DisplayName"] = v33.DisplayName
		},
		["closeMenu"] = function() -- name: closeMenu
			-- upvalues: (copy) p_u_32
			p_u_32:HandleDone()
		end,
		["isVoiceReport"] = p_u_32.isVoiceReport,
		["ZIndex"] = p_u_32.HubRef.Shield.ZIndex + 1,
		["reportAbuseAnalytics"] = v_u_28,
		["blockingAnalytics"] = v_u_29,
		["onSizeChanged"] = v_u_35.Event
	}
	local v37 = v_u_10.createElement
	local v38 = v_u_16
	local v39 = {
		["FocusRoot"] = v_u_10.createElement(v_u_18, {
			["surfaceIdentifier"] = nil,
			["isIsolated"] = true,
			["isAutoFocusRoot"] = true,
			["surfaceIdentifier"] = v_u_19.RouterView
		}, {
			["ThankYouScreenRoot"] = v_u_10.createElement(v_u_20, v36)
		})
	}
	local v40 = v37(v38, {}, v39)
	if v_u_22 and v_u_24 then
		v_u_23:setHideShortcutBar("ReportSentPageV2", true)
	end
	v_u_27 = v_u_10.mount(v40, p_u_32.Root, "ReportSentPageV2")
end
function v_u_31.ShowReportedPlayer(p41, p42, p43) -- name: ShowReportedPlayer
	-- upvalues: (copy) v_u_31
	p41.ReportedPlayer = p42
	p41.isVoiceReport = p43
	p41:UpdateMenu()
	p41.HubRef:SwitchToPage(v_u_31, true)
end
function v_u_31.HandleDone(p44) -- name: HandleDone
	-- upvalues: (copy) v_u_22, (copy) v_u_24, (copy) v_u_23, (ref) v_u_27, (copy) v_u_10
	if v_u_22 and v_u_24 then
		v_u_23:setHideShortcutBar("ReportSentPageV2", false)
	end
	if v_u_27 ~= nil then
		v_u_10.unmount(v_u_27)
		v_u_27 = nil
	end
	if p44.settingsShowChangedSignal then
		p44.settingsShowChangedSignal:disconnect()
		p44.settingsShowChangedSignal = nil
	end
	if p44.SizeChangedSignal then
		p44.SizeChangedSignal:disconnect()
		p44.SizeChangedSignal = nil
	end
	p44.HubRef:SetVisibility(false, true)
end
return v_u_31