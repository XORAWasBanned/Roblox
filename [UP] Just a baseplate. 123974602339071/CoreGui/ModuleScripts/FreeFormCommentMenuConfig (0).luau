-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Players.FreeFormCommentMenuConfig
local v1 = script:FindFirstAncestor("AbuseReportMenu")
require(v1.Components.Types)
local v_u_2 = require(v1.Components.Constants)
return {
	["componentType"] = "freeComments",
	["getIsVisible"] = nil,
	["onUpdate"] = nil,
	["componentName"] = "FreeComments",
	["getIsVisible"] = function(_) -- name: getIsVisible
		return true
	end,
	["onUpdate"] = function(p3, _, p4, p5) -- name: onUpdate
		-- upvalues: (copy) v_u_2
		p5.analyticsDispatch({
			["type"] = v_u_2.AnalyticsActions.SetCommentAdded,
			["commentAdded"] = #p3 > 0
		})
		p4({
			["type"] = v_u_2.PlayerMenuActions.UpdateComment,
			["comment"] = p3
		})
	end
}