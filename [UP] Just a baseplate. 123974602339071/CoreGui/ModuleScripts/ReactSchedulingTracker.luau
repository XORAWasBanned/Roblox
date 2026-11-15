-- Path: CoreGui.RobloxGui.Modules.Common.ReactSchedulingTracker
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("RunService")
local v3 = game:DefineFastInt("ReactSchedulingTracker", 0)
local v_u_4 = game:DefineFastInt("ReactSchedulingTrackerPeriodMs", 30000)
local v5 = game:GetEngineFeature("TelemetryServiceMemoryCPUInfoEnabled")
local v_u_6 = game:DefineFastFlag("DisableReactSchedulingTimePctStats", false)
local v_u_7 = game:DefineFastFlag("DisableReactSchedulingAvgMaxMsStats", false)
local v8 = require(v1.Workspace.Packages.SharedFlags).FStringReactSchedulingContext
local v9 = game:DefineFastString("ReactSchedulingPercentiles", "10,50,95,99")
local v_u_10 = game:DefineFastInt("ReactSchedulingKllSketchMaxSize", 200)
local v_u_11 = game:DefineFastFlag("DebugReactSchedulingEnableErrorEvents", false)
local v_u_12 = game:DefineFastFlag("ReactSchedulingTrackerLayoutEffects", false)
local v_u_13 = game:DefineFastFlag("ReactSchedulingTrackerDataModelUpdate", false)
local v14 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local v_u_15 = game:DefineFastFlag("EnableCorescriptExecutionTime", false)
local v_u_16 = game:GetEngineFeature("ScriptPlusExecutionTimeEnabled")
function applicationId() -- name: applicationId
	local v17 = game:GetService("AppStorageService")
	if not v17 then
		return nil
	end
	local v18 = v17:GetItem("AppInstallationId")
	local v19 = typeof(v18)
	if v19 == "number" then
		return tonumber(v18) or nil
	end
	if v19 ~= "string" then
		return nil
	end
	if string.len(v18) <= 0 then
		return nil
	end
	local v20 = tostring(10000)
	local v21 = -string.len(v20)
	local v22 = string.sub(v18, v21)
	return tonumber(v22)
end
local v_u_23, v_u_24
if v3 > 0 then
	v_u_23 = true
	v_u_24 = true
else
	v_u_23 = false
	v_u_24 = false
end
local v25 = math.random(0, 10000)
local v26 = applicationId()
if v26 ~= nil then
	v25 = (v26 + 1409) % 10000
end
if v25 >= v3 then
	v_u_23 = false
	v_u_24 = false
