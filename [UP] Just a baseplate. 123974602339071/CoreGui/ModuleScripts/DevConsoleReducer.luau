-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.DevConsoleReducer
local v1 = script.Parent
local v_u_2 = require(v1.DevConsoleDisplayOptions)
local v_u_3 = require(v1.MainView)
local v_u_4 = require(v1.MemoryData)
local v_u_5 = require(v1.NetworkData)
local v_u_6 = require(v1.ScriptsData)
local v_u_7 = require(v1.DataStoresData)
local v_u_8 = require(v1.ServerStatsData)
local v_u_9 = require(v1.ServerJobsData)
local v_u_10 = require(v1.ActionBindingsData)
local v_u_11 = require(v1.MicroProfiler)
local v_u_12 = require(v1.DebugVisualizationsData)
local v_u_13 = require(v1.ScriptProfiler)
local v_u_14 = require(v1.LuauHeap)
return function(p15, p16)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14
	local v17 = p15 or {}
	return {
		["DisplayOptions"] = v_u_2(v17.DisplayOptions, p16),
		["MainView"] = v_u_3(v17.MainView, p16),
		["MemoryData"] = v_u_4(v17.MemoryData, p16),
		["NetworkData"] = v_u_5(v17.NetworkData, p16),
		["ScriptsData"] = v_u_6(v17.ScriptsData, p16),
		["DataStoresData"] = v_u_7(v17.DataStoresData, p16),
		["ServerStatsData"] = v_u_8(v17.ServerStatsData, p16),
		["ServerJobsData"] = v_u_9(v17.ServerJobsData, p16),
		["ActionBindingsData"] = v_u_10(v17.ActionBindingsData, p16),
		["MicroProfiler"] = v_u_11(v17.MicroProfiler, p16),
		["DebugVisualizationsData"] = v_u_12(v17.DebugVisualizationsData, p16),
		["ScriptProfiler"] = v_u_13(v17.ScriptProfiler, p16),
		["LuauHeap"] = v_u_14(v17.LuauHeap, p16)
	}
end