-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.MenuItems.FreeCommentsMenuItem
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Components.ReportTextEntry)
local v_u_5 = require(v1.Components.MenuItems.ReportMenuItem)
local v_u_6 = require(v1.Components.Constants)
return function(p7) -- name: FreeCommentsMenuItem
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	local v8 = v_u_3.createElement
	local v9 = v_u_5
	local v10 = {
		["label"] = "Abuse Description",
		["isRightComponentFullWidth"] = true,
		["layoutOrder"] = nil,
		["rightComponent"] = nil,
		["heightOverride"] = nil,
		["menuContainerWidth"] = nil,
		["isSmallPortraitViewport"] = nil,
		["layoutOrder"] = p7.layoutOrder,
		["rightComponent"] = v_u_3.createElement(v_u_4, {
			["layoutOrder"] = p7.layoutOrder,
			["text"] = p7.comment,
			["placeholderText"] = p7.placeholderText,
			["onUpdate"] = p7.onUpdate
		}),
		["heightOverride"] = v_u_6.FreeCommentsMenuItemHeight,
		["menuContainerWidth"] = p7.menuContainerWidth,
		["isSmallPortraitViewport"] = p7.isSmallPortraitViewport
	}
	return v8(v9, v10)
end