end
local v_u_27 = game:GetService("TelemetryService")
local v_u_28 = require(v1.Workspace.Packages.Loggers).mutedError
local v29 = require(v1.Packages.ReactRoblox)
require(v1.Packages.ReactReconciler)
local v_u_30 = require(v1.Workspace.Packages.InExperiencePerformance).KllSketch
local v_u_31 = string.split(v9)
local v32 = game:GetService("CorePackages")
local v33 = require(v32.Workspace.Packages.Devices).DeviceTier
local v_u_34 = v29.schedulingProfiler
local v_u_35 = v_u_34.profilerEventTypes
local v_u_36 = v33.GetDeviceMemoryTier()
local v_u_37 = {}
v_u_37.__index = v_u_37
function v_u_37.new(p38, p39) -- name: new
	-- upvalues: (copy) v_u_12, (copy) v_u_35, (copy) v_u_28, (copy) v_u_37
	local v58 = {
		["frameReporter"] = nil,
		["rootReporter"] = nil,
		["currentState"] = "Idle",
		["timerStartMs"] = 0,
		["layoutTimerStartMs"] = nil,
		["rootUpdateInProgress"] = false,
		["rootUpdateTime"] = nil,
		["rootPassiveEffectsTime"] = nil,
		["renderLevel"] = 0,
		["states"] = nil,
		["frameReporter"] = p38,
		["rootReporter"] = p39,
		["layoutTimerStartMs"] = v_u_12 and 0 or nil,
		["rootUpdateTime"] = {
			["tag"] = "RootUpdateTime",
			["RenderMs"] = 0,
			["CommitMs"] = 0,
			["LayoutEffectsMs"] = nil,
			["StartTimeMs"] = 0,
			["LayoutEffectsMs"] = v_u_12 and 0 or nil
		},
		["rootPassiveEffectsTime"] = {
			["tag"] = "RootPassiveEffectsTime",
			["PassiveEffectsMs"] = 0
		},
		["states"] = {
			["Idle"] = function(p40, p41)
				-- upvalues: (ref) v_u_35, (ref) v_u_12
				if p41 == v_u_35.RenderStart then
					p40.timerStartMs = os.clock() * 1000
					if not p40.rootUpdateInProgress then
						p40.rootUpdateInProgress = true
						p40.rootUpdateTime = {
							["tag"] = "RootUpdateTime",
							["RenderMs"] = 0,
							["CommitMs"] = 0,
							["LayoutEffectsMs"] = nil,
							["StartTimeMs"] = nil,
							["LayoutEffectsMs"] = v_u_12 and 0 or nil,
							["StartTimeMs"] = os.clock() * 1000
						}
					end
					return "Render"
				elseif p41 == v_u_35.PassiveEffectsStart then
					p40.timerStartMs = os.clock() * 1000
					p40.rootPassiveEffectsTime = {
						["tag"] = "RootPassiveEffectsTime",
						["PassiveEffectsMs"] = 0
					}
					return "PassiveEffects"
				else
					if p41 ~= v_u_35.CommitStart then
						return nil
					end
					p40.timerStartMs = os.clock() * 1000
					return "Commit"
				end
			end,
			["Render"] = function(p42, p43)
				-- upvalues: (ref) v_u_35, (ref) v_u_28
				if p43 ~= v_u_35.RenderYield and p43 ~= v_u_35.RenderStop then
					v_u_28("Invalid event in Render: " .. p43)
					return "Idle"
				end
				local v44 = os.clock() * 1000 - p42.timerStartMs
				local v45 = p42.rootUpdateTime
				v45.RenderMs = v45.RenderMs + v44
				p42.frameReporter(v44)
				return "Idle"
			end,
			["Commit"] = function(p46, p47, p48)
				-- upvalues: (ref) v_u_35, (ref) v_u_12, (ref) v_u_28
				if p47 ~= v_u_35.CommitStop then
					if p47 == v_u_35.RenderStart then
						p46.renderLevel = p46.renderLevel + 1
						if v_u_12 and p46.renderLevel == 1 then
							p46.layoutTimerStartMs = os.clock() * 1000
						end
						return nil
					end
					if v_u_12 and (p47 == v_u_35.LayoutEffectsStart or p47 == v_u_35.PassiveEffectsStart) then
						if p46.renderLevel == 0 then
							p46.layoutTimerStartMs = os.clock() * 1000
						end
						return nil
					end
					if v_u_12 and (p47 == v_u_35.LayoutEffectsStop or p47 == v_u_35.PassiveEffectsStop) then
						if p46.renderLevel == 0 then
							local v49 = p46.rootUpdateTime
							v49.LayoutEffectsMs = v49.LayoutEffectsMs + (os.clock() * 1000 - p46.layoutTimerStartMs)
						end
						return nil
					end
					if p47 ~= v_u_35.RenderYield then
						return nil
					end
					v_u_28("Invalid event in Commit: " .. p47)
					return "Idle"
				end
				if p46.renderLevel > 0 then
					if v_u_12 and p46.renderLevel == 1 then
						local v50 = p46.rootUpdateTime
						v50.LayoutEffectsMs = v50.LayoutEffectsMs + (os.clock() * 1000 - p46.layoutTimerStartMs)
					end
					p46.renderLevel = p46.renderLevel - 1
					return nil
				end
				local v51 = os.clock() * 1000 - p46.timerStartMs
				local v52 = p46.rootUpdateTime
				v52.CommitMs = v52.CommitMs + v51
				p46.frameReporter(v51)
				p46.rootReporter(p46.rootUpdateTime, p48)
				p46.rootUpdateInProgress = false
				return "Idle"
			end,
			["PassiveEffects"] = function(p53, p54, p55)
				-- upvalues: (ref) v_u_35, (ref) v_u_28
				if p54 ~= v_u_35.PassiveEffectsStop then
					v_u_28("Invalid event in PassiveEffects: " .. p54)
					return "Idle"
				end
				local v56 = os.clock() * 1000 - p53.timerStartMs
				local v57 = p53.rootPassiveEffectsTime
				v57.PassiveEffectsMs = v57.PassiveEffectsMs + v56
				p53.frameReporter(v56)
				p53.rootReporter(p53.rootPassiveEffectsTime, p55)
				return "Idle"
			end
		}
	}
	local v59 = v_u_37
	return setmetatable(v58, v59)
end
function v_u_37.transition(p60, p61, p62) -- name: transition
	local v63 = p60.currentState
	local v64 = p60.states[v63](p60, p61, p62)
	if v64 then
		p60.currentState = v64
	end
end
local v_u_65 = v5 and {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo",
	"addMemoryInfo",
	"addCPUInfo"
} or {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo"
}
if v14 then
	table.insert(v_u_65, "addPlaySessionId")
