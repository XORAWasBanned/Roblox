-- Path: CoreGui.RobloxGui.Modules.Shell.Analytics
local v1 = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
local v2 = game:GetService("CorePackages")
local v3 = v1:FindFirstChild("Modules"):FindFirstChild("Shell")
local v4 = require(v2.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local v_u_5 = require(v2.Workspace.Packages.Analytics).Events.userInteractions
local v_u_6 = require(v2.Workspace.Packages.Analytics).Events.pageHeartbeat
local v_u_7 = require(v3.XboxPrimaryNav:FindFirstChild("contentHistory"))
local v_u_8 = require(v3.Experiment.XboxPrimaryNavIXPTest)
local v_u_9 = require(v3.Flags.GetFIntXboxPrimaryNavABLogging)
local v_u_10 = nil
local function v11()
	-- upvalues: (ref) v_u_10
	v_u_10 = game:GetService("RbxAnalyticsService")
end
pcall(v11)
local v_u_12 = game:GetService("EventIngestService")
local v_u_13 = game:GetService("UserInputService")
local v_u_14 = v4.new(v_u_10)
local v15 = {}
local v_u_16 = {
	["TenFoot"] = "tenFoot",
	["Classic"] = "classic"
}
function v15.SetRBXEvent(p17, p18) -- name: SetRBXEvent
	-- upvalues: (copy) v_u_13, (copy) v_u_12
	local v_u_19 = p17
	local v_u_20 = p18
	local v_u_21 = nil
	local v_u_22 = nil
	local function v23()
		-- upvalues: (ref) v_u_13, (ref) v_u_21, (ref) v_u_22, (ref) v_u_19, (ref) v_u_20, (ref) v_u_12
		if v_u_13:GetPlatform() == Enum.Platform.XBoxOne then
			v_u_21 = "console"
			v_u_22 = "XboxOne"
			v_u_19 = v_u_19 or ""
			v_u_20 = v_u_20 or {}
			v_u_12:SetRBXEvent(v_u_21, v_u_22, v_u_19, v_u_20)
		end
	end
	local _, _ = pcall(v23)
end
function v15.SetRBXEventStream(p24, p25) -- name: SetRBXEventStream
	-- upvalues: (copy) v_u_13, (copy) v_u_12
	local v_u_26 = p24
	local v_u_27 = p25
	local v_u_28 = nil
	local v_u_29 = nil
	local function v30()
		-- upvalues: (ref) v_u_13, (ref) v_u_28, (ref) v_u_29, (ref) v_u_26, (ref) v_u_27, (ref) v_u_12
		if v_u_13:GetPlatform() == Enum.Platform.XBoxOne then
			v_u_28 = "console"
			v_u_29 = "XboxOne"
			v_u_26 = v_u_26 or ""
			v_u_27 = v_u_27 or {}
			v_u_12:SetRBXEventStream(v_u_28, v_u_29, v_u_26, v_u_27)
		end
	end
	local _, _ = pcall(v30)
end
function v15.UpdateHeartbeatObject(p_u_31) -- name: UpdateHeartbeatObject
	-- upvalues: (ref) v_u_10
	local function v32()
		-- upvalues: (ref) v_u_10, (copy) p_u_31
		v_u_10:UpdateHeartbeatObject(p_u_31)
	end
	local _, _ = pcall(v32)
end
function v15.ReportCounter(p33, p34) -- name: ReportCounter
	-- upvalues: (copy) v_u_13, (ref) v_u_10
	local v_u_35 = p33
	local v_u_36 = p34
	local function v38()
		-- upvalues: (ref) v_u_13, (ref) v_u_35, (ref) v_u_36, (ref) v_u_10
		if v_u_13:GetPlatform() == Enum.Platform.XBoxOne then
			v_u_35 = v_u_35 or ""
			local v37 = v_u_35
			v_u_35 = "Xbox-" .. tostring(v37)
			v_u_36 = v_u_36 or 1
			v_u_10:ReportCounter(v_u_35, v_u_36)
		end
	end
	local _, _ = pcall(v38)
end
function v15.reportPageChanged() -- name: reportPageChanged
	-- upvalues: (copy) v_u_5, (copy) v_u_14
	v_u_5(v_u_14, "luaPage")
end
function v15.reportPageHeartbeat(p39, p40) -- name: reportPageHeartbeat
	-- upvalues: (copy) v_u_6, (copy) v_u_14
	v_u_6(v_u_14, p39, p40)
end
function v15.reportNavigation(p41, p42, p43) -- name: reportNavigation
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_16, (copy) v_u_13, (copy) v_u_12, (copy) v_u_9
	local v44 = v_u_7:getLastContentName()
	if p42 ~= v44 then
		local v_u_45 = "Navigation"
		local v_u_46 = {
			["activationType"] = p41,
			["toContent"] = p42,
			["fromContent"] = v44,
			["contentType"] = p43
		}
		local v47
		if v_u_8.isUserEnrolled() then
			v47 = v_u_16.TenFoot
		else
			v47 = v_u_16.Classic
		end
		v_u_46.navigationVersion = v47
		local v_u_48 = nil
		local v_u_49 = nil
		local function v50()
			-- upvalues: (ref) v_u_13, (ref) v_u_48, (ref) v_u_49, (ref) v_u_45, (ref) v_u_46, (ref) v_u_12
			if v_u_13:GetPlatform() == Enum.Platform.XBoxOne then
				v_u_48 = "console"
				v_u_49 = "XboxOne"
				v_u_45 = v_u_45 or ""
				v_u_46 = v_u_46 or {}
				v_u_12:SetRBXEventStream(v_u_48, v_u_49, v_u_45, v_u_46)
			end
		end
		local _, _ = pcall(v50)
		if v_u_9() > 1 then
			local v51 = print
			local v52 = "[ANALYTICS] Navigation"
			local v53 = "ActivationType:"
			local v54 = p41
			local v55 = "| ContentName:"
			local v56 = "| ContentType:"
			local v57 = "| PrevContentName:"
			local v58 = "| NavigationVersion:"
			local v59
			if v_u_8.isUserEnrolled() then
				v59 = v_u_16.TenFoot
			else
				v59 = v_u_16.Classic
			end
			v51(v52, v53, v54, v55, p42, v56, p43, v57, v44, v58, v59)
		end
	end
end
local function v_u_74(p60) -- name: reportNavigationLoaded
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_16, (copy) v_u_13, (copy) v_u_12, (copy) v_u_9
	local v61 = v_u_7:getLastContentName()
	if p60 ~= v61 then
		local v_u_62 = "NavigationLoaded"
		local v_u_63 = {
			["toContent"] = p60,
			["fromContent"] = v61
		}
		local v64
		if v_u_8.isUserEnrolled() then
			v64 = v_u_16.TenFoot
		else
			v64 = v_u_16.Classic
		end
		v_u_63.navigationVersion = v64
		local v_u_65 = nil
		local v_u_66 = nil
		local function v67()
			-- upvalues: (ref) v_u_13, (ref) v_u_65, (ref) v_u_66, (ref) v_u_62, (ref) v_u_63, (ref) v_u_12
			if v_u_13:GetPlatform() == Enum.Platform.XBoxOne then
				v_u_65 = "console"
				v_u_66 = "XboxOne"
				v_u_62 = v_u_62 or ""
				v_u_63 = v_u_63 or {}
				v_u_12:SetRBXEventStream(v_u_65, v_u_66, v_u_62, v_u_63)
			end
		end
		local _, _ = pcall(v67)
		if v_u_9() > 1 then
			local v68 = print
			local v69 = "[ANALYTICS] NavigationLoaded ContentName:"
			local v70 = p60
			local v71 = "| PrevContentName:"
			local v72 = "| NavigationVersion:"
			local v73
			if v_u_8.isUserEnrolled() then
				v73 = v_u_16.TenFoot
			else
				v73 = v_u_16.Classic
			end
			v68(v69, v70, v71, v61, v72, v73)
		end
	end
end
function v15.reportNavigationLoaded(p_u_75) -- name: reportNavigationLoaded
	-- upvalues: (copy) v_u_8, (copy) v_u_74
	if v_u_8.isUserEnrolled() then
		v_u_74(p_u_75)
	else
		spawn(function()
			-- upvalues: (ref) v_u_74, (copy) p_u_75
			v_u_74(p_u_75)
		end)
	end
end
function v15.reportBackNavigation(p76) -- name: reportBackNavigation
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_16, (copy) v_u_13, (copy) v_u_12, (copy) v_u_9
	local v77 = v_u_7:getLastContentName()
	local v_u_78 = "NavigationBack"
	local v_u_79 = {
		["fromContent"] = p76,
		["toContent"] = v77
	}
	local v80
	if v_u_8.isUserEnrolled() then
		v80 = v_u_16.TenFoot
	else
		v80 = v_u_16.Classic
	end
	v_u_79.navigationVersion = v80
	local v_u_81 = nil
	local v_u_82 = nil
	local function v83()
		-- upvalues: (ref) v_u_13, (ref) v_u_81, (ref) v_u_82, (ref) v_u_78, (ref) v_u_79, (ref) v_u_12
		if v_u_13:GetPlatform() == Enum.Platform.XBoxOne then
			v_u_81 = "console"
			v_u_82 = "XboxOne"
			v_u_78 = v_u_78 or ""
			v_u_79 = v_u_79 or {}
			v_u_12:SetRBXEventStream(v_u_81, v_u_82, v_u_78, v_u_79)
		end
	end
	local _, _ = pcall(v83)
	if v_u_9() > 1 then
		local v84 = print
		local v85 = "[ANALYTICS] NavigationBack FromContent:"
		local v86 = p76
		local v87 = "| ToContent:"
		local v88 = "| NavigationVersion:"
		local v89
		if v_u_8.isUserEnrolled() then
			v89 = v_u_16.TenFoot
		else
			v89 = v_u_16.Classic
		end
		v84(v85, v86, v87, v77, v88, v89)
	end
end
local v_u_90 = {
	["WidgetId"] = "WidgetName",
	["AppHubId"] = "AppHub",
	["AvatarEditorScreenId"] = "AvatarEditorScreen",
	["AvatarPaneId"] = "AvatarPane",
	["AvatarTileId"] = "AvatarTile",
	["BadgeOverlayId"] = "BadgeOverlay",
	["BaseCarouselScreenId"] = "BaseCarouselScreen",
	["BaseOverlayId"] = "BaseOverlay",
	["BaseTileId"] = "BaseTile",
	["ConfirmPromptId"] = "ConfirmPrompt",
	["DisableCrossplayOverlayId"] = "DisableCrossplayOverlay",
	["EnableCrossplayOverlayId"] = "EnableCrossplayOverlay",
	["EngagementScreenId"] = "EngagementScreen",
	["ErrorOverlayId"] = "ErrorOverlay",
	["GameDetailId"] = "GameDetail",
	["GameGenreScreenId"] = "GameGenreScreen",
	["GamesPaneId"] = "GamesPane",
	["GameSearchScreenId"] = "GameSearchScreen",
	["HomePaneId"] = "HomePane",
	["ImageOverlayId"] = "ImageOverlay",
	["LinkAccountScreenId"] = "LinkAccountScreen",
	["NoActionOverlayId"] = "NoActionOverlay",
	["OutfitTileId"] = "OutfitTile",
	["OverscanScreenId"] = "OverscanScreen",
	["PurchasePackagePromptId"] = "PurchasePackagePrompt",
	["ReportOverlayId"] = "ReportOverlay",
	["RobuxBalanceOverlayId"] = "RobuxBalanceOverlay",
	["SetAccountCredentialsScreenId"] = "SetAccountCredentialsScreen",
	["SettingsScreenId"] = "SettingsScreen",
	["SideBarId"] = "SideBar",
	["SignInScreenId"] = "SignInScreen",
	["SocialPaneId"] = "SocialPane",
	["StorePaneId"] = "StorePane",
	["TabDockId"] = "TabDock",
	["UnlinkAccountOverlayId"] = "UnlinkAccountOverlay",
	["UnlinkAccountScreenId"] = "UnlinkAccountScreen",
	["TwoFactorScreen"] = "TwoFactorScreen",
	["CrossDeviceLoginScreen"] = "CrossDeviceLoginScreen",
	["StoreScreenId"] = "StoreScreen",
	["SearchScreenId"] = "SearchScreen",
	["PartyUiId"] = "PartyUi"
}
local v_u_91 = {
	["HomeId"] = "HomeTab",
	["AvatarId"] = "AvatarTab",
	["DiscoverId"] = "DiscoverTab",
	["FriendsId"] = "FriendsTab",
	["StoreId"] = "StoreTab",
	["SearchId"] = "SearchTab",
	["SettingsId"] = "SettingsTab"
}
function v15.WidgetNames(p92) -- name: WidgetNames
	-- upvalues: (copy) v_u_90
	local v93 = v_u_90
	if v93 then
		v93 = v_u_90[p92]
	end
	return v93 or p92
end
function v15.TabNames(p94) -- name: TabNames
	-- upvalues: (copy) v_u_91
	local v95 = v_u_91
	if v95 then
		v95 = v_u_91[p94]
	end
	return v95 or p94
end
return v15