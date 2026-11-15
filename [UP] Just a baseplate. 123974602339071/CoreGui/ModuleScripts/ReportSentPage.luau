-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ReportSentPage
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("Players")
local v3 = game:GetService("RbxAnalyticsService")
local v4 = game:GetService("CorePackages")
local v5 = v1:WaitForChild("RobloxGui"):WaitForChild("Modules")
local v_u_6 = require(v4.Workspace.Packages.BlockingUtility)
local v_u_7 = require(v5.Settings.SettingsPageFactory)
local v_u_8 = require(v4.Workspace.Packages.RobloxTranslator)
local v_u_9 = require(script:FindFirstAncestor("Settings").onBlockButtonActivated)
local v10 = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics)
local v_u_11 = require(v5.Settings.Utility)
local v_u_12 = require(v5.Settings.Theme)
local v_u_13 = require(v4.Workspace.Packages.AppCommonLib).Create
local v14 = v2.LocalPlayer
while not v14 do
	v2.ChildAdded:wait()
	v14 = v2.LocalPlayer
end
local v_u_15 = v10.new(v14.UserId, {
	["EventStream"] = v3
})
local v_u_16 = v_u_12.textSize(36)
local v_u_17 = v_u_12.textSize(24)
local v_u_18 = v_u_12.textSize(16)
local v_u_31 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_7, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_8, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
	local v_u_19 = v_u_7:CreateNewPage()
	v_u_19.TabHeader = nil
	v_u_19.PageListLayout.Parent = nil
	v_u_19.ShouldShowBottomBar = false
	v_u_19.ShouldShowHubBar = false
	v_u_19.IsPageClipped = false
	v_u_19.Page.Name = "ReportSentPage"
	v_u_19.Page.Size = UDim2.fromScale(1, 0)
	v_u_19.Page.AutomaticSize = Enum.AutomaticSize.Y
	v_u_19.Root = v_u_13("Frame")({
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Name"] = "ReportSentContents",
		["Parent"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["Parent"] = v_u_19.Page
	})
	v_u_19.RootLayout = v_u_13("UIListLayout")({
		["Name"] = "RootLayout",
		["FillDirection"] = nil,
		["VerticalAlignment"] = nil,
		["HorizontalAlignment"] = nil,
		["SortOrder"] = nil,
		["Parent"] = nil,
		["FillDirection"] = Enum.FillDirection.Vertical,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Parent"] = v_u_19.Root
	})
	local function v24(p20, p21, p22, p23) -- name: createTextLabel
		-- upvalues: (ref) v_u_13, (ref) v_u_12, (copy) v_u_19
		return v_u_13("TextLabel")({
			["Name"] = nil,
			["LayoutOrder"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["Text"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["TextWrap"] = true,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["Parent"] = nil,
			["Name"] = p20,
			["LayoutOrder"] = p23,
			["Size"] = UDim2.fromScale(1, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Text"] = p21,
			["TextSize"] = p22,
			["Font"] = v_u_12.font(Enum.Font.SourceSansBold, "Bold"),
			["TextColor3"] = Color3.fromRGB(255, 255, 255),
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["Parent"] = v_u_19.Root
		})
	end
	local function v27(p25, p26) -- name: createSpacer
		-- upvalues: (ref) v_u_13, (copy) v_u_19
		return v_u_13("Frame")({
			["LayoutOrder"] = p26,
			["Name"] = "Spacer" .. tostring(p26),
			["Size"] = UDim2.fromOffset(0, p25),
			["Parent"] = v_u_19.Root
		})
	end
	v_u_19.TitleLabel = v24("TitleLabel", v_u_8:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"), v_u_16, 0)
	v_u_19.BodyLabel = v24("BodyLabel", v_u_8:FormatByKey("Feature.SettingsHub.Label.Report.ReceivedReportBody"), v_u_17, 1)
	v_u_19.TopSpacer = v27(10, 2)
	v_u_19.ActionHeader = v24("ActionHeader", v_u_8:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"), v_u_18, 3)
	v_u_19.ActionHeader.TextXAlignment = Enum.TextXAlignment.Left
	local v28, v29 = v_u_11:MakeStyledButton("BlockButton", v_u_8:FormatByKey("Feature.SettingsHub.Action.Block"), UDim2.new(1, 0, 0, 50), function()
		-- upvalues: (copy) v_u_19
		v_u_19:HandleBlock()
	end)
	v28.LayoutOrder = 4
	v28.Parent = v_u_19.Root
	v_u_19.BlockButton = v28
	v_u_19.BlockLabel = v29
	v_u_19.MiddleSpacer = v27(20, 6)
	local v30, _ = v_u_11:MakeStyledButton("DoneButton", v_u_8:FormatByKey("Feature.SettingsHub.Action.Report.Done"), UDim2.new(1, 0, 0, 50), function()
		-- upvalues: (copy) v_u_19
		v_u_19:HandleDone()
	end)
	v30.LayoutOrder = 7
	v30.Parent = v_u_19.Root
	v_u_19.DoneButton = v30
	return v_u_19
end)()
function v_u_31.UpdateActions(p32) -- name: UpdateActions
	-- upvalues: (copy) v_u_6, (copy) v_u_8
	if p32.ReportedPlayer then
		p32.TopSpacer.Visible = true
		p32.ActionHeader.Visible = true
		local v33 = v_u_6:IsPlayerBlockedByUserId(p32.ReportedPlayer.UserId)
		p32.BlockButton.Visible = not v33
		local v34 = v_u_8:FormatByKey("Feature.SettingsHub.Label.Report.BlockDisplayName", {
			["DISPLAY_NAME"] = p32.ReportedPlayer.DisplayName,
			["RBX_NAME"] = p32.ReportedPlayer.Name
		})
		p32.BlockLabel.Text = v34
	else
		p32.TopSpacer.Visible = false
		p32.ActionHeader.Visible = false
		p32.BlockButton.Visible = false
	end
end
function v_u_31.ShowReportedPlayer(p35, p36) -- name: ShowReportedPlayer
	-- upvalues: (copy) v_u_31
	p35.ReportedPlayer = p36
	p35:UpdateActions()
	p35.HubRef:SwitchToPage(v_u_31, true)
end
function v_u_31.HandleBlock(p37) -- name: HandleBlock
	-- upvalues: (copy) v_u_9, (copy) v_u_15
	if p37.ReportedPlayer then
		v_u_9(p37.ReportedPlayer, v_u_15)
	end
	p37:HandleDone()
end
function v_u_31.HandleDone(p38) -- name: HandleDone
	p38.HubRef:SetVisibility(false, true)
end
return v_u_31