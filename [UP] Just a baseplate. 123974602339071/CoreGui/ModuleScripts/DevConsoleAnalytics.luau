-- Path: CoreGui.RobloxGui.Modules.DevConsole.MiddleWare.DevConsoleAnalytics
local v_u_1 = game:GetService("RbxAnalyticsService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Dash)
local v_u_4 = require(script.Parent.Parent.Actions.SetActiveTab)
local v_u_5 = require(script.Parent.Parent.Actions.SetDevConsoleVisibility)
local v_u_6 = require(script.Parent.Parent.Actions.SetDevConsoleMinimized)
local v_u_7 = game:DefineFastInt("ReportDevConsoleTabEventsThrottleHundredthsPercent", 0)
function ReportDevConsoleOpenClose(p8, p9) -- name: ReportDevConsoleOpenClose
	-- upvalues: (copy) v_u_5, (copy) v_u_1
	if p9.type == v_u_5.name then
		local v10 = p8:getState().DisplayOptions.isVisible
		local v11 = p8:getState().DisplayOptions.visibleStartTime
		if p9.isVisible ~= v10 then
			if p9.isVisible then
				v_u_1:ReportCounter("DevConsoleStartVisible", 1)
				return
			end
			v_u_1:ReportStats("DevConsoleSessionTime", tick() - v11)
		end
	end
end
function getTabAnalyticsKeyName(p12, p13) -- name: getTabAnalyticsKeyName
	if p13 == nil then
		return string.format("%s", p12)
	else
		return string.format("%s_%s", p12, p13 and "Client" or "Server")
	end
end
function dispatchTabAnalytics(p14) -- name: dispatchTabAnalytics
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_7
	v_u_1:ReportInfluxSeries("devConsoleMetric", v_u_3.join({
		["placeId"] = nil,
		["calledFrom"] = "devConsoleTabChange",
		["placeId"] = game.PlaceId
	}, p14), v_u_7)
end
function ReportTabChange(p15, p16) -- name: ReportTabChange
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	if p16.type == v_u_4.name then
		local v17 = p15:getState().MainView
		local v18 = p16.newTabIndex
		local v19 = p16.isClientView
		if v18 ~= v17.currTabIndex or v19 ~= nil and v19 ~= v17.isClientView then
			local v20 = {
				["initTab"] = getTabAnalyticsKeyName(v17.currTabIndex, v17.isClientView),
				["endTab"] = getTabAnalyticsKeyName(v18, v19)
			}
			dispatchTabAnalytics(v20)
			return
		end
	else
		if p16.type == v_u_5.name then
			local v21 = p15:getState().MainView
			local v22 = p15:getState().DisplayOptions
			local v23
			if p16.isVisible then
				v23 = {
					["initTab"] = "StartVisible",
					["endTab"] = nil,
					["endTab"] = getTabAnalyticsKeyName(v21.currTabIndex, v21.isClientView)
				}
			else
				v23 = v22.isMinimized and {
					["initTab"] = "Minimized",
					["endTab"] = "EndVisible"
				} or {
					["initTab"] = nil,
					["endTab"] = "EndVisible",
					["initTab"] = getTabAnalyticsKeyName(v21.currTabIndex, v21.isClientView)
				}
			end
			dispatchTabAnalytics(v23)
			return
		end
		if p16.type == v_u_6.name then
			local v24 = p15:getState().MainView
			local v25
			if p16.isMinimized then
				v25 = {
					["initTab"] = nil,
					["endTab"] = "Minimized",
					["initTab"] = getTabAnalyticsKeyName(v24.currTabIndex, v24.isClientView)
				}
			else
				v25 = {
					["initTab"] = "Minimized",
					["endTab"] = nil,
					["endTab"] = getTabAnalyticsKeyName(v24.currTabIndex, v24.isClientView)
				}
			end
			dispatchTabAnalytics(v25)
		end
	end
end
return function(p_u_26, p_u_27)
	return function(p28)
		-- upvalues: (copy) p_u_27, (copy) p_u_26
		ReportTabChange(p_u_27, p28)
		ReportDevConsoleOpenClose(p_u_27, p28)
		p_u_26(p28)
	end
end