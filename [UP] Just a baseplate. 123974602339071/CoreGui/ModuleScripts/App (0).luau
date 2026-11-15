-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.App
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = script.Parent.Parent
local v6 = require(v5.InGameMenuPolicy)
local v_u_7 = require(script.Parent.ViewportOverlay)
local v_u_8 = require(script.Parent.SideNavigation)
local v_u_9 = require(script.Parent.LeaveGameDialog)
local v_u_10 = require(script.Parent.PageContainer)
local v_u_11 = require(script.Parent.RespawnDialog)
local v_u_12 = require(script.Parent.ReportPage.ReportDialog)
local v_u_13 = require(script.Parent.ReportPage.ReportSentDialog)
local v_u_14 = require(script.Parent.ControlsPage.ControlLayoutSetter)
local v_u_15 = require(script.Parent.Connection)
local v_u_16 = require(script.Parent.EducationalPopup)
local v_u_17 = require(script.Parent.MenuIconTooltip)
local v_u_18 = require(script.Parent.FullscreenTitleBar)
local v19 = v5.Flags
local v_u_20 = require(v19.FFlagLuaMenuPerfImprovements)
local v_u_21 = require(v5.Resources.Constants)
local v28 = v6.connect(function(p22, _)
	return {
		["enableFullscreenTitleBar"] = p22.enableFullscreenTitleBar(),
		["isEducationalPopupEnabled"] = p22.enableEducationalPopup()
	}
end)(function(p23) -- name: App
	-- upvalues: (copy) v_u_3, (copy) v_u_18, (copy) v_u_21, (copy) v_u_20, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17
	local v24
	if p23.enableFullscreenTitleBar then
		v24 = v_u_3.createElement(v_u_18, {
			["displayOrder"] = v_u_21.DisplayOrder.FullscreenTitleBar
		})
	else
		v24 = nil
	end
	if not v_u_20 then
		return v_u_3.createFragment({
			["Overlay"] = v_u_3.createElement(v_u_7),
			["SideNavigation"] = v_u_3.createElement(v_u_8),
			["LeaveGameDialog"] = v_u_3.createElement(v_u_9),
			["PageContainer"] = v_u_3.createElement(v_u_10),
			["RespawnDialog"] = v_u_3.createElement(v_u_11),
			["ReportDialog"] = v_u_3.createElement(v_u_12),
			["ReportSentDialog"] = v_u_3.createElement(v_u_13),
			["ControlLayoutSetter"] = v_u_3.createElement(v_u_14),
			["Connection"] = v_u_3.createElement(v_u_15),
			["EducationalPopup"] = p23.isEducationalPopupEnabled and v_u_3.createElement(v_u_16) or nil,
			["MenuIconTooltip"] = p23.isEducationalPopupEnabled and v_u_3.createElement(v_u_17) or nil,
			["FullscreenTitleBar"] = v24
		})
	end
	local v25 = v_u_3.createFragment
	local v26 = {}
	local v27
	if p23.isMenuOpen then
		v27 = v_u_3.createFragment({
			["Overlay"] = v_u_3.createElement(v_u_7),
			["SideNavigation"] = v_u_3.createElement(v_u_8),
			["LeaveGameDialog"] = v_u_3.createElement(v_u_9),
			["PageContainer"] = v_u_3.createElement(v_u_10),
			["RespawnDialog"] = v_u_3.createElement(v_u_11),
			["ReportDialog"] = v_u_3.createElement(v_u_12),
			["ReportSentDialog"] = v_u_3.createElement(v_u_13),
			["ControlLayoutSetter"] = v_u_3.createElement(v_u_14)
		}) or nil
	else
		v27 = nil
	end
	v26.Content = v27
	v26.Connection = v_u_3.createElement(v_u_15)
	v26.EducationalPopup = p23.isEducationalPopupEnabled and v_u_3.createElement(v_u_16) or nil
	v26.MenuIconTooltip = p23.isEducationalPopupEnabled and v_u_3.createElement(v_u_17) or nil
	v26.FullscreenTitleBar = v24
	return v25(v26)
end)
return v4.connect(function(p29, _) -- name: mapStateToProps
	return {
		["isMenuOpen"] = p29.isMenuOpen
	}
end, nil)(v28)