end
local v_u_66 = {
	["eventName"] = "ReactSessionSummary",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Summary of React performance over a game session",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "EventIngest" },
	["throttlingPercentage"] = game:DefineFastInt("ReactSessionSummaryEventThrottleHunderedthsPercent", 0),
	["lastUpdated"] = { 2025, 7, 10 }
}
local v_u_67 = v_u_11 and {
	["eventName"] = "ReactSessionErrorEvent",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Summary of React performance over a game session",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "EventIngest" },
	["throttlingPercentage"] = game:DefineFastInt("DebugReactSessionErrorEventThrottleHunderedthsPercent", 0),
	["lastUpdated"] = { 2025, 8, 7 }
} or nil
local v_u_68 = {
	["eventName"] = "ReactPeriodSummary",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Summary of React performance over a period",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "EventIngest" },
	["throttlingPercentage"] = game:DefineFastInt("ReactPeriodSummaryEventThrottleHunderedthsPercent", 0),
	["lastUpdated"] = { 2025, 2, 18 }
}
local v_u_69 = {
	["eventName"] = "ReactPeriod",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Stats for React performance over a period",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "RobloxTelemetryStat" },
	["lastUpdated"] = { 2025, 2, 18 }
}
local v_u_70 = {
	["eventName"] = "ReactFrameCounter",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Frame counts for React performance over a period",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "RobloxTelemetryCounter" },
	["lastUpdated"] = { 2025, 2, 18 }
}
local v_u_71 = {
	["eventName"] = "ReactRootSummary",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["throttlingPercentage"] = nil,
	["description"] = "Summary of React performance for a root",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "EventIngest" },
	["lastUpdated"] = { 2025, 2, 18 },
	["throttlingPercentage"] = game:DefineFastInt("ReactRootSummaryEventThrottleHunderedthsPercent2", 0)
}
local v_u_72 = not v_u_6 and {
	["eventName"] = "ReactRootPeriod",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Stats for React performance for a root over a period",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "RobloxTelemetryStat" },
	["lastUpdated"] = { 2025, 2, 18 }
} or nil
local v_u_73 = {
	["eventName"] = "ReactRootTaskCount",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Task counts for React performance for a root over a period",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "RobloxTelemetryCounter" },
	["lastUpdated"] = { 2025, 2, 18 }
}
local v_u_74 = not v_u_7 and {
	["eventName"] = "ReactRootPeriodTask",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Task stats for React performance for a root over a period",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "RobloxTelemetryStat" },
	["lastUpdated"] = { 2025, 2, 18 }
} or nil
local v_u_75 = {
	["eventName"] = "ReactRootUpdate",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Task stats for individual React root updates, all in milliseconds",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	["backends"] = { "RobloxTelemetryStat" },
	["lastUpdated"] = { 2025, 2, 18 }
}
local v_u_76 = {}
v_u_76.__index = v_u_76
function v_u_76.new(p77) -- name: new
	-- upvalues: (copy) v_u_30, (copy) v_u_10, (copy) v_u_11, (copy) v_u_76, (copy) v_u_37, (ref) v_u_24
	local v78 = {}
	local v79 = {}
	local v80 = {}
	local v81 = {}
	local v82 = {}
	local v83 = {}
	v78.all = v_u_30.new(v_u_10)
	v79.all = v_u_30.new(v_u_10)
	v80.all = v_u_30.new(v_u_10)
	if v_u_11 then
		v81.all = {}
		v82.all = {}
		v83.all = {}
	end
	local v84 = {
		["started"] = false,
		["periodStartMs"] = 0,
		["reactFrameTimeMs"] = 0,
		["frameMetrics"] = nil,
		["rootsMetrics"] = nil,
		["sessionMetrics"] = nil,
		["context"] = nil,
		["frameMetrics"] = {
			["totalFrameCount"] = 0,
			["reactFrameCount"] = 0,
			["totalReactTimeMs"] = 0,
			["totalCorescriptTimeMs"] = 0,
			["maxReactFrameTimeMs"] = 0,
			["allFrameHistogram"] = nil,
			["reactFrameHistogram"] = nil,
			["reactDropChangeHistogram"] = nil,
			["allFrameHistogram"] = {
				0,
				0,
				0,
				0
			},
			["reactFrameHistogram"] = {
				0,
				0,
				0,
				0
			},
			["reactDropChangeHistogram"] = {
				0,
				0,
				0,
				0
			}
		},
		["rootsMetrics"] = {}
	}
	local v85 = {
		["updateTime"] = {
			["sketches"] = nil,
			["allData"] = nil,
			["numRoots"] = 1,
			["sketches"] = v78,
			["allData"] = not v_u_11 and {} or v81
		},
		["commitTime"] = {
			["sketches"] = nil,
			["allData"] = nil,
			["numRoots"] = 1,
			["sketches"] = v79,
			["allData"] = not v_u_11 and {} or v82
		},
		["timeToUpdate"] = {
			["sketches"] = nil,
			["allData"] = nil,
			["numRoots"] = 1,
			["sketches"] = v80,
			["allData"] = not v_u_11 and {} or v83
		},
		["timePerFrame"] = {
			["sketch"] = v_u_30.new(v_u_10),
			["allData"] = {}
		},
		["timePerReactFrame"] = {
			["sketch"] = v_u_30.new(v_u_10),
			["allData"] = {}
		}
	}
	v84.sessionMetrics = v85
	v84.context = p77
	local v86 = v_u_76
	local v_u_87 = setmetatable(v84, v86)
	v_u_87.schedulerStateMachine = v_u_37.new(function(p88)
		-- upvalues: (copy) v_u_87
		v_u_87:addToFrame(p88)
	end, function(p89, p90)
		-- upvalues: (copy) v_u_87, (ref) v_u_24
		v_u_87:trackSessionSketches(p89, p90)
		if v_u_24 then
			v_u_87:reportRoot(p89, p90)
		end
	end)
	return v_u_87
end
function v_u_76.start(p_u_91) -- name: start
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_4, (ref) v_u_23
	p_u_91.started = true
	p_u_91:resetState()
	v_u_34.registerProfilerEventCallback(function(p92, p93)
		-- upvalues: (copy) p_u_91
		p_u_91.schedulerStateMachine:transition(p92, p93)
	end)
	v_u_2.Heartbeat:Connect(function(p94)
		-- upvalues: (copy) p_u_91, (ref) v_u_4, (ref) v_u_23
		p_u_91:processFrame(p94 * 1000)
		p_u_91.reactFrameTimeMs = 0
		if v_u_4 < os.clock() * 1000 - p_u_91.periodStartMs then
			if v_u_23 then
				p_u_91:reportPeriod()
			end
			p_u_91:resetState()
		end
	end)
