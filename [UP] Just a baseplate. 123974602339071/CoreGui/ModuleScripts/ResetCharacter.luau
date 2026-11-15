-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ResetCharacter
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = v2:WaitForChild("RobloxGui")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("RbxAnalyticsService")
local v8 = game:GetService("CorePackages")
local v_u_9 = game:GetService("LocalizationService")
local v_u_10 = require(v_u_4.Modules.Settings.Utility)
local v_u_11 = require(v_u_4.Modules.Settings.Theme)
local v_u_12 = require(v8.Workspace.Packages.AppCommonLib).Create
local v_u_13 = require(v8.Packages.Cryo)
local v_u_14 = require(v8.Packages.React)
local v_u_15 = require(v8.Packages.ReactRoblox)
local v_u_16 = require(v8.Packages.ReactFocusNavigation)
local v_u_17 = v_u_16.useFocusGuiObject
local v18 = require(v8.Workspace.Packages.Responsive)
local v_u_19 = v18.Input
local v_u_20 = v18.useLastInput
local v_u_21 = require(v8.Workspace.Packages.InExperienceLocales).Localization
local v_u_22 = require(v8.Workspace.Packages.Localization).LocalizationProvider
local v_u_23 = require(v8.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_24 = require(v8.Packages.Foundation)
local v_u_25 = require(v8.Workspace.Packages.Chrome).Enabled()
local v_u_26
if v_u_25 then
	v_u_26 = require(v_u_4.Modules.Chrome.Service)
else
	v_u_26 = nil
end
local v_u_27
if v_u_25 then
	v_u_27 = require(v_u_4.Modules.Chrome.ChromeShared.Unibar.Constants)
else
	v_u_27 = nil
end
local v28 = require(v8.Workspace.Packages.SharedFlags)
v_u_4:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v29 = v28.FFlagResponsiveUnitsDeprecateTenFoot
local v_u_30 = require(v_u_4.Modules.TenFootInterface):IsEnabled()
if v_u_30 then
	v_u_30 = not v29
end
local v_u_31 = v28.FFlagEnableConsoleExpControls
local v_u_32 = v28.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local v_u_33 = require(v_u_4.Modules.Chrome.Flags.FFlagRespawnActionChromeShortcutTelemetry)
local v_u_34 = require(v_u_4.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local v_u_35 = require(v_u_4.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons)
local v_u_36 = v28.FFlagRenameRespawnConfirmationPage
local v_u_37 = require(v_u_4.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v_u_38 = v_u_16.FocusNavigationService.new(v_u_16.EngineInterface.CoreGui)
local v_u_39 = v_u_24.FoundationProvider
local v_u_40 = v_u_24.Button
local v_u_41 = v_u_24.Enums.ButtonVariant
local v_u_42 = v_u_24.Enums.InputSize
local v_u_43 = v_u_24.Text
local v_u_44 = v_u_24.View
local function v_u_71(p_u_45) -- name: ResetCharacterButtonsContainer
	-- upvalues: (copy) v_u_14, (copy) v_u_20, (copy) v_u_17, (copy) v_u_23, (copy) v_u_37, (copy) v_u_36, (copy) v_u_19, (copy) v_u_10, (copy) v_u_44, (copy) v_u_30, (copy) v_u_43, (copy) v_u_40, (copy) v_u_42, (copy) v_u_35, (copy) v_u_41
	local v_u_46 = v_u_14.useRef(nil)
	local v_u_47 = v_u_20()
	local v_u_48 = v_u_17()
	local v49 = v_u_23
	local v50 = {
		["ConfirmResetCharacter"] = v_u_37.ConfirmResetCharacterLocalizedKey
	}
	local v51
	if v_u_36 then
		v51 = v_u_37.RespawnLocalizedKey
	else
		v51 = v_u_37.ResetCharacterLocalizedKey
	end
	v50.ResetCharacter = v51
	v50.DontResetCharacter = v_u_37.DontResetCharacterLocalizedKey
	local v52 = v49(v50)
	v_u_14.useEffect(function()
		-- upvalues: (copy) v_u_47, (ref) v_u_19, (copy) v_u_48, (copy) v_u_46
		if v_u_47 == v_u_19.Touch then
			v_u_48(nil)
		else
			v_u_48(v_u_46.current)
		end
	end, { v_u_47, v_u_48 })
	local v53 = v_u_14.useCallback(function()
		-- upvalues: (copy) p_u_45, (ref) v_u_10
		p_u_45.dontResetCharFromButton(v_u_10:IsUsingGamepad())
	end, { v_u_10, p_u_45.dontResetCharFromButton })
	local v54 = v_u_14.createElement
	local v55 = v_u_44
	local v56 = {
		["Position"] = nil,
		["tag"] = "size-full-0 auto-y col",
		["Position"] = UDim2.new(0, 0, 0, v_u_30 and 100 or 0)
	}
	local v57 = {}
	local v58 = v_u_14.createElement
	local v59 = v_u_43
	local v60 = {
		["Text"] = nil,
		["Size"] = nil,
		["LayoutOrder"] = 1,
		["tag"] = nil,
		["Text"] = v52.ConfirmResetCharacter,
		["Size"] = UDim2.new(1, 0, 0, v_u_10:IsSmallTouchScreen() and 100 or 200)
	}
	local v61 = {
		["text-wrap"] = true
	}
	local v62 = not v_u_10:IsSmallTouchScreen()
	if v62 then
		v62 = not v_u_30
	end
	v61["text-heading-medium"] = v62
	v61["text-heading-small"] = v_u_10:IsSmallTouchScreen()
	v61["text-heading-large"] = v_u_30
	v60.tag = v61
	v57.ResetCharacterText = v58(v59, v60)
	local v63 = v_u_14.createElement
	local v64 = v_u_44
	local v65 = {
		["LayoutOrder"] = 2,
		["tag"] = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
	}
	local v66 = {}
	local v67 = v_u_14.createElement
	local v68 = v_u_40
	local v69 = {
		["text"] = nil,
		["size"] = nil,
		["variant"] = nil,
		["width"] = nil,
		["LayoutOrder"] = 1,
		["ref"] = nil,
		["onActivated"] = nil,
		["text"] = v52.ResetCharacter,
		["size"] = v_u_42.Large
	}
	local v70
	if v_u_35 then
		v70 = v_u_41.Standard
	else
		v70 = v_u_41.SoftEmphasis
	end
	v69.variant = v70
	v69.width = UDim.new(0, v_u_30 and 300 or 200)
	v69.ref = v_u_46
	v69.onActivated = p_u_45.onResetFunction
	v66.ResetCharacterButton = v67(v68, v69)
	v66.DontResetCharacterButton = v_u_14.createElement(v_u_40, {
		["text"] = nil,
		["size"] = nil,
		["variant"] = nil,
		["width"] = nil,
		["LayoutOrder"] = 2,
		["onActivated"] = nil,
		["text"] = v52.DontResetCharacter,
		["size"] = v_u_42.Large,
		["variant"] = v_u_41.Subtle,
		["width"] = UDim.new(0, v_u_30 and 300 or 200),
		["onActivated"] = v53
	})
	v57.ButtonsContainer = v63(v64, v65, v66)
	return v54(v55, v56, v57)
end
local function v_u_81(p72) -- name: ResetCharacterContainer
	-- upvalues: (copy) v_u_21, (copy) v_u_9, (copy) v_u_14, (copy) v_u_22, (copy) v_u_39, (copy) v_u_24, (copy) v_u_16, (copy) v_u_38, (copy) v_u_71
	local v73 = v_u_21.new(v_u_9.RobloxLocaleId)
	local v74 = v_u_14.createElement
	local v75 = v_u_22
	local v76 = {}
	local v77 = v_u_14.createElement
	local v78 = v_u_39
	local v79 = {
		["colorMode"] = v_u_24.Enums.ColorMode.Dark
	}
	local v80 = {
		["FocusNavigationProvider"] = v_u_14.createElement(v_u_16.FocusNavigationContext.Provider, {
			["value"] = v_u_38
		}, {
			["ResetCharacterButtonsContainer"] = v_u_14.createElement(v_u_71, p72)
		})
	}
	v76.FoundationProvider = v77(v78, v79, v80)
	return v74(v75, {
		["localization"] = v73
	}, v76)
end
local v_u_106 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_37, (copy) v_u_34, (copy) v_u_12, (copy) v_u_36, (copy) v_u_11, (copy) v_u_30, (copy) v_u_10, (copy) v_u_6, (copy) v_u_33, (copy) v_u_13, (copy) v_u_1, (copy) v_u_31, (copy) v_u_15, (copy) v_u_14, (copy) v_u_81
	local v_u_82 = require(v_u_4.Modules.Settings.SettingsPageFactory):CreateNewPage()
	function v_u_82.DontResetCharFunc(p83)
		-- upvalues: (ref) v_u_7, (ref) v_u_37, (copy) v_u_82
		local v84 = v_u_7
		local v85 = v_u_37.AnalyticsTargetName
		local v86 = v_u_37.AnalyticsInGameMenuName
		local v87 = v_u_37.AnalyticsRespawnCharacterName
		local v88 = {
			["confirmed"] = v_u_37.AnalyticsCancelledName
		}
		local v89 = game.GameId
		v88.universeid = tostring(v89)
		v84:SetRBXEventStream(v85, v86, v87, v88)
		if v_u_82.HubRef then
			v_u_82.HubRef:PopMenu(p83, true)
		end
	end
	function v_u_82.DontResetCharFromHotkey(_, p90, p91)
		-- upvalues: (copy) v_u_82
		if p90 == Enum.UserInputState.Begin then
			local v92 = (p91.UserInputType == Enum.UserInputType.Gamepad1 or (p91.UserInputType == Enum.UserInputType.Gamepad2 or p91.UserInputType == Enum.UserInputType.Gamepad3)) and true or p91.UserInputType == Enum.UserInputType.Gamepad4
			v_u_82.DontResetCharFunc(v92)
		end
	end
	function v_u_82.DontResetCharFromButton(p93)
		-- upvalues: (copy) v_u_82
		v_u_82.DontResetCharFunc(p93)
	end
	v_u_82.TabHeader = nil
	v_u_82.Page.Name = "ResetCharacter"
	v_u_82.ShouldShowBottomBar = false
	v_u_82.ShouldShowHubBar = false
	local v94
	if v_u_34 then
		v94 = nil
	else
		local v95 = v_u_12("TextLabel")({
			["Name"] = "ResetCharacterText",
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
			["Text"] = v_u_36 and "Are you sure you want to respawn your character?" or "Are you sure you want to reset your character?",
			["Font"] = v_u_11.font(Enum.Font.SourceSansBold, "Confirmation"),
			["FontSize"] = v_u_11.fontSize(Enum.FontSize.Size36, "Confirmation"),
			["TextColor3"] = Color3.new(1, 1, 1),
			["Size"] = UDim2.new(1, 0, 0, 200),
			["Parent"] = v_u_82.Page,
			["Position"] = v_u_30 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
		})
		v94 = v_u_12("Frame")({
			["Name"] = "ResetButtonContainer",
			["Parent"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Parent"] = v95,
			["Size"] = UDim2.new(1, 0, 0, 400),
			["Position"] = UDim2.new(0, 0, 1, 0)
		})
		v_u_12("UIGridLayout")({
			["Name"] = "ResetButtonsLayout",
			["CellSize"] = nil,
			["CellPadding"] = nil,
			["FillDirection"] = nil,
			["HorizontalAlignment"] = nil,
			["SortOrder"] = nil,
			["VerticalAlignment"] = nil,
			["Parent"] = nil,
			["CellSize"] = v_u_30 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
			["CellPadding"] = UDim2.new(0, 20, 0, 20),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["Parent"] = v94
		})
		if v_u_10:IsSmallTouchScreen() then
			v95.FontSize = Enum.FontSize.Size24
			v95.Size = UDim2.new(1, 0, 0, 100)
		elseif v_u_30 then
			v95.FontSize = Enum.FontSize.Size48
		end
	end
	local function v_u_102(p96)
		-- upvalues: (ref) v_u_6, (ref) v_u_37, (ref) v_u_33, (ref) v_u_13, (ref) v_u_7
		local v97 = v_u_6.LocalPlayer
		if v97 then
			local v98 = v97.Character
			local v99 = v98 and v98:FindFirstChild("Humanoid")
			if v99 then
				v99.Health = 0
			end
		end
		local v100 = {
			["confirmed"] = v_u_37.AnalyticsConfirmedName
		}
		local v101 = game.GameId
		v100.universeid = tostring(v101)
		if v_u_33 and (p96 and (type(p96) == "table" and p96.resetTelemetryFields)) then
			v100 = v_u_13.Dictionary.join(v100, p96.resetTelemetryFields)
		end
		v_u_7:SetRBXEventStream(v_u_37.AnalyticsTargetName, v_u_37.AnalyticsInGameMenuName, v_u_37.AnalyticsRespawnCharacterName, v100)
		v_u_7:ReportCounter("InGameMenu-ResetCharacter")
	end
	v_u_82.ResetBindable = true
	local function v_u_104(p103)
		-- upvalues: (ref) v_u_1, (copy) v_u_82, (copy) v_u_102
		v_u_1:BustAvatarFetchCache()
		if v_u_82.ResetBindable == true then
			v_u_102(p103)
		elseif v_u_82.ResetBindable then
			v_u_82.ResetBindable:Fire()
		end
		if v_u_82.HubRef then
			v_u_82.HubRef:SetVisibility(false, true)
		end
	end
	if v_u_31 then
		v_u_82.ResetFunction = v_u_104
	end
	if not v_u_34 then
		v_u_82.ResetCharacterButton = v_u_10:MakeStyledButton("ResetCharacter", v_u_36 and "Respawn" or "Reset", nil, v_u_104)
		v_u_82.ResetCharacterButton.NextSelectionRight = nil
		v_u_82.ResetCharacterButton.Parent = v94
		local v105 = v_u_10:MakeStyledButton("DontResetCharacter", v_u_36 and "Don\'t Respawn" or "Don\'t Reset", nil, v_u_82.DontResetCharFromButton)
		v105.NextSelectionLeft = nil
		v105.Parent = v94
		v_u_82.Page.Size = UDim2.new(1, 0, 0, v105.AbsolutePosition.Y + v105.AbsoluteSize.Y)
	end
	if v_u_34 then
		function v_u_82.RenderPage()
			-- upvalues: (copy) v_u_82, (ref) v_u_15, (ref) v_u_14, (ref) v_u_81, (copy) v_u_104
			v_u_82.PageRoot = v_u_15.createRoot(v_u_82.Page)
			v_u_82.PageRoot:render(v_u_14.createElement(v_u_81, {
				["onResetFunction"] = v_u_104,
				["dontResetCharFromButton"] = v_u_82.DontResetCharFromButton
			}))
		end
		function v_u_82.UnmountPage()
			-- upvalues: (copy) v_u_82
			if v_u_82.PageRoot then
				v_u_82.PageRoot:unmount()
			end
		end
		v_u_82.Page.Size = UDim2.new(1, 0, 0, 0)
	end
	return v_u_82
end)()
local v_u_107 = false
v_u_106.Displayed.Event:connect(function()
	-- upvalues: (ref) v_u_107, (copy) v_u_34, (ref) v_u_106, (copy) v_u_5, (copy) v_u_31, (copy) v_u_25, (copy) v_u_32, (copy) v_u_26, (copy) v_u_27, (copy) v_u_3
	v_u_107 = true
	if v_u_34 then
		v_u_106.RenderPage()
	end
	if not v_u_34 then
		v_u_5.SelectedCoreObject = v_u_106.ResetCharacterButton
	end
	if v_u_31 then
		if v_u_25 then
			if v_u_32 then
				v_u_26:setShortcutBar(v_u_27.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID)
			else
				v_u_26:setShortcutBar(v_u_27.TILTMENU_DIALOG_SHORTCUTBAR_ID)
			end
		end
	else
		v_u_3:BindCoreAction("ResetCharacterAction", v_u_106.DontResetCharFromHotkey, false, Enum.KeyCode.ButtonB)
	end
end)
v_u_106.Hidden.Event:connect(function()
	-- upvalues: (ref) v_u_107, (copy) v_u_34, (ref) v_u_106, (copy) v_u_3
	v_u_107 = false
	if v_u_34 then
		v_u_106.UnmountPage()
	end
	v_u_3:UnbindCoreAction("ResetCharacterAction")
end)
function v_u_106.SetResetCallback(_, p108) -- name: SetResetCallback
	-- upvalues: (ref) v_u_107, (ref) v_u_106
	if p108 == false and v_u_107 then
		v_u_106.HubRef:PopMenu(nil, true)
	end
	v_u_106.ResetBindable = p108
end
return v_u_106