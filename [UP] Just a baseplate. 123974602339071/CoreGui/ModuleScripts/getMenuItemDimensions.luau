-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.getMenuItemDimensions
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Components.Constants)
local v_u_4 = require(v2.Packages.UIBlox).Core.Style.useStyle
function getMenuItemDimensions(p5) -- name: getMenuItemDimensions
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v6 = v_u_4()
	return p5 < v_u_3.SmallLayoutThreshold and {
		["LeftWidth"] = v_u_3.LeftContainerWidthSmall,
		["RightWidth"] = v_u_3.RightContainerWidthSmall,
		["TextSize"] = v_u_3.FieldLabelSizeSmall
	} or {
		["LeftWidth"] = v6.Tokens.Size.Size_2000 * 3,
		["RightWidth"] = v6.Tokens.Size.Size_2000 * 4,
		["TextSize"] = v6.Tokens.FontSize.FontSize_400
	}
end
return getMenuItemDimensions