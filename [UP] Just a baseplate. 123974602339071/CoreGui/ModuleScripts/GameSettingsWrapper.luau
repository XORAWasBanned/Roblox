-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.GameSettingsWrapper
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1:WaitForChild("RobloxGui").Modules
local v_u_4 = require(v2.Packages.BuilderIcons)
local v_u_5 = require(v2.Packages.Foundation)
local v_u_6 = require(v2.Packages.React)
local v_u_7 = require(v2.Packages.ReactRoblox)
local v8 = require(v3.Settings.Flags)
local v_u_9 = require(v3.Settings.SettingsPageFactory)
local v10 = v8.FFlagRefactorInExpSettingsInDevelopment
local v_u_11, v_u_12
if v10 then
	local v13 = require(v3.Settings.Integrations)
	v_u_11 = v13.Utils
	v_u_12 = v13.Constants
else
	v_u_12 = nil
	v_u_11 = nil
end
local v_u_14 = v_u_5.FoundationProvider
local v_u_15 = v_u_4.Migration
local function v19() -- name: createGameSettings
	-- upvalues: (copy) v_u_9, (ref) v_u_12, (copy) v_u_15, (copy) v_u_4, (copy) v_u_6, (copy) v_u_14, (copy) v_u_5, (ref) v_u_11, (copy) v_u_7
	local v_u_16 = v_u_9:CreateNewPage()
	v_u_16.TabHeader.Name = v_u_12.GAMESETTINGS.TAB_HEADER.NAME
	local v17 = v_u_15.uiblox["icons/common/settings"]
	v_u_16.TabHeader.TabLabel.Icon.Text = v17.name
	v_u_16.TabHeader.TabLabel.Icon.FontFace = v_u_4.Font[v17.variant]
	v_u_16.TabHeader.TabLabel.Title.Text = v_u_12.GAMESETTINGS.TAB_HEADER.TEXT
	v_u_16.Page:ClearAllChildren()
	v_u_16.PageOpen = false
	function v_u_16.OpenSettingsPage()
		-- upvalues: (copy) v_u_16
		v_u_16.PageOpen = true
	end
	function v_u_16.CloseSettingsPage()
		-- upvalues: (copy) v_u_16
		v_u_16.PageOpen = false
	end
	local v18 = v_u_6.createElement(v_u_14, {
		["colorMode"] = v_u_5.Enums.ColorMode.Dark,
		["device"] = v_u_11.getDeviceType()
	}, {})
	v_u_7.createRoot(v_u_16.Page):render(v18)
	return v_u_16
end
if v10 then
	return v19()
else
	return require(v3.Settings.Pages.GameSettings)
end