end
function v_u_76.resetState(p95) -- name: resetState
	p95.periodStartMs = os.clock() * 1000
	p95.frameMetrics = {
		["totalFrameCount"] = 0,
		["reactFrameCount"] = 0,
		["totalReactTimeMs"] = 0,
		["totalCorescriptTimeMs"] = 0,
		["maxReactFrameTimeMs"] = 0,
		["allFrameHistogram"] = nil,
		["reactFrameHistogram"] = nil,
		["reactDropChangeHistogram"] = nil,
		["allFrameHistogram"] = {
			0,
			0,
			0,
			0
		},
		["reactFrameHistogram"] = {
			0,
			0,
			0,
			0
		},
		["reactDropChangeHistogram"] = {
			0,
			0,
			0,
			0
		}
	}
	p95.rootsMetrics = {}
end
function v_u_76.getRootName(_, p96) -- name: getRootName
	local v97 = "Unknown"
	if p96 then
		if p96.containerInfo.Name ~= "Folder" then
			return p96.containerInfo.Name
		end
		if p96.current and (p96.current.child and p96.current.child.memoizedProps) then
			for v98, _ in p96.current.child.memoizedProps do
				if typeof(v98) ~= "string" then
					continue
				end
				return v98
			end
		end
	end
	return v97
end
function v_u_76.addToFrame(p99, p100) -- name: addToFrame
	p99.reactFrameTimeMs = p99.reactFrameTimeMs + p100
end
function v_u_76.trackSessionSketches(p101, p102, p103) -- name: trackSessionSketches
	-- upvalues: (copy) v_u_11, (copy) v_u_30, (copy) v_u_10
	if p101.sessionMetrics then
		local v104 = p101:getRootName(p103)
		if p102.tag == "RootUpdateTime" then
			local v105 = os.clock() * 1000 - p102.StartTimeMs
			if v_u_11 then
				local v106 = p101.sessionMetrics.updateTime.allData.all
				local v107 = p102.RenderMs + p102.CommitMs
				table.insert(v106, v107)
				local v108 = p101.sessionMetrics.commitTime.allData.all
				local v109 = p102.CommitMs
				table.insert(v108, v109)
				local v110 = p101.sessionMetrics.timeToUpdate.allData.all
				table.insert(v110, v105)
			end
			p101.sessionMetrics.updateTime.sketches.all:insert(p102.RenderMs + p102.CommitMs)
			p101.sessionMetrics.commitTime.sketches.all:insert(p102.CommitMs)
			p101.sessionMetrics.timeToUpdate.sketches.all:insert(v105)
			if not p101.sessionMetrics.updateTime.sketches[v104] then
				p101.sessionMetrics.updateTime.sketches[v104] = v_u_30.new(v_u_10)
				if v_u_11 then
					p101.sessionMetrics.updateTime.allData[v104] = {}
				end
				local v111 = p101.sessionMetrics.updateTime
				v111.numRoots = v111.numRoots + 1
			end
			p101.sessionMetrics.updateTime.sketches[v104]:insert(p102.RenderMs + p102.CommitMs)
			if v_u_11 then
				local v112 = p101.sessionMetrics.updateTime.allData[v104]
				local v113 = p102.RenderMs + p102.CommitMs
				table.insert(v112, v113)
			end
			if not p101.sessionMetrics.commitTime.sketches[v104] then
				p101.sessionMetrics.commitTime.sketches[v104] = v_u_30.new(v_u_10)
				if v_u_11 then
					p101.sessionMetrics.commitTime.allData[v104] = {}
				end
				local v114 = p101.sessionMetrics.commitTime
				v114.numRoots = v114.numRoots + 1
			end
			p101.sessionMetrics.commitTime.sketches[v104]:insert(p102.CommitMs)
			if v_u_11 then
				local v115 = p101.sessionMetrics.commitTime.allData[v104]
				local v116 = p102.CommitMs
				table.insert(v115, v116)
			end
			if not p101.sessionMetrics.timeToUpdate.sketches[v104] then
				p101.sessionMetrics.timeToUpdate.sketches[v104] = v_u_30.new(v_u_10)
				if v_u_11 then
					p101.sessionMetrics.timeToUpdate.allData[v104] = {}
				end
				local v117 = p101.sessionMetrics.timeToUpdate
				v117.numRoots = v117.numRoots + 1
			end
			p101.sessionMetrics.timeToUpdate.sketches[v104]:insert(v105)
			if v_u_11 then
				local v118 = p101.sessionMetrics.timeToUpdate.allData[v104]
				table.insert(v118, v105)
			end
		end
	end
