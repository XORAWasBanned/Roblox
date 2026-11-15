-- Path: CoreGui.RobloxGui.Modules.Settings.Components.MenuButtons.MenuButtonsContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("LocalizationService")
local v_u_3 = require(v1.Packages.React)
require(v1.Packages.Signals)
local v_u_4 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_5 = require(v1.Workspace.Packages.Localization).LocalizationProvider
local v_u_6 = require(v1.Packages.Foundation)
local v_u_7 = v_u_6.FoundationProvider
local v_u_8 = require(script.Parent.MenuButtons)
return function(p9) -- name: Container
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8
	local v10 = v_u_4.new(v_u_2.RobloxLocaleId)
	local v11 = v_u_3.createElement
	local v12 = v_u_5
	local v13 = {
		["FoundationProvider"] = v_u_3.createElement(v_u_7, {
			["colorMode"] = v_u_6.Enums.ColorMode.Dark
		}, {
			["MenuButtons"] = v_u_3.createElement(v_u_8, p9)
		})
	}
	return v11(v12, {
		["localization"] = v10
	}, v13)
end