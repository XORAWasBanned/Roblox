-- Path: CoreGui.RobloxGui.Modules.FTUX.Utility.MockFTUXStyleAndLocalizationComponent
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local v_u_5 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_6 = require(v1.Workspace.Packages.Localization).LocalizationProvider
return function(p7)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	local v8 = v_u_2.createElement
	local v9 = v_u_6
	local v10 = {
		["localization"] = v_u_5.new(v_u_3.RobloxLocaleId)
	}
	local v11 = {}
	local v12 = v_u_2.createElement
	local v13 = {}
	local v14 = v_u_4
	local v15 = {
		["Frame"] = v_u_2.createElement("Frame", {
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, p7)
	}
	v13.ThemeProvider = v14(v15)
	v11.FTUXMock = v12("ScreenGui", {}, v13)
	return v8(v9, v10, v11)
end