end
function v_u_76.reportRoot(p119, p120, p121) -- name: reportRoot
	-- upvalues: (copy) v_u_12, (copy) v_u_13, (copy) v_u_27, (copy) v_u_75, (copy) v_u_36
	local v122 = p119:getRootName(p121)
	if not p119.rootsMetrics[v122] then
		local v123 = {
			["update_count"] = 0,
			["layout_effects_count"] = nil,
			["render_total_time_ms"] = 0,
			["commit_total_time_ms"] = 0,
			["layout_effects_total_time_ms"] = nil,
			["data_model_update_total_time_ms"] = nil,
			["max_render_time_ms"] = 0,
			["max_commit_time_ms"] = 0,
			["max_update_time_ms"] = 0,
			["max_layout_effects_time_ms"] = nil,
			["max_data_model_update_time_ms"] = nil,
			["passive_effects_count"] = 0,
			["passive_effects_total_time_ms"] = 0,
			["max_passive_effects_time_ms"] = 0,
			["total_time_to_update_ms"] = 0,
			["max_time_to_update_ms"] = 0,
			["layout_effects_count"] = v_u_12 and 0 or nil,
			["layout_effects_total_time_ms"] = v_u_12 and 0 or nil,
			["data_model_update_total_time_ms"] = v_u_12 and v_u_13 and 0 or nil,
			["max_layout_effects_time_ms"] = v_u_12 and 0 or nil,
			["max_data_model_update_time_ms"] = v_u_12 and v_u_13 and 0 or nil
		}
		p119.rootsMetrics[v122] = v123
	end
	local v124 = p119.rootsMetrics[v122]
	if p120.tag == "RootPassiveEffectsTime" then
		v_u_27:LogStat(v_u_75, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["updateType"] = "PassiveEffects",
				["context"] = nil,
				["rootName"] = v122,
				["deviceTier"] = v_u_36,
				["context"] = p119.context
			}
		}, p120.PassiveEffectsMs)
		v124.passive_effects_count = v124.passive_effects_count + 1
		v124.passive_effects_total_time_ms = v124.passive_effects_total_time_ms + p120.PassiveEffectsMs
		if p120.PassiveEffectsMs > v124.max_passive_effects_time_ms then
			v124.max_passive_effects_time_ms = p120.PassiveEffectsMs
			return
		end
	elseif p120.tag == "RootUpdateTime" then
		local v125 = os.clock() * 1000 - p120.StartTimeMs
		v_u_27:LogStat(v_u_75, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["updateType"] = "TimeToComplete",
				["context"] = nil,
				["rootName"] = v122,
				["deviceTier"] = v_u_36,
				["context"] = p119.context
			}
		}, v125)
		v124.total_time_to_update_ms = v124.total_time_to_update_ms + v125
		if v124.max_time_to_update_ms < v125 then
			v124.max_time_to_update_ms = v125
		end
		v_u_27:LogStat(v_u_75, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["updateType"] = "RenderAndCommit",
				["context"] = nil,
				["rootName"] = v122,
				["deviceTier"] = v_u_36,
				["context"] = p119.context
			}
		}, p120.RenderMs + p120.CommitMs)
		v_u_27:LogStat(v_u_75, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["updateType"] = "Commit",
				["context"] = nil,
				["rootName"] = v122,
				["deviceTier"] = v_u_36,
				["context"] = p119.context
			}
		}, p120.CommitMs)
		if v_u_12 then
			if p120.LayoutEffectsMs > 0 then
				v_u_27:LogStat(v_u_75, {
					["customFields"] = {
						["rootName"] = nil,
						["deviceTier"] = nil,
						["updateType"] = "LayoutEffects",
						["context"] = nil,
						["rootName"] = v122,
						["deviceTier"] = v_u_36,
						["context"] = p119.context
					}
				}, p120.LayoutEffectsMs)
			end
			if v_u_13 then
				v_u_27:LogStat(v_u_75, {
					["customFields"] = {
						["rootName"] = nil,
						["deviceTier"] = nil,
						["updateType"] = "DataModelUpdate",
						["context"] = nil,
						["rootName"] = v122,
						["deviceTier"] = v_u_36,
						["context"] = p119.context
					}
				}, p120.CommitMs - p120.LayoutEffectsMs)
			end
		end
		v124.update_count = v124.update_count + 1
		if p120.RenderMs + p120.CommitMs > v124.max_update_time_ms then
			v124.max_update_time_ms = p120.RenderMs + p120.CommitMs
		end
		v124.render_total_time_ms = v124.render_total_time_ms + p120.RenderMs
		v124.commit_total_time_ms = v124.commit_total_time_ms + p120.CommitMs
		if p120.RenderMs > v124.max_render_time_ms then
			v124.max_render_time_ms = p120.RenderMs
		end
		if p120.CommitMs > v124.max_commit_time_ms then
			v124.max_commit_time_ms = p120.CommitMs
		end
		if v_u_12 then
			if p120.LayoutEffectsMs > 0 then
				v124.layout_effects_count = v124.layout_effects_count + 1
				v124.layout_effects_total_time_ms = v124.layout_effects_total_time_ms + p120.LayoutEffectsMs
				if p120.LayoutEffectsMs > v124.max_layout_effects_time_ms then
					v124.max_layout_effects_time_ms = p120.LayoutEffectsMs
				end
			end
			if v_u_13 then
				v124.data_model_update_total_time_ms = v124.data_model_update_total_time_ms + (p120.CommitMs - p120.LayoutEffectsMs)
				if p120.CommitMs - p120.LayoutEffectsMs > v124.max_data_model_update_time_ms then
					v124.max_data_model_update_time_ms = p120.CommitMs - p120.LayoutEffectsMs
				end
			end
		end
	end
end
function v_u_76.getFrameBucket(_, p126) -- name: getFrameBucket
	local v127 = p126 - 2
	local v128 = math.max(0, v127) / 16.666666666666668
	local v129 = math.floor(v128) + 1
	return math.min(4, v129)
