-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.PlaytestModeThemeProvider
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.UIBlox).App.Style.Constants
local v4 = require(v1.Workspace.Packages.Style)
local v_u_5 = v4.UiModeStyleProvider
local v_u_6 = v4.AppearanceContext
local v_u_7 = require(v1.Packages.Foundation).Enums.ColorMode
local v_u_8 = require(script.Parent.Parent.Hooks.useIsPlaytestMode)
local function v_u_11(p_u_9) -- name: ThemeSwitcher
	-- upvalues: (copy) v_u_2, (copy) v_u_6
	local v_u_10 = v_u_2.useContext(v_u_6)
	v_u_2.useLayoutEffect(function()
		-- upvalues: (copy) v_u_10, (copy) p_u_9
		v_u_10.setTheme(p_u_9.themeName)
	end, { p_u_9.themeName, v_u_10 })
	return v_u_2.createElement(v_u_2.Fragment, nil, p_u_9.children)
end
return function(p12) -- name: PlaytestModeThemeProvider
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_2, (copy) v_u_5, (copy) v_u_3, (copy) v_u_11
	local v13
	if v_u_8() then
		v13 = v_u_7.Light
	else
		v13 = v_u_7.Dark
	end
	local v14 = v_u_2.createElement
	local v15 = v_u_5
	local v16 = {
		["style"] = {
			["themeName"] = v13,
			["fontName"] = v_u_3.FontName.Gotham
		}
	}
	local v17 = {
		["ThemeSwitcher"] = v_u_2.createElement(v_u_11, {
			["themeName"] = v13
		}, p12.children)
	}
	return v14(v15, v16, v17)
end