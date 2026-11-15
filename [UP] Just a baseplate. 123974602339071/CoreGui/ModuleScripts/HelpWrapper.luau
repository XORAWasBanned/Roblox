-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.HelpWrapper
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1:WaitForChild("RobloxGui")
local v4 = game:GetService("LocalizationService")
local v5 = v3.Modules
local v6 = require(v2.Workspace.Packages.HelpPage)
local v_u_7 = v6.HelpReactView
local v_u_8 = require(v5.Settings.SettingsPageFactory)
local v_u_9 = require(v2.Workspace.Packages.InExperienceLocales).Localization.new(v4.RobloxLocaleId)
local v_u_10 = require(v2.Workspace.Packages.Localization).LocalizationProvider
local v_u_11 = require(v2.Packages.React)
local v_u_12 = require(v2.Packages.ReactRoblox)
local v_u_13 = require(v2.Packages.Foundation)
local v_u_14 = v_u_13.FoundationProvider
local v_u_15 = v_u_13.Enums.IconName
local v_u_16 = v_u_13.Enums.IconVariant
local v_u_17 = require(v2.Packages.BuilderIcons)
local v_u_18 = v_u_17.Migration.uiblox
local v19 = require(v2.Packages.Signals)
local v_u_20 = require(v2.Packages.SignalsReact)
local v21 = v6.Flags.FFlagRefactorHelpPage
local v_u_22 = require(v2.Workspace.Packages.SharedFlags).FFlagRenameHelpToControls
local v_u_23, v_u_24
if v21 then
	v_u_23 = require(v5.Settings.Integrations).Utils
	v_u_24 = v6.Constants
else
	v_u_24 = nil
	v_u_23 = nil
end
local v_u_25 = nil
local v_u_26, v_u_27 = v19.createSignal(false)
local function v_u_32()
	-- upvalues: (copy) v_u_20, (copy) v_u_26, (copy) v_u_11, (copy) v_u_14, (copy) v_u_13, (ref) v_u_23, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7
	if not v_u_20.useSignalState(v_u_26) then
		return nil
	end
	local v28 = v_u_11.createElement
	local v29 = v_u_14
	local v30 = {
		["colorMode"] = v_u_13.Enums.ColorMode.Dark,
		["device"] = v_u_23.getDeviceType()
	}
	local v31 = {
		["Child"] = v_u_11.createElement(v_u_10, {
			["localization"] = v_u_9
		}, {
			["Root"] = v_u_11.createElement(v_u_7)
		})
	}
	return v28(v29, v30, v31)
end
local function v36() -- name: createHelpPage
	-- upvalues: (copy) v_u_8, (ref) v_u_24, (copy) v_u_22, (copy) v_u_15, (copy) v_u_17, (copy) v_u_16, (copy) v_u_18, (copy) v_u_9, (ref) v_u_25, (copy) v_u_12, (copy) v_u_11, (copy) v_u_32, (copy) v_u_27
	local v_u_33 = v_u_8:CreateNewPage()
	v_u_33.TabHeader.Name = v_u_24.HELP_PAGE.TAB_HEADER.NAME
	v_u_33.Page.Name = "Help"
	if v_u_22 then
		v_u_33.TabHeader.TabLabel.Icon.Text = v_u_15.Controller
		v_u_33.TabHeader.TabLabel.Icon.FontFace = v_u_17.Font[v_u_16.Regular]
	else
		local v34 = v_u_18[v_u_24.HELP_PAGE.TAB_HEADER.ICON]
		v_u_33.TabHeader.TabLabel.Icon.Text = v34.name
		v_u_33.TabHeader.TabLabel.Icon.FontFace = v_u_17.Font[v34.variant]
	end
	v_u_33.TabHeader.TabLabel.Title.Text = v_u_9:Format(v_u_24.HELP_PAGE.TAB_HEADER.TEXT)
	v_u_33.Page:ClearAllChildren()
	v_u_33.Displayed.Event:Connect(function()
		-- upvalues: (copy) v_u_33, (ref) v_u_25, (ref) v_u_12, (ref) v_u_11, (ref) v_u_32, (ref) v_u_27
		local v35 = v_u_33.Page
		v_u_25 = not v_u_25 and v_u_12.createRoot(v35)
		if v_u_25 then
			v_u_25:render(v_u_11.createElement(v_u_32))
		end
		v_u_27(true)
		if v_u_33.HubRef.VersionContainer then
			v_u_33.HubRef.VersionContainer.Visible = true
		end
	end)
	v_u_33.Hidden.Event:Connect(function()
		-- upvalues: (ref) v_u_27, (copy) v_u_33
		v_u_27(false)
		if v_u_33.HubRef.VersionContainer then
			v_u_33.HubRef.VersionContainer.Visible = false
		end
	end)
	v_u_33.Page.Size = UDim2.fromScale(1, 0)
	v_u_33.Page.AutomaticSize = Enum.AutomaticSize.Y
	return v_u_33
end
if v21 then
	return v36()
else
	return require(v5.Settings.Pages.Help)
end