end
function v_u_76.processFrame(p130, p131) -- name: processFrame
	-- upvalues: (copy) v_u_16, (copy) v_u_15, (copy) v_u_2, (copy) v_u_11
	local v132 = p130.frameMetrics
	local v133 = p130.reactFrameTimeMs
	if v_u_16 and v_u_15 then
		local v134 = v_u_2:GetTotalScriptPlusExecutionTime()
		if v134 > 0 then
			v132.totalCorescriptTimeMs = v132.totalCorescriptTimeMs + v134
		end
	end
	v132.totalFrameCount = v132.totalFrameCount + 1
	local v135 = p130:getFrameBucket(p131)
	local v136 = v132.allFrameHistogram
	v136[v135] = v136[v135] + 1
	p130.sessionMetrics.timePerFrame.sketch:insert(v133)
	if v_u_11 then
		local v137 = p130.sessionMetrics.timePerFrame.allData
		table.insert(v137, v133)
	end
	if v133 > 0 then
		v132.totalReactTimeMs = v132.totalReactTimeMs + v133
		local v138 = v132.reactFrameHistogram
		v138[v135] = v138[v135] + 1
		p130.sessionMetrics.timePerReactFrame.sketch:insert(v133)
		if v_u_11 then
			local v139 = p130.sessionMetrics.timePerReactFrame.allData
			table.insert(v139, v133)
		end
		v132.reactFrameCount = v132.reactFrameCount + 1
		if v132.maxReactFrameTimeMs < v133 then
			v132.maxReactFrameTimeMs = v133
		end
		local v140 = v135 - p130:getFrameBucket(p131 - v133)
		local v141 = v132.reactDropChangeHistogram
		local v142 = v140 + 1
		v141[v142] = v141[v142] + 1
	end
