-- Path: CoreGui.RobloxGui.Modules.FTUX
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = require(v2.Packages.Roact)
local v5 = v_u_1:WaitForChild("RobloxGui")
local v_u_6 = require(v5.Modules.Common.renderWithCoreScriptsStyleProvider)
local v_u_7 = require(v2.Workspace.Packages.InExperienceLocales).Localization
local v_u_8 = require(v2.Workspace.Packages.Localization).LocalizationProvider
local v_u_9 = require(script.Components.FTUXPanel)
local v_u_10 = require(script.Features.GetFeatures)
require(script.Enums.PlatformEnum)
return {
	["mountFtuxMenu"] = function(p11) -- name: mountFtuxMenu
		-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10, (copy) v_u_1
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		local v12 = v_u_4.createElement
		local v13 = v_u_8
		local v14 = {
			["localization"] = v_u_7.new(v_u_3.RobloxLocaleId)
		}
		local v15 = {}
		local v16 = v_u_4.createElement
		local v17 = {}
		local v18 = v_u_6
		local v19 = {
			["FtuxPanel"] = v_u_4.createElement(v_u_9, {
				["platform"] = p11
			}, {})
		}
		v17.ThemeProvider = v18(v19)
		v15.FTUXMenu = v16("ScreenGui", {}, v17)
		local v20 = v12(v13, v14, v15)
		v_u_10(p11)
		v_u_4.mount(v20, v_u_1, "FTUXMenu")
	end
}