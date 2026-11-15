-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.MenuItems.ModalBasedSelectorMenuItem
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Components.ModalBasedSelector)
local v_u_5 = require(v1.Components.MenuItems.ReportMenuItem)
return function(p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	return v_u_3.createElement(v_u_5, {
		["label"] = p6.label,
		["layoutOrder"] = p6.layoutOrder,
		["rightComponent"] = v_u_3.createElement(v_u_4, p6),
		["menuContainerWidth"] = p6.menuContainerWidth,
		["isSmallPortraitViewport"] = p6.isSmallPortraitViewport,
		["placeholderText"] = p6.placeholderText
	})
end