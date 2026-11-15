-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.ScriptProfiler
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.SetScriptProfilerState)
local v_u_3 = require(script.Parent.Parent.Actions.SetScriptProfilerRoot)
local v_u_4 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetIsProfiling)
local v_u_5 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetData)
local v_u_6 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetThreads)
local v_u_7 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetTimerState)
local v_u_8 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.ClearStateForNewProfilingSession)
local v_u_9 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetAverage)
local v_u_10 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetFrequency)
local v_u_11 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetDataView)
local v_u_12 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetLiveUpdate)
local v_u_13 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowPlugins)
local v_u_14 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowGC)
local v_u_15 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetSearchData)
require(script.Parent.Parent.Components.ScriptProfiler.ProfilerDataFormatV2)
local function v_u_23(p16, p17, p18) -- name: Update
	-- upvalues: (copy) v_u_1
	local v19
	if p16 then
		v19 = p17.client
	else
		v19 = p17.server
	end
	local v20 = v_u_1.JoinDictionaries(v19, p18)
	local v21 = {}
	local v22
	if p16 then
		v22 = v20
	else
		v22 = nil
	end
	v21.client = v22
	if p16 then
		v20 = nil
	end
	v21.server = v20
	return v_u_1.JoinDictionaries(p17, v21)
end
return function(p24, p25)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4, (copy) v_u_23, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_3
	local v26 = p24 or {
		["isClientView"] = true,
		["usePercentages"] = false,
		["isExporting"] = false,
		["isShowingMobileSettings"] = false,
		["client"] = nil,
		["server"] = nil,
		["client"] = {
			["isProfiling"] = false,
			["data"] = nil,
			["serializedData"] = nil,
			["frequency"] = 1000,
			["timedProfilingThread"] = nil,
			["timedProfilingTimerThread"] = nil,
			["timedProfilingDuration"] = 0,
			["timedProfilingCountdown"] = 0,
			["isFunctionsView"] = false,
			["average"] = 0,
			["searchTerm"] = "",
			["searchFilterGraph"] = nil,
			["searchFilterFlat"] = nil,
			["rootNode"] = 0,
			["rootFunc"] = 0,
			["rootNodeName"] = nil,
			["liveUpdate"] = false,
			["liveUpdateThread"] = nil,
			["showPlugins"] = false,
			["pluginOffsets"] = nil,
			["showGC"] = false,
			["gcFunctionOffsets"] = nil,
			["gcNodeOffsets"] = nil,
			["pluginGCOffsets"] = nil,
			["expandedNodes"] = nil,
			["searchFilterGraph"] = {},
			["searchFilterFlat"] = {},
			["pluginOffsets"] = {},
			["gcFunctionOffsets"] = {},
			["gcNodeOffsets"] = {},
			["pluginGCOffsets"] = {},
			["expandedNodes"] = {}
		},
		["server"] = {
			["isProfiling"] = false,
			["data"] = nil,
			["serializedData"] = nil,
			["frequency"] = 1000,
			["timedProfilingThread"] = nil,
			["timedProfilingTimerThread"] = nil,
			["timedProfilingDuration"] = 0,
			["timedProfilingCountdown"] = 0,
			["isFunctionsView"] = false,
			["average"] = 0,
			["searchTerm"] = "",
			["searchFilterGraph"] = nil,
			["searchFilterFlat"] = nil,
			["rootNode"] = 0,
			["rootFunc"] = 0,
			["rootNodeName"] = nil,
			["liveUpdate"] = false,
			["liveUpdateThread"] = nil,
			["showPlugins"] = false,
			["pluginOffsets"] = nil,
			["showGC"] = false,
			["gcFunctionOffsets"] = nil,
			["gcNodeOffsets"] = nil,
			["pluginGCOffsets"] = nil,
			["expandedNodes"] = nil,
			["searchFilterGraph"] = {},
			["searchFilterFlat"] = {},
			["pluginOffsets"] = {},
			["gcFunctionOffsets"] = {},
			["gcNodeOffsets"] = {},
			["pluginGCOffsets"] = {},
			["expandedNodes"] = {}
		}
	}
	if p25.type == v_u_2.name then
		local v27 = {
			["isClientView"] = p25.isClientView,
			["usePercentages"] = p25.usePercentages,
			["isExporting"] = p25.isExporting,
			["isShowingMobileSettings"] = p25.isShowingMobileSettings,
			["client"] = p25.clientSessionState,
			["server"] = p25.serverSessionState
		}
		return v_u_1.JoinDictionaries(v26, v27)
	end
	if p25.type == v_u_4.name then
		return v_u_23(p25.isClient, v26, {
			["isProfiling"] = p25.isProfiling
		})
	end
	if p25.type == v_u_9.name then
		return v_u_23(p25.isClient, v26, {
			["average"] = p25.average
		})
	end
	if p25.type == v_u_10.name then
		return v_u_23(p25.isClient, v26, {
			["frequency"] = p25.frequency
		})
	end
	if p25.type == v_u_11.name then
		return v_u_23(p25.isClient, v26, {
			["isFunctionsView"] = p25.isFunctionsView
		})
	end
	if p25.type == v_u_12.name then
		return v_u_23(p25.isClient, v26, {
			["liveUpdate"] = p25.liveUpdate
		})
	end
	if p25.type == v_u_13.name then
		return v_u_23(p25.isClient, v26, {
			["showPlugins"] = p25.showPlugins
		})
	end
	if p25.type == v_u_14.name then
		return v_u_23(p25.isClient, v26, {
			["showGC"] = p25.showGC
		})
	end
	if p25.type == v_u_15.name then
		return v_u_23(p25.isClient, v26, {
			["searchTerm"] = p25.state.searchTerm,
			["searchFilterFlat"] = p25.state.searchFilterFlat,
			["searchFilterGraph"] = p25.state.searchFilterGraph
		})
	end
	if p25.type == v_u_7.name then
		local v28 = {
			["timedProfilingDuration"] = p25.state.timedProfilingDuration,
			["timedProfilingCountdown"] = p25.state.timedProfilingCountdown
		}
		return v_u_23(p25.isClient, v26, v28)
	end
	if p25.type == v_u_5.name then
		local v29 = table.clone
		local v30
		if p25.isClient then
			v30 = v26.client
		else
			v30 = v26.server
		end
		local v31 = v29(v30)
		v31.data = p25.state.data
		v31.serializedData = p25.state.serializedData
		v31.pluginOffsets = p25.state.pluginOffsets or {}
		v31.pluginGCOffsets = p25.state.pluginGCOffsets or {}
		v31.gcFunctionOffsets = p25.state.gcFunctionOffsets or {}
		v31.gcNodeOffsets = p25.state.gcNodeOffsets or {}
		v31.expandedNodes = p25.state.expandedNodes or {}
		local v32 = table.clone(v26)
		if p25.isClient then
			v32.client = v31
		else
			v32.server = v31
		end
		return v_u_1.JoinDictionaries(v26, v32)
	end
	if p25.type == v_u_6.name then
		local v33 = table.clone
		local v34
		if p25.isClient then
			v34 = v26.client
		else
			v34 = v26.server
		end
		local v35 = v33(v34)
		v35.timedProfilingThread = p25.state.timedProfilingThread
		v35.timedProfilingTimerThread = p25.state.timedProfilingTimerThread
		v35.liveUpdateThread = p25.state.liveUpdateThread
		local v36 = table.clone(v26)
		if p25.isClient then
			v36.client = v35
		else
			v36.server = v35
		end
		return v_u_1.JoinDictionaries(v26, v36)
	end
	if p25.type ~= v_u_8.name then
		if p25.type ~= v_u_3.name then
			return v26
		end
		local v37 = {}
		local v38 = table.clone
		local v39
		if v26.isClientView then
			v39 = v26.client
		else
			v39 = v26.server
		end
		local v40 = v38(v39)
		if v40.rootNode == p25.rootNode then
			v40.rootNode = 0
			v40.rootFunc = 0
			v40.rootNodeName = nil
		else
			v40.rootNode = p25.rootNode
			v40.rootFunc = p25.rootFunc
			v40.rootNodeName = p25.rootNodeName
		end
		if v26.isClientView then
			v37.client = v40
		else
			v37.server = v40
		end
		return v_u_1.JoinDictionaries(v26, v37)
	end
	local v41 = table.clone
	local v42
	if p25.isClient then
		v42 = v26.client
	else
		v42 = v26.server
	end
	local v43 = v41(v42)
	v43.rootNode = 0
	v43.rootFunc = 0
	v43.rootNodeName = nil
	v43.searchFilterFlat = {}
	v43.searchFilterGraph = {}
	v43.expandedNodes = {}
	local v44 = table.clone(v26)
	if p25.isClient then
		v44.client = v43
	else
		v44.server = v43
	end
	return v_u_1.JoinDictionaries(v26, v44)
end