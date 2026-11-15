-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.MenuItems.ButtonReportMenuItem
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Components.MenuItems.ReportMenuItem)
return function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.createElement(v_u_4, {
		["label"] = p5.label,
		["layoutOrder"] = p5.layoutOrder,
		["rightComponent"] = p5.button,
		["menuContainerWidth"] = p5.menuContainerWidth,
		["isSmallPortraitViewport"] = p5.isSmallPortraitViewport
	})
end