end
function v_u_76.reportPeriod(p143) -- name: reportPeriod
	-- upvalues: (copy) v_u_27, (copy) v_u_68, (ref) v_u_65, (copy) v_u_69, (copy) v_u_36, (copy) v_u_16, (copy) v_u_15, (copy) v_u_70, (copy) v_u_12, (copy) v_u_13, (copy) v_u_71, (copy) v_u_6, (ref) v_u_72, (copy) v_u_73, (copy) v_u_7, (ref) v_u_74
	local v144 = p143.frameMetrics
	local v145 = os.clock() * 1000 - p143.periodStartMs
	local v146 = {
		["period_length_ms"] = v145,
		["react_total_time_ms"] = v144.totalReactTimeMs,
		["react_total_time_pct"] = v144.totalReactTimeMs / v145,
		["react_frame_count"] = v144.reactFrameCount,
		["total_frame_count"] = v144.totalFrameCount,
		["corescript_total_time_ms"] = v144.totalCorescriptTimeMs,
		["corescript_total_time_pct"] = v144.totalCorescriptTimeMs / v145,
		["average_react_all_frame_ms"] = v144.totalReactTimeMs / v144.totalFrameCount,
		["average_react_only_frame_ms"] = v144.reactFrameCount <= 0 and 0 or v144.totalReactTimeMs / v144.reactFrameCount,
		["max_react_frame_ms"] = v144.maxReactFrameTimeMs,
		["all_frame_drop0"] = v144.allFrameHistogram[1],
		["all_frame_drop1"] = v144.allFrameHistogram[2],
		["all_frame_drop2"] = v144.allFrameHistogram[3],
		["all_frame_drop3"] = v144.allFrameHistogram[4],
		["react_frame_drop0"] = v144.reactFrameHistogram[1],
		["react_frame_drop1"] = v144.reactFrameHistogram[2],
		["react_frame_drop2"] = v144.reactFrameHistogram[3],
		["react_frame_drop3"] = v144.reactFrameHistogram[4],
		["react_drop_change0"] = v144.reactDropChangeHistogram[1],
		["react_drop_change1"] = v144.reactDropChangeHistogram[2],
		["react_drop_change2"] = v144.reactDropChangeHistogram[3],
		["react_drop_change3"] = v144.reactDropChangeHistogram[4]
	}
	v_u_27:LogEvent(v_u_68, {
		["standardizedFields"] = v_u_65,
		["customFields"] = v146
	})
	v_u_27:LogStat(v_u_69, {
		["customFields"] = {
			["stat"] = "ReactTotalTimePct",
			["context"] = nil,
			["deviceTier"] = nil,
			["context"] = p143.context,
			["deviceTier"] = v_u_36
		}
	}, v146.react_total_time_pct)
	if v_u_16 and v_u_15 then
		v_u_27:LogStat(v_u_69, {
			["customFields"] = {
				["stat"] = "TotalCorescriptTimePct",
				["context"] = nil,
				["deviceTier"] = nil,
				["context"] = p143.context,
				["deviceTier"] = v_u_36
			}
		}, v146.corescript_total_time_pct)
	end
	v_u_27:LogStat(v_u_69, {
		["customFields"] = {
			["stat"] = "AverageReactAllFrameMs",
			["context"] = nil,
			["deviceTier"] = nil,
			["context"] = p143.context,
			["deviceTier"] = v_u_36
		}
	}, v146.average_react_all_frame_ms)
	v_u_27:LogStat(v_u_69, {
		["customFields"] = {
			["stat"] = "AverageReactOnlyFrameMs",
			["context"] = nil,
			["deviceTier"] = nil,
			["context"] = p143.context,
			["deviceTier"] = v_u_36
		}
	}, v146.average_react_only_frame_ms)
	v_u_27:LogStat(v_u_69, {
		["customFields"] = {
			["stat"] = "MaxReactFrameMs",
			["context"] = nil,
			["deviceTier"] = nil,
			["context"] = p143.context,
			["deviceTier"] = v_u_36
		}
	}, v146.max_react_frame_ms)
	for v147 = 1, 4 do
		local v148 = v147 - 1
		v_u_27:LogCounter(v_u_70, {
			["customFields"] = {
				["category"] = "AllFrame",
				["bucket"] = nil,
				["context"] = nil,
				["deviceTier"] = nil,
				["bucket"] = v148,
				["context"] = p143.context,
				["deviceTier"] = v_u_36
			}
		}, v144.allFrameHistogram[v147])
		v_u_27:LogCounter(v_u_70, {
			["customFields"] = {
				["category"] = "ReactFrame",
				["bucket"] = nil,
				["context"] = nil,
				["deviceTier"] = nil,
				["bucket"] = v148,
				["context"] = p143.context,
				["deviceTier"] = v_u_36
			}
		}, v144.reactFrameHistogram[v147])
		v_u_27:LogCounter(v_u_70, {
			["customFields"] = {
				["category"] = "ReactDropChange",
				["bucket"] = nil,
				["context"] = nil,
				["deviceTier"] = nil,
				["bucket"] = v148,
				["context"] = p143.context,
				["deviceTier"] = v_u_36
			}
		}, v144.reactDropChangeHistogram[v147])
	end
	for v149, v150 in p143.rootsMetrics do
		v150.root_name = v149
		v150.update_total_time_ms = v150.render_total_time_ms + v150.commit_total_time_ms
		v150.total_time_ms = v150.update_total_time_ms + v150.passive_effects_total_time_ms
		v150.avg_render_time_ms = v150.render_total_time_ms / v150.update_count
		v150.context = p143.context
		v150.total_time_pct = (v150.update_total_time_ms + v150.passive_effects_total_time_ms) / v146.react_total_time_ms
		v150.avg_update_time_ms = v150.update_total_time_ms / v150.update_count
		v150.avg_commit_time_ms = v150.commit_total_time_ms / v150.update_count
		if v_u_12 then
			v150.avg_layout_effects_time_ms = v150.layout_effects_total_time_ms / v150.layout_effects_count
			if v_u_13 then
				v150.avg_data_model_update_time_ms = v150.data_model_update_total_time_ms / v150.update_count
			end
		end
		v150.avg_passive_effects_time_ms = v150.passive_effects_total_time_ms / v150.passive_effects_count
		v150.avg_time_to_update_ms = v150.total_time_to_update_ms / v150.update_count
		v_u_27:LogEvent(v_u_71, {
			["standardizedFields"] = v_u_65,
			["customFields"] = v150
		})
		if not v_u_6 then
			v_u_27:LogStat(v_u_72, {
				["customFields"] = {
					["rootName"] = nil,
					["deviceTier"] = nil,
					["stat"] = "TotalTimePct",
					["context"] = nil,
					["rootName"] = v150.root_name,
					["deviceTier"] = v_u_36,
					["context"] = p143.context
				}
			}, v150.total_time_pct)
		end
		v_u_27:LogCounter(v_u_73, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "RenderAndCommit",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.update_count)
		if v_u_12 then
			v_u_27:LogCounter(v_u_73, {
				["customFields"] = {
					["rootName"] = nil,
					["deviceTier"] = nil,
					["task"] = "LayoutEffects",
					["context"] = nil,
					["rootName"] = v150.root_name,
					["deviceTier"] = v_u_36,
					["context"] = p143.context
				}
			}, v150.layout_effects_count)
		end
		v_u_27:LogCounter(v_u_73, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "PassiveEffects",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.passive_effects_count)
		if v_u_7 then
			continue
		end
		v_u_27:LogStat(v_u_74, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "RenderAndCommit",
				["stat"] = "AvgMs",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.avg_update_time_ms)
		v_u_27:LogStat(v_u_74, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "Commit",
				["stat"] = "AvgMs",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.avg_commit_time_ms)
		if v_u_12 then
			v_u_27:LogStat(v_u_74, {
				["customFields"] = {
					["rootName"] = nil,
					["deviceTier"] = nil,
					["task"] = "LayoutEffects",
					["stat"] = "AvgMs",
					["context"] = nil,
					["rootName"] = v150.root_name,
					["deviceTier"] = v_u_36,
					["context"] = p143.context
				}
			}, v150.avg_layout_effects_time_ms)
			if v_u_13 then
				v_u_27:LogStat(v_u_74, {
					["customFields"] = {
						["rootName"] = nil,
						["deviceTier"] = nil,
						["task"] = "DataModelUpdate",
						["stat"] = "AvgMs",
						["context"] = nil,
						["rootName"] = v150.root_name,
						["deviceTier"] = v_u_36,
						["context"] = p143.context
					}
				}, v150.avg_data_model_update_time_ms)
			end
		end
		v_u_27:LogStat(v_u_74, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "TimeToUpdateMs",
				["stat"] = "AvgMs",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.avg_time_to_update_ms)
		v_u_27:LogStat(v_u_74, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "PassiveEffects",
				["stat"] = "AvgMs",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.avg_passive_effects_time_ms)
		v_u_27:LogStat(v_u_74, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "RenderAndCommit",
				["stat"] = "MaxMs",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.max_update_time_ms)
		v_u_27:LogStat(v_u_74, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "Commit",
				["stat"] = "MaxMs",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.max_commit_time_ms)
		if v_u_12 then
			v_u_27:LogStat(v_u_74, {
				["customFields"] = {
					["rootName"] = nil,
					["deviceTier"] = nil,
					["task"] = "LayoutEffects",
					["stat"] = "MaxMs",
					["context"] = nil,
					["rootName"] = v150.root_name,
					["deviceTier"] = v_u_36,
					["context"] = p143.context
				}
			}, v150.max_layout_effects_time_ms)
			if v_u_13 then
				v_u_27:LogStat(v_u_74, {
					["customFields"] = {
						["rootName"] = nil,
						["deviceTier"] = nil,
						["task"] = "DataModelUpdate",
						["stat"] = "MaxMs",
						["context"] = nil,
						["rootName"] = v150.root_name,
						["deviceTier"] = v_u_36,
						["context"] = p143.context
					}
				}, v150.max_data_model_update_time_ms)
			end
		end
		v_u_27:LogStat(v_u_74, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "TimeToUpdateMs",
				["stat"] = "MaxMs",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.max_time_to_update_ms)
		v_u_27:LogStat(v_u_74, {
			["customFields"] = {
				["rootName"] = nil,
				["deviceTier"] = nil,
				["task"] = "PassiveEffects",
				["stat"] = "MaxMs",
				["context"] = nil,
				["rootName"] = v150.root_name,
				["deviceTier"] = v_u_36,
				["context"] = p143.context
			}
		}, v150.max_passive_effects_time_ms)
	end
