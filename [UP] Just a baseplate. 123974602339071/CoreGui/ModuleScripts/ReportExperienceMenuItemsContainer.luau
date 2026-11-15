-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.Containers.ReportExperienceMenuItemsContainer
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.MenuConfigs.getMenuItemsFromConfigs)
local v_u_5 = require(v1.Utility.getMenuItemSizings)
local v_u_6 = require(v1.MenuConfigs.Experience.ReportExperienceMenuItemConfigList)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.Constants)
local v_u_8 = require(v2.Packages.Cryo)
local v_u_9 = require(v1.Reducers.reportExperienceUIStateReducer)
return function(p_u_10) -- name: ReportExperienceMenuItemsContainer
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_9, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8
	local v11 = v_u_5()
	local v12, v13 = v_u_3.useReducer(v_u_9, v_u_7.InitExperienceUIState)
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_10, (ref) v_u_7
		if p_u_10.utilityProps.isReportTabVisible then
			p_u_10.utilityProps.analyticsDispatch({
				["type"] = v_u_7.AnalyticsActions.SwitchToExperienceInitialSelections
			})
		end
	end, { p_u_10.utilityProps.isReportTabVisible })
	local v14 = v_u_4(v12, v13, p_u_10.utilityProps, v_u_6, p_u_10.isSmallPortraitViewport)
	local v15 = v_u_8.Dictionary.join
	local v16 = {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v11.ItemPadding)
		})
	}
	local v17 = v15(v16, v14)
	local v18 = v_u_3.createElement
	local v19 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v20 = {
		["MenuItems"] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, v17)
	}
	return v18("Frame", v19, v20)
end