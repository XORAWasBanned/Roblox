-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.LeaveGame
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = v1:WaitForChild("RobloxGui")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = game:GetService("RbxAnalyticsService")
local v_u_7 = game:GetService("LocalizationService")
local v_u_8 = require(v_u_4.Modules.Settings.Utility)
local v_u_9 = require(v_u_4.Modules.Settings.leaveGame)
local v_u_10 = require(v2.Workspace.Packages.AppCommonLib).Create
local v_u_11 = require(v2.Packages.React)
local v_u_12 = require(v2.Packages.ReactRoblox)
local v_u_13 = require(v2.Packages.ReactFocusNavigation)
local v_u_14 = v_u_13.useFocusGuiObject
local v15 = require(v2.Workspace.Packages.Responsive)
local v_u_16 = v15.Input
local v_u_17 = v15.useLastInput
local v_u_18 = require(v2.Workspace.Packages.InExperienceLocales).Localization
local v_u_19 = require(v2.Workspace.Packages.Localization).LocalizationProvider
local v_u_20 = require(v2.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_21 = require(v2.Packages.Foundation)
local v_u_22 = require(v2.Workspace.Packages.Chrome).Enabled()
local v_u_23
if v_u_22 then
	v_u_23 = require(v_u_4.Modules.Chrome.Service)
else
	v_u_23 = nil
end
local v_u_24
if v_u_22 then
	v_u_24 = require(v_u_4.Modules.Chrome.ChromeShared.Unibar.Constants)
else
	v_u_24 = nil
end
local v25 = require(v2.Workspace.Packages.SharedFlags)
v_u_4:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v26 = v25.FFlagResponsiveUnitsDeprecateTenFoot
local v_u_27 = require(v_u_4.Modules.TenFootInterface):IsEnabled()
if v_u_27 then
	v_u_27 = not v26
end
local v_u_28 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_29 = v25.FFlagEnableConsoleExpControls
local v_u_30 = v25.FFlagChromeShortcutRemoveRespawnOnLeavePage
local v_u_31 = require(v2.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_32 = require(v_u_4.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local v_u_33 = require(v_u_4.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons)
local v_u_34 = require(v_u_4.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v_u_35 = require(v2.Workspace.Packages.InExperienceSideSheet).Constants.LocalizationKeys
local v_u_36 = v_u_13.FocusNavigationService.new(v_u_13.EngineInterface.CoreGui)
local v_u_37 = require(v_u_4.Modules.Settings.Theme)
local v_u_38 = v_u_21.FoundationProvider
local v_u_39 = v_u_21.Button
local v_u_40 = v_u_21.Enums.ButtonVariant
local v_u_41 = v_u_21.Enums.InputSize
local v_u_42 = v_u_21.Text
local v_u_43 = v_u_21.View
local v_u_44 = require(v2.Workspace.Packages.RobloxTranslator)
local function v_u_75(p_u_45) -- name: LeaveButtonsContainer
	-- upvalues: (copy) v_u_11, (copy) v_u_17, (copy) v_u_14, (copy) v_u_20, (copy) v_u_31, (copy) v_u_35, (copy) v_u_34, (copy) v_u_16, (copy) v_u_9, (copy) v_u_8, (copy) v_u_43, (copy) v_u_27, (copy) v_u_42, (copy) v_u_39, (copy) v_u_41, (copy) v_u_33, (copy) v_u_40
	local v_u_46 = v_u_11.useRef(nil)
	local v_u_47 = v_u_17()
	local v_u_48 = v_u_14()
	local v49 = v_u_20
	local v50 = {}
	local v51
	if v_u_31() then
		v51 = v_u_35.QuitConfirmation
	else
		v51 = v_u_34.ConfirmLeaveGameLocalizedKey
	end
	v50.ConfirmLeaveGame = v51
	local v52
	if v_u_31() then
		v52 = v_u_35.QuitButton
	else
		v52 = v_u_34.LeaveGameLocalizedKey
	end
	v50.LeaveGame = v52
	local v53
	if v_u_31() then
		v53 = v_u_35.Resume
	else
		v53 = v_u_34.DontLeaveGameLocalizedKey
	end
	v50.DontLeaveGame = v53
	local v54 = v49(v50)
	v_u_11.useEffect(function()
		-- upvalues: (copy) v_u_47, (ref) v_u_16, (copy) v_u_48, (copy) v_u_46
		if v_u_47 == v_u_16.Touch then
			v_u_48(nil)
		else
			v_u_48(v_u_46.current)
		end
	end, { v_u_47, v_u_48 })
	local v55 = { v_u_9 }
	local v56 = v_u_11.useCallback(function()
		-- upvalues: (ref) v_u_31, (ref) v_u_9
		if v_u_31() then
			v_u_9(false, {
				["shouldNativeExit"] = true
			})
		else
			v_u_9(true)
		end
	end, v55)
	local v57 = v_u_11.useCallback(function()
		-- upvalues: (copy) p_u_45, (ref) v_u_8
		p_u_45.dontLeaveFromButton(v_u_8:IsUsingGamepad())
	end, { v_u_8, p_u_45.dontLeaveFromButton })
	local v58 = v_u_11.createElement
	local v59 = v_u_43
	local v60 = {
		["Position"] = nil,
		["tag"] = "size-full-0 auto-y col",
		["Position"] = UDim2.new(0, 0, 0, v_u_27 and 100 or 0)
	}
	local v61 = {}
	local v62 = v_u_11.createElement
	local v63 = v_u_42
	local v64 = {
		["Text"] = nil,
		["Size"] = nil,
		["LayoutOrder"] = 1,
		["tag"] = nil,
		["Text"] = v54.ConfirmLeaveGame,
		["Size"] = UDim2.new(1, 0, 0, v_u_8:IsSmallTouchScreen() and 100 or 200)
	}
	local v65 = {
		["text-wrap"] = true
	}
	local v66 = not v_u_8:IsSmallTouchScreen()
	if v66 then
		v66 = not v_u_27
	end
	v65["text-heading-medium"] = v66
	v65["text-heading-small"] = v_u_8:IsSmallTouchScreen()
	v65["text-heading-large"] = v_u_27
	v64.tag = v65
	v61.LeaveGameText = v62(v63, v64)
	local v67 = v_u_11.createElement
	local v68 = v_u_43
	local v69 = {
		["LayoutOrder"] = 2,
		["tag"] = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
	}
	local v70 = {}
	local v71 = v_u_11.createElement
	local v72 = v_u_39
	local v73 = {
		["text"] = nil,
		["size"] = nil,
		["variant"] = nil,
		["width"] = nil,
		["LayoutOrder"] = 1,
		["ref"] = nil,
		["onActivated"] = nil,
		["text"] = v54.LeaveGame,
		["size"] = v_u_41.Large
	}
	local v74
	if v_u_33 then
		v74 = v_u_40.Standard
	else
		v74 = v_u_40.SoftEmphasis
	end
	v73.variant = v74
	v73.width = UDim.new(0, v_u_27 and 300 or 200)
	v73.ref = v_u_46
	v73.onActivated = v56
	v70.LeaveGameButton = v71(v72, v73)
	v70.DontLeaveGameButton = v_u_11.createElement(v_u_39, {
		["text"] = nil,
		["size"] = nil,
		["variant"] = nil,
		["width"] = nil,
		["LayoutOrder"] = 2,
		["onActivated"] = nil,
		["text"] = v54.DontLeaveGame,
		["size"] = v_u_41.Large,
		["variant"] = v_u_40.Subtle,
		["width"] = UDim.new(0, v_u_27 and 300 or 200),
		["onActivated"] = v57
	})
	v61.LeaveButtonsContainer = v67(v68, v69, v70)
	return v58(v59, v60, v61)
end
local function v_u_85(p76) -- name: LeaveGameContainer
	-- upvalues: (copy) v_u_18, (copy) v_u_7, (copy) v_u_11, (copy) v_u_19, (copy) v_u_38, (copy) v_u_21, (copy) v_u_13, (copy) v_u_36, (copy) v_u_75
	local v77 = v_u_18.new(v_u_7.RobloxLocaleId)
	local v78 = v_u_11.createElement
	local v79 = v_u_19
	local v80 = {}
	local v81 = v_u_11.createElement
	local v82 = v_u_38
	local v83 = {
		["colorMode"] = v_u_21.Enums.ColorMode.Dark
	}
	local v84 = {
		["FocusNavigationProvider"] = v_u_11.createElement(v_u_13.FocusNavigationContext.Provider, {
			["value"] = v_u_36
		}, {
			["LeaveButtonsContainer"] = v_u_11.createElement(v_u_75, p76)
		})
	}
	v80.FoundationProvider = v81(v82, v83, v84)
	return v78(v79, {
		["localization"] = v77
	}, v80)
end
local v_u_102 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_4, (copy) v_u_28, (copy) v_u_6, (copy) v_u_34, (copy) v_u_32, (copy) v_u_12, (copy) v_u_11, (copy) v_u_85, (copy) v_u_31, (copy) v_u_44, (copy) v_u_35, (copy) v_u_10, (copy) v_u_37, (copy) v_u_27, (copy) v_u_8, (copy) v_u_9
	local v_u_86 = require(v_u_4.Modules.Settings.SettingsPageFactory):CreateNewPage()
	v_u_86.playsessionid = ""
	if v_u_28 then
		v_u_86.playsessionid = v_u_6:GetPlaySessionId()
	end
	function v_u_86.DontLeaveFunc(p87)
		-- upvalues: (copy) v_u_86, (ref) v_u_6, (ref) v_u_34
		if v_u_86.HubRef then
			v_u_86.HubRef:PopMenu(p87, true)
		end
		local v88 = v_u_6
		local v89 = v_u_34.AnalyticsTargetName
		local v90 = v_u_34.AnalyticsInGameMenuName
		local v91 = v_u_34.AnalyticsLeaveGameName
		local v92 = {
			["confirmed"] = v_u_34.AnalyticsCancelledName
		}
		local v93 = game.GameId
		v92.universeid = tostring(v93)
		v92.source = v_u_34.AnalyticsLeaveGameSource
		v92.playsessionid = v_u_86.playsessionid
		v88:SetRBXEventStream(v89, v90, v91, v92)
	end
	function v_u_86.DontLeaveFromHotkey(_, p94, p95)
		-- upvalues: (copy) v_u_86
		if p94 == Enum.UserInputState.Begin then
			local v96 = (p95.UserInputType == Enum.UserInputType.Gamepad1 or (p95.UserInputType == Enum.UserInputType.Gamepad2 or p95.UserInputType == Enum.UserInputType.Gamepad3)) and true or p95.UserInputType == Enum.UserInputType.Gamepad4
			v_u_86.DontLeaveFunc(v96)
		end
	end
	function v_u_86.DontLeaveFromButton(p97)
		-- upvalues: (copy) v_u_86
		v_u_86.DontLeaveFunc(p97)
	end
	v_u_86.TabHeader = nil
	v_u_86.Page.Name = "LeaveGamePage"
	v_u_86.ShouldShowBottomBar = false
	v_u_86.ShouldShowHubBar = false
	if v_u_32 then
		function v_u_86.RenderPage()
			-- upvalues: (copy) v_u_86, (ref) v_u_12, (ref) v_u_11, (ref) v_u_85
			v_u_86.PageRoot = v_u_12.createRoot(v_u_86.Page)
			v_u_86.PageRoot:render(v_u_11.createElement(v_u_85, {
				["dontLeaveFromButton"] = v_u_86.DontLeaveFromButton
			}))
		end
		function v_u_86.UnmountPage()
			-- upvalues: (copy) v_u_86
			if v_u_86.PageRoot then
				v_u_86.PageRoot:unmount()
			end
		end
		v_u_86.Page.Size = UDim2.new(1, 0, 0, 0)
		return v_u_86
	end
	local v98
	if v_u_31() then
		v98 = v_u_44:FormatByKey(v_u_35.QuitConfirmation)
	else
		v98 = v_u_44:FormatByKey(v_u_34.ConfirmLeaveGameLocalizedKey)
	end
	local v99 = v_u_10("TextLabel")({
		["Name"] = "LeaveGameText",
		["Text"] = nil,
		["Font"] = nil,
		["FontSize"] = nil,
		["TextColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["TextWrapped"] = true,
		["ZIndex"] = 2,
		["Parent"] = nil,
		["Position"] = nil,
		["Text"] = v98,
		["Font"] = v_u_37.font(Enum.Font.SourceSansBold, "Confirmation"),
		["FontSize"] = v_u_37.fontSize(Enum.FontSize.Size36, "Confirmation"),
		["TextColor3"] = Color3.new(1, 1, 1),
		["Size"] = UDim2.new(1, 0, 0, 200),
		["Parent"] = v_u_86.Page,
		["Position"] = v_u_27 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
	})
	local v100 = v_u_10("Frame")({
		["Name"] = "LeaveButtonContainer",
		["Parent"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Parent"] = v99,
		["Size"] = UDim2.new(1, 0, 0, 400),
		["Position"] = UDim2.new(0, 0, 1, 0)
	})
	v_u_10("UIGridLayout")({
		["Name"] = "LeavetButtonsLayout",
		["CellSize"] = nil,
		["CellPadding"] = nil,
		["FillDirection"] = nil,
		["HorizontalAlignment"] = nil,
		["SortOrder"] = nil,
		["VerticalAlignment"] = nil,
		["Parent"] = nil,
		["CellSize"] = v_u_27 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
		["CellPadding"] = UDim2.new(0, 20, 0, 20),
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["Parent"] = v100
	})
	if v_u_8:IsSmallTouchScreen() then
		v99.FontSize = Enum.FontSize.Size24
		v99.Size = UDim2.new(1, 0, 0, 100)
	elseif v_u_27 then
		v99.FontSize = Enum.FontSize.Size48
	end
	v_u_86.LeaveGameButton = v_u_8:MakeStyledButton("LeaveGame", not v_u_31() and "Leave" or v_u_44:FormatByKey(v_u_35.QuitButton), nil, function()
		-- upvalues: (ref) v_u_31, (ref) v_u_9
		if v_u_31() then
			v_u_9(false, {
				["shouldNativeExit"] = true
			})
		else
			v_u_9(true)
		end
	end)
	v_u_86.LeaveGameButton.NextSelectionRight = nil
	v_u_86.LeaveGameButton.Parent = v100
	local v101 = v_u_8:MakeStyledButton("DontLeaveGame", v_u_44:FormatByKey("Feature.SettingsHub.Label.DontLeaveButton"), nil, v_u_86.DontLeaveFromButton)
	v101.NextSelectionLeft = nil
	v101.Parent = v100
	v_u_86.Page.Size = UDim2.new(1, 0, 0, v101.AbsolutePosition.Y + v101.AbsoluteSize.Y)
	return v_u_86
end)()
v_u_102.Displayed.Event:connect(function()
	-- upvalues: (copy) v_u_32, (ref) v_u_102, (copy) v_u_5, (copy) v_u_29, (copy) v_u_22, (copy) v_u_30, (copy) v_u_23, (copy) v_u_24, (copy) v_u_3
	if v_u_32 then
		v_u_102.RenderPage()
	end
	if not v_u_32 then
		v_u_5.SelectedCoreObject = v_u_102.LeaveGameButton
	end
	if v_u_29 then
		if v_u_22 then
			if v_u_30 then
				v_u_23:setShortcutBar(v_u_24.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID)
			else
				v_u_23:setShortcutBar(v_u_24.TILTMENU_DIALOG_SHORTCUTBAR_ID)
			end
		end
	else
		v_u_3:BindCoreAction("LeaveGameCancelAction", v_u_102.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
	end
end)
v_u_102.Hidden.Event:connect(function()
	-- upvalues: (copy) v_u_32, (ref) v_u_102, (copy) v_u_3
	if v_u_32 then
		v_u_102.UnmountPage()
	end
	v_u_3:UnbindCoreAction("LeaveGameCancelAction")
end)
return v_u_102