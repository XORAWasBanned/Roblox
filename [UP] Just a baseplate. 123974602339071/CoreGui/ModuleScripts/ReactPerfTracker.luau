-- Path: CoreGui.RobloxGui.Modules.Common.ReactPerfTracker
local v1 = game:DefineFastInt("ReactPerfTrackerKibana", 0)
function applicationId() -- name: applicationId
	local v2 = game:GetService("AppStorageService")
	if not v2 then
		return nil
	end
	local v3 = v2:GetItem("AppInstallationId")
	local v4 = typeof(v3)
	if v4 == "number" then
		return tonumber(v3) or nil
	end
	if v4 ~= "string" then
		return nil
	end
	if string.len(v3) <= 0 then
		return nil
	end
	local v5 = tostring(1000)
	local v6 = -string.len(v5)
	local v7 = string.sub(v3, v6)
	return tonumber(v7)
end
if v1 <= 0 then
	return nil
end
local v8 = math.random(0, 1000)
local v9 = applicationId()
if v9 ~= nil then
	v8 = (v9 + 327) % 1000
end
if (v8 >= v1 and 0 or v1) <= 0 then
	return nil
end
local v10 = game:GetService("CorePackages")
local v_u_11 = require(v10.Workspace.Packages.LoggingProtocol)
local v_u_12 = require(v10.Packages.ReactRoblox)
local v_u_13 = game:GetService("RbxAnalyticsService")
local v_u_14 = {
	["eventName"] = "ReactCoreScriptPerformance",
	["backends"] = nil,
	["throttlingPercentage"] = 10000,
	["lastUpdated"] = nil,
	["description"] = "Reporting the time utilization of React in CoreScripts",
	["links"] = "",
	["backends"] = { v_u_11.TelemetryBackends.Points },
	["lastUpdated"] = { 24, 10, 4 }
}
local v_u_15 = {}
v_u_15.__index = v_u_15
function v_u_15.new() -- name: new
	-- upvalues: (copy) v_u_11, (copy) v_u_15
	local v16 = {
		["totalTime"] = 0,
		["componentTotalTime"] = {},
		["componentMaxTime"] = {},
		["componentCount"] = {},
		["sampleCount"] = 0,
		["loggingProtocol"] = v_u_11.default,
		["outgoingEvents"] = {},
		["nextSendTime"] = 0,
		["previousSendTime"] = 0
	}
	local v17 = v_u_15
	return setmetatable(v16, v17)
end
function v_u_15.start(p_u_18) -- name: start
	-- upvalues: (copy) v_u_14, (copy) v_u_12
	p_u_18.eventSender = coroutine.create(function()
		-- upvalues: (copy) p_u_18, (ref) v_u_14
		while true do
			while true do
				local v19 = table.remove(p_u_18.outgoingEvents, 1)
				if not v19 then
					break
				end
				wait()
				p_u_18.loggingProtocol:logRobloxTelemetryEvent(v_u_14, {}, v19)
			end
			coroutine.yield()
		end
	end)
	v_u_12.robloxReactProfiling.startTimerSampling(function(p20)
		-- upvalues: (copy) p_u_18
		local v21 = p20.id
		local v22 = (p20.endTime - p20.startTime) * 1000
		if not p_u_18.componentTotalTime[v21] then
			p_u_18.componentTotalTime[v21] = 0
			p_u_18.componentMaxTime[v21] = 0
			p_u_18.componentCount[v21] = 0
		end
		local v23 = p_u_18.componentTotalTime
		v23[v21] = v23[v21] + v22
		local v24 = p_u_18.componentCount
		v24[v21] = v24[v21] + 1
		local v25 = p_u_18
		v25.sampleCount = v25.sampleCount + 1
		local v26 = p_u_18
		v26.totalTime = v26.totalTime + v22
		local v27 = p_u_18.componentMaxTime
		local v28 = p_u_18.componentMaxTime[v21]
		v27[v21] = math.max(v28, v22)
		if p20.startTime >= p_u_18.nextSendTime then
			if p_u_18.nextSendTime > 0 then
				p_u_18:sendEvents()
			end
			p_u_18.previousSendTime = p_u_18.nextSendTime
			if p_u_18.previousSendTime == 0 then
				p_u_18.previousSendTime = p20.startTime
			end
			p_u_18.nextSendTime = p20.startTime + 30
		end
	end)
end
function v_u_15.genEvents(p29) -- name: genEvents
	-- upvalues: (copy) v_u_13
	local v30 = 0
	for v31, _ in p29.componentCount do
		v30 = v30 + 1
		local v32 = p29.outgoingEvents
		local v33 = {
			["sessionid"] = not v_u_13 and "" or v_u_13:GetSessionId(),
			["component"] = v31,
			["time_ms_max"] = p29.componentMaxTime[v31],
			["time_ms_avg"] = p29.componentTotalTime[v31] / p29.componentCount[v31],
			["total_time_ms"] = p29.componentTotalTime[v31],
			["total_time_pct"] = p29.componentTotalTime[v31] / p29.totalTime,
			["count"] = p29.componentCount[v31],
			["count_pct"] = p29.componentCount[v31] / p29.sampleCount
		}
		table.insert(v32, v33)
	end
	local v34 = p29.outgoingEvents
	local v35 = {
		["summary_sessionid"] = not v_u_13 and "" or v_u_13:GetSessionId(),
		["summary_total_time_ms"] = p29.totalTime,
		["summary_sample_time_s"] = p29.nextSendTime - p29.previousSendTime,
		["summary_num_components"] = v30,
		["summary_sample_count"] = p29.sampleCount
	}
	table.insert(v34, 1, v35)
end
function v_u_15.sendEvents(p36) -- name: sendEvents
	if p36.sampleCount ~= 0 then
		p36:genEvents()
		p36:resetCounts()
		coroutine.resume(p36.eventSender)
	end
end
function v_u_15.resetCounts(p37) -- name: resetCounts
	p37.componentTotalTime = {}
	p37.componentMaxTime = {}
	p37.componentCount = {}
	p37.sampleCount = 0
	p37.totalTime = 0
end
return v_u_15