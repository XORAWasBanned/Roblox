-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Utility.getMenuItemSizings
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Components.Constants)
local v_u_4 = require(v2.Packages.UIBlox).Core.Style.useStyle
function getMenuItemSizings() -- name: getMenuItemSizings
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v5 = v_u_4()
	return {
		["ItemPadding"] = v5.Tokens.Size.Size_250,
		["DropdownTextSize"] = v5.Tokens.FontSize.FontSize_400,
		["FontStyle"] = v_u_3.ReportMenuFontStyle,
		["ButtonSize"] = v_u_3.ReportMenuButtonSizeConsole,
		["ButtonInsideVerticalPadding"] = v5.Tokens.Size.Size_100
	}
end
return getMenuItemSizings