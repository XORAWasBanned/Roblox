-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ReportAbuseMenuContainerPage
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = v1:WaitForChild("RobloxGui")
local v_u_4 = require(v2.Packages.Roact)
local v_u_5 = require(v_u_3.Modules.Settings.Utility)
local v_u_6 = require(v2.Packages.BuilderIcons)
local v_u_7 = v_u_6.Migration.uiblox
local v8 = require(v2.Packages.Foundation)
local v_u_9 = v8.Enums.IconName
local v_u_10 = v8.Enums.IconVariant
local v_u_11 = require(v_u_3.Modules.AbuseReportMenu).LegacyAbuseReportMenu
local v_u_12 = require(v_u_3.Modules.AbuseReportMenu).AbuseReportMenuV2
local v_u_13 = require(v_u_3.Modules.AbuseReportMenu).ReportAbuseAnalytics
local v14 = v_u_3.Modules.Chrome
local v_u_15 = require(v2.Workspace.Packages.Chrome).Enabled()
local v_u_16
if v_u_15 then
	v_u_16 = require(v14.Service)
else
	v_u_16 = nil
end
local v17 = require(v2.Workspace.Packages.SharedFlags)
local v_u_18 = v17.FFlagInExperienceReportClosingBugfix
local v_u_19 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_20 = require(v_u_3.Modules.AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local v_u_21 = require(v_u_3.Modules.AbuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)
local v_u_22 = require(v_u_3.Modules.AbuseReportMenu.Flags.FFlagReportFocusNavCloseButton)
local v_u_23 = v17.FFlagStandardizeSafetyIcon
local v_u_24 = game:DefineFastFlag("SwitchOverToAbuseReportMenuV2", false)
local v_u_47 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_23, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6, (copy) v_u_19, (copy) v_u_24, (copy) v_u_4, (copy) v_u_12, (copy) v_u_11, (copy) v_u_18, (copy) v_u_15, (copy) v_u_16, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22
	local v_u_25 = require(v_u_3.Modules.Settings.SettingsPageFactory):CreateNewPage()
	function v_u_25._onHiddenCallback() end
	function v_u_25._onDisplayedCallback() end
	function v_u_25._onDisplayingCallback() end
	function v_u_25._onSettingsHiddenCallback() end
	function v_u_25._setNextPlayerToReportCallback() end
	function v_u_25._onMenuWidthChange() end
	function v_u_25.SetHub(_, p26) -- name: SetHub
		-- upvalues: (copy) v_u_25
		v_u_25.HubRef = p26
		v_u_25.HubRef.SettingsShowSignal:connect(function(p27)
			-- upvalues: (ref) v_u_25
			if not p27 then
				v_u_25:onSettingsHidden()
			end
		end)
		return v_u_25
	end
	function v_u_25.showAlert(_, p28, p29, p30) -- name: showAlert
		-- upvalues: (ref) v_u_5, (copy) v_u_25
		v_u_5:ShowAlert(p28, p29, v_u_25.HubRef, p30)
	end
	function v_u_25.showReportSentPage(_, p31) -- name: showReportSentPage
		-- upvalues: (copy) v_u_25
		v_u_25.HubRef.ReportSentPageV2:ShowReportedPlayer(p31, true)
	end
	function v_u_25.HideMenu(_) -- name: HideMenu
		-- upvalues: (copy) v_u_25
		v_u_25.HubRef:SetVisibility(false, true)
	end
	function v_u_25.ShowMenu(_) -- name: ShowMenu
		-- upvalues: (copy) v_u_25
		v_u_25.HubRef:SetVisibility(true, true, v_u_25, nil, "ScreenshotUnhide")
	end
	function v_u_25.onHidden(_) -- name: onHidden
		-- upvalues: (copy) v_u_25
		v_u_25._onHiddenCallback()
	end
	function v_u_25.onSettingsHidden(_) -- name: onSettingsHidden
		-- upvalues: (copy) v_u_25
		v_u_25._onSettingsHiddenCallback()
	end
	function v_u_25.onDisplayed(_) -- name: onDisplayed
		-- upvalues: (copy) v_u_25
		v_u_25._onDisplayedCallback()
	end
	function v_u_25.onDisplaying(_) -- name: onDisplaying
		-- upvalues: (copy) v_u_25
		v_u_25._onDisplayingCallback()
	end
	function v_u_25.setNextPlayerToReport(_, p32) -- name: setNextPlayerToReport
		-- upvalues: (copy) v_u_25
		v_u_25._setNextPlayerToReportCallback(p32)
	end
	v_u_25.TabHeader.Name = "ReportAbuseTab"
	local v33 = v_u_7["icons/actions/feedback"]
	local v34 = v_u_23 and {
		["name"] = v_u_9.Flag,
		["variant"] = v_u_10.Regular
	} or v33
	v_u_25.TabHeader.TabLabel.Icon.Text = v34.name
	v_u_25.TabHeader.TabLabel.Icon.FontFace = v_u_6.Font[v34.variant]
	v_u_25.TabHeader.TabLabel.Title.Text = "Report"
	v_u_25.Page.Name = "ReportAbuseMenuNewContainerPage"
	v_u_25.ShouldShowBottomBar = not v_u_19
	v_u_25.ShouldShowHubBar = true
	v_u_25.ShouldDisableDefaultScroll = v_u_24
	local v35 = v_u_4.createElement
	local v36
	if v_u_24 then
		v36 = v_u_12
	else
		v36 = v_u_11
	end
	local v46 = v35(v36, {
		["hideReportTab"] = function() -- name: hideReportTab
			-- upvalues: (copy) v_u_25
			v_u_25:HideMenu()
		end,
		["showReportTab"] = function() -- name: showReportTab
			-- upvalues: (copy) v_u_25
			v_u_25:ShowMenu()
		end,
		["registerOnReportTabHidden"] = function(p37) -- name: registerOnReportTabHidden
			-- upvalues: (copy) v_u_25
			v_u_25._onHiddenCallback = p37
		end,
		["registerOnReportTabDisplayed"] = function(p38) -- name: registerOnReportTabDisplayed
			-- upvalues: (copy) v_u_25
			v_u_25._onDisplayedCallback = p38
		end,
		["registerOnReportTabDisplaying"] = function(p39) -- name: registerOnReportTabDisplaying
			-- upvalues: (copy) v_u_25
			v_u_25._onDisplayingCallback = p39
		end,
		["registerOnMenuWidthChange"] = function(p40) -- name: registerOnMenuWidthChange
			-- upvalues: (copy) v_u_25
			v_u_25._onMenuWidthChange = p40
		end,
		["registerSetNextPlayerToReport"] = function(p41) -- name: registerSetNextPlayerToReport
			-- upvalues: (copy) v_u_25
			v_u_25._setNextPlayerToReportCallback = p41
		end,
		["registerOnSettingsHidden"] = function(p42) -- name: registerOnSettingsHidden
			-- upvalues: (copy) v_u_25
			v_u_25._onSettingsHiddenCallback = p42
		end,
		["showReportSentPage"] = function(p43) -- name: showReportSentPage
			-- upvalues: (copy) v_u_25
			v_u_25:showReportSentPage(p43)
		end,
		["onReportComplete"] = function(p44) -- name: onReportComplete
			-- upvalues: (ref) v_u_18, (ref) v_u_15, (ref) v_u_16, (copy) v_u_25
			if v_u_18 and v_u_15 then
				v_u_16:setShortcutBar(nil)
			end
			v_u_25:showAlert(p44, "Ok", function()
				-- upvalues: (ref) v_u_25
				v_u_25:HideMenu()
			end)
		end,
		["onDropdownMenuOpenChange"] = v_u_20 and v_u_15 and function(p45)
			-- upvalues: (ref) v_u_16
			v_u_16:setHideShortcutBar("InExperienceReportDropdown", p45)
		end or nil,
		["getSettingsHubRef"] = (v_u_21 or v_u_22) and function()
			-- upvalues: (copy) v_u_25
			return v_u_25.HubRef
		end or nil
	})
	v_u_4.mount(v46, v_u_25.Page, "AbuseReportMenu")
	v_u_25.Page.Size = UDim2.new(1, 0, 0, 0)
	v_u_25.Page.AutomaticSize = Enum.AutomaticSize.Y
	v_u_25.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
		-- upvalues: (copy) v_u_25
		v_u_25._onMenuWidthChange(v_u_25.Page.AbsoluteSize.X)
	end)
	return v_u_25
end)()
v_u_47.Displayed.Event:connect(function()
	-- upvalues: (ref) v_u_47
	v_u_47:onDisplayed()
end)
v_u_47.Displaying.Event:connect(function()
	-- upvalues: (ref) v_u_47
	v_u_47:onDisplaying()
end)
v_u_47.Hidden.Event:connect(function()
	-- upvalues: (ref) v_u_47
	v_u_47:onHidden()
end)
function v_u_47.ReportPlayer(_, p48, p49) -- name: ReportPlayer
	-- upvalues: (copy) v_u_13, (ref) v_u_47
	if p48 then
		v_u_13:startAbuseReportSession(p49)
		v_u_47:setNextPlayerToReport(p48)
		if not v_u_47.HubRef:GetVisibility() then
			v_u_47.HubRef:SetVisibility(true, false, v_u_47)
			return
		end
		v_u_47.HubRef:SwitchToPage(v_u_47, false, nil, nil, nil, {
			["entrypoint"] = v_u_13:getAbuseReportSessionEntryPoint()
		})
	end
end
return v_u_47