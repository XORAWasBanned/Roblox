-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.TraversalHistoryWrapper
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("LocalizationService")
local v3 = script:FindFirstAncestor("Settings")
local v_u_4 = require(v1.Packages.React)
local v_u_5 = require(v1.Packages.ReactRoblox)
local v_u_6 = require(v1.Packages.Foundation)
local v_u_7 = v_u_6.FoundationProvider
local v_u_8 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_9 = require(v1.Workspace.Packages.Localization).LocalizationProvider
local v_u_10 = require(v3.Integrations.Constants)
local v_u_11 = require(v3.Components.Traversal.TraversalHistoryPage)
local v_u_12 = require(v3.SettingsPageFactory)
local v_u_13 = require(v3.Integrations.Utils)
local v_u_14 = require(v1.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
return function() -- name: createTraversalHistoryWrapper
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_12, (copy) v_u_10, (copy) v_u_14, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_13, (copy) v_u_9, (copy) v_u_11
	local v15 = v_u_8.new(v_u_2.RobloxLocaleId)
	local v16 = v_u_12:CreateNewPage()
	v16.Page:ClearAllChildren()
	v16.Page.Name = "TraversalHistoryPage"
	v16.TabHeader.Name = v_u_10.TRAVERSAL_HISTORY.TAB_HEADER.NAME
	v16.TabHeader.TabLabel.Title.AutoLocalize = false
	v16.TabHeader.TabLabel.Title.Text = v15:Format(v_u_10.TRAVERSAL_HISTORY.TAB_HEADER.TEXT_KEY)
	v16.PageListLayout.Parent = nil
	v16.ShouldShowBottomBar = not v_u_14
	v16.ShouldShowHubBar = true
	v16.Page.Size = UDim2.fromScale(1, 0)
	local v17 = v_u_5.createRoot(v16.Page)
	local v18 = v_u_4.createElement
	local v19 = v_u_7
	local v20 = {
		["colorMode"] = v_u_6.Enums.ColorMode.Dark,
		["device"] = v_u_13.getDeviceType()
	}
	local v21 = {
		["Localization"] = v_u_4.createElement(v_u_9, {
			["localization"] = v15
		}, {
			["Page"] = v_u_4.createElement(v_u_11)
		})
	}
	v17:render(v18(v19, v20, v21))
	return v16
end