end
function generatePercentilesFromSingleSketch(p151) -- name: generatePercentilesFromSingleSketch
	-- upvalues: (copy) v_u_31
	local v152 = "{"
	for v153, v154 in v_u_31 do
		v152 = (v152 .. "\"p" .. v154 .. "\":") .. p151:getPercentile(tonumber(v154) or 0)
		if v153 >= #v_u_31 then
			continue
		end
		v152 = v152 .. ","
	end
	return v152 .. "}"
end
function generatePercentilesFromSketches(p155, p156) -- name: generatePercentilesFromSketches
	-- upvalues: (copy) v_u_31
	local v157 = "{"
	for v158, v159 in v_u_31 do
		local v160 = v157 .. "\"p" .. v159 .. "\":{"
		local v161 = tonumber(v159) or 0
		local v162 = 0
		for v163, v164 in p155 do
			v162 = v162 + 1
			v160 = v160 .. "\"" .. v163 .. "\":" .. v164:getPercentile(v161)
			if v162 >= p156 then
				continue
			end
			v160 = v160 .. ","
		end
		v157 = v160 .. (v158 < #v_u_31 and "}," or "}")
	end
	return v157 .. "}"
end
function v_u_76.reportPercentError(p165, p166, p167, p168, p169) -- name: reportPercentError
	-- upvalues: (copy) v_u_31, (copy) v_u_27, (ref) v_u_67, (ref) v_u_65
	table.sort(p166)
	local v170 = #p166
	if v170 >= 1 then
		for _, v171 in v_u_31 do
			local v172 = (tonumber(v171) or 0) / 100 * v170
			local v173 = p166[math.ceil(v172)]
			local v174
			if p167.sketches then
				v174 = p167.sketches[p169]:getPercentile(v171)
			else
				v174 = p167.sketch:getPercentile(v171)
			end
			local v175 = 0
			if v173 == 0 and v174 ~= 0 then
				continue
			end
			if v173 ~= 0 then
				v175 = (v174 - v173) * 100 / v173
			end
			v_u_27:LogEvent(v_u_67, {
				["standardizedFields"] = v_u_65,
				["customFields"] = {
					["rootName"] = p169,
					["percentile"] = v171,
					["metric"] = p168,
					["numDatapoints"] = v170,
					["context"] = p165.context,
					["approxError"] = v175
				}
			})
		end
	end
end
function v_u_76.reportSession(p176) -- name: reportSession
	-- upvalues: (copy) v_u_11, (copy) v_u_27, (copy) v_u_66, (ref) v_u_65
	if p176.started then
		local v177 = {
			["reactUpdateTime"] = generatePercentilesFromSketches(p176.sessionMetrics.updateTime.sketches, p176.sessionMetrics.updateTime.numRoots),
			["reactCommitTime"] = generatePercentilesFromSketches(p176.sessionMetrics.commitTime.sketches, p176.sessionMetrics.commitTime.numRoots),
			["reactTimeToUpdate"] = generatePercentilesFromSketches(p176.sessionMetrics.timeToUpdate.sketches, p176.sessionMetrics.timeToUpdate.numRoots),
			["timePerFrame"] = generatePercentilesFromSingleSketch(p176.sessionMetrics.timePerFrame.sketch),
			["timePerReactFrame"] = generatePercentilesFromSingleSketch(p176.sessionMetrics.timePerReactFrame.sketch)
		}
		if v_u_11 then
			for v178, v179 in p176.sessionMetrics do
				if v179.sketches then
					for v180, v181 in v179.allData do
						p176:reportPercentError(v181, v179, v178, v180)
					end
				else
					p176:reportPercentError(v179.allData, v179, v178, "all")
				end
			end
		end
		v_u_27:LogEvent(v_u_66, {
			["standardizedFields"] = v_u_65,
			["customFields"] = v177
		})
	end
end
return v_u_76.new(v8)