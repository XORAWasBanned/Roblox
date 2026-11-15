-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.LeaveGameToHome
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = v1:WaitForChild("RobloxGui")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("RbxAnalyticsService")
local v7 = game:GetService("CorePackages")
local v_u_8 = require(v_u_3.Modules.Common.PerfUtils)
local v_u_9 = require(v_u_3.Modules.Settings.Utility)
local v10 = require(v7.Workspace.Packages.LinkingProtocol)
local v_u_11 = v10.Enums.DeepLinkSource
local v_u_12 = v10.LinkingProtocol
local v_u_13 = require(v_u_3.Modules.Settings.Theme)
local v_u_14 = require(v7.Workspace.Packages.AppCommonLib).Create
v_u_3:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v15 = require(v7.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
local v_u_16 = require(v_u_3.Modules.TenFootInterface):IsEnabled()
if v_u_16 then
	v_u_16 = not v15
end
local v_u_17 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_18 = require(v_u_3.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local v_u_19 = settings():GetFFlag("CollectAnalyticsForSystemMenu")
local v_u_20 = require(v7.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local v_u_21
if v_u_19 then
	v_u_21 = require(v_u_3.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
else
	v_u_21 = nil
end
local v_u_22 = require(v7.Workspace.Packages.RobloxTranslator)
local v_u_46 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_3, (copy) v_u_17, (copy) v_u_6, (copy) v_u_18, (copy) v_u_8, (copy) v_u_4, (copy) v_u_19, (ref) v_u_21, (copy) v_u_12, (copy) v_u_11, (copy) v_u_5, (copy) v_u_20, (copy) v_u_22, (copy) v_u_14, (copy) v_u_13, (copy) v_u_16, (copy) v_u_9
	local v_u_23 = require(v_u_3.Modules.Settings.SettingsPageFactory):CreateNewPage()
	v_u_23.playsessionid = ""
	if v_u_17 then
		v_u_23.playsessionid = v_u_6:GetPlaySessionId()
	end
	function v_u_23.LeaveFunc()
		-- upvalues: (ref) v_u_18, (ref) v_u_8, (ref) v_u_4, (ref) v_u_19, (ref) v_u_6, (ref) v_u_21, (copy) v_u_23, (ref) v_u_12, (ref) v_u_11, (ref) v_u_5, (ref) v_u_20
		if v_u_18() then
			v_u_8.leavingGame()
		end
		v_u_4.SelectedCoreObject = nil
		if v_u_19 then
			local v24 = v_u_6
			local v25 = v_u_21.AnalyticsTargetName
			local v26 = v_u_21.AnalyticsInGameMenuName
			local v27 = v_u_21.AnalyticsLeaveGameName
			local v28 = {
				["confirmed"] = v_u_21.AnalyticsConfirmedName
			}
			local v29 = game.GameId
			v28.universeid = tostring(v29)
			v28.source = v_u_21.AnalyticsLeaveToHomeSource
			v28.playsessionid = v_u_23.playsessionid
			v24:SetRBXEventStream(v25, v26, v27, v28)
		end
		if v_u_12.default:isInternalDlicEnabled() then
			local v30 = v_u_12.default:createInternalDlic("roblox://navigation/home", v_u_11.LuaInternal)
			v_u_12.default:detectDeeplinkIntent(v30)
		else
			v_u_12.default:detectURL("roblox://navigation/home")
		end
		v_u_5.RenderStepped:wait()
		v_u_5.RenderStepped:wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = v_u_20()
	end
	function v_u_23.DontLeaveFunc(p31)
		-- upvalues: (copy) v_u_23, (ref) v_u_19, (ref) v_u_6, (ref) v_u_21
		if v_u_23.HubRef then
			v_u_23.HubRef:PopMenu(p31, true)
		end
		if v_u_19 then
			local v32 = v_u_6
			local v33 = v_u_21.AnalyticsTargetName
			local v34 = v_u_21.AnalyticsInGameMenuName
			local v35 = v_u_21.AnalyticsLeaveGameName
			local v36 = {
				["confirmed"] = v_u_21.AnalyticsCancelledName
			}
			local v37 = game.GameId
			v36.universeid = tostring(v37)
			v36.source = v_u_21.AnalyticsLeaveToHomeSource
			v36.playsessionid = v_u_23.playsessionid
			v32:SetRBXEventStream(v33, v34, v35, v36)
		end
	end
	function v_u_23.DontLeaveFromHotkey(_, p38, p39)
		-- upvalues: (copy) v_u_23
		if p38 == Enum.UserInputState.Begin then
			local v40 = (p39.UserInputType == Enum.UserInputType.Gamepad1 or (p39.UserInputType == Enum.UserInputType.Gamepad2 or p39.UserInputType == Enum.UserInputType.Gamepad3)) and true or p39.UserInputType == Enum.UserInputType.Gamepad4
			v_u_23.DontLeaveFunc(v40)
		end
	end
	function v_u_23.DontLeaveFromButton(p41)
		-- upvalues: (copy) v_u_23
		v_u_23.DontLeaveFunc(p41)
	end
	v_u_23.TabHeader = nil
	v_u_23.Page.Name = "LeaveGameToHomePage"
	v_u_23.ShouldShowBottomBar = false
	v_u_23.ShouldShowHubBar = false
	local v42 = v_u_22:FormatByKey(not v_u_19 and "CoreScripts.InGameMenu.Prompt.ConfirmLeaveGame" or v_u_21.ConfirmLeaveGameLocalizedKey)
	local v43 = v_u_14("TextLabel")({
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
		["Text"] = v42,
		["Font"] = v_u_13.font(Enum.Font.SourceSansBold, "Confirmation"),
		["FontSize"] = v_u_13.fontSize(Enum.FontSize.Size36, "Confirmation"),
		["TextColor3"] = Color3.new(1, 1, 1),
		["Size"] = UDim2.new(1, 0, 0, 200),
		["Parent"] = v_u_23.Page,
		["Position"] = v_u_16 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
	})
	local v44 = v_u_14("Frame")({
		["Name"] = "LeaveButtonContainer",
		["Parent"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Parent"] = v43,
		["Size"] = UDim2.new(1, 0, 0, 400),
		["Position"] = UDim2.new(0, 0, 1, 0)
	})
	v_u_14("UIGridLayout")({
		["Name"] = "LeavetButtonsLayout",
		["CellSize"] = nil,
		["CellPadding"] = nil,
		["FillDirection"] = nil,
		["HorizontalAlignment"] = nil,
		["SortOrder"] = nil,
		["VerticalAlignment"] = nil,
		["Parent"] = nil,
		["CellSize"] = v_u_16 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
		["CellPadding"] = UDim2.new(0, 20, 0, 20),
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["Parent"] = v44
	})
	if v_u_9:IsSmallTouchScreen() then
		v43.FontSize = Enum.FontSize.Size24
		v43.Size = UDim2.new(1, 0, 0, 100)
	elseif v_u_16 then
		v43.FontSize = Enum.FontSize.Size48
	end
	v_u_23.LeaveGameButton = v_u_9:MakeStyledButton("LeaveGame", "Leave", nil, v_u_23.LeaveFunc)
	v_u_23.LeaveGameButton.NextSelectionRight = nil
	v_u_23.LeaveGameButton.Parent = v44
	local v45 = v_u_9:MakeStyledButton("DontLeaveGame", v_u_22:FormatByKey("Feature.SettingsHub.Label.DontLeaveButton"), nil, v_u_23.DontLeaveFromButton)
	v45.NextSelectionLeft = nil
	v45.Parent = v44
	v_u_23.Page.Size = UDim2.new(1, 0, 0, v45.AbsolutePosition.Y + v45.AbsoluteSize.Y)
	return v_u_23
end)()
v_u_46.Displayed.Event:connect(function()
	-- upvalues: (copy) v_u_4, (ref) v_u_46, (copy) v_u_2
	v_u_4.SelectedCoreObject = v_u_46.LeaveGameButton
	v_u_2:BindCoreAction("LeaveGameCancelAction", v_u_46.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
end)
v_u_46.Hidden.Event:connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindCoreAction("LeaveGameCancelAction")
end)
return v_u_46