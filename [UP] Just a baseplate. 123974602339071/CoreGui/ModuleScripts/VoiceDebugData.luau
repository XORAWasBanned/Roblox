-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.VoiceDebugData
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.Parent.CircularBuffer)
local v_u_3 = require(script.Parent.Parent.Parent.Signal)
local v_u_4 = require(script.Parent.VoiceDebugFieldMeta)
local v5 = require(script.Parent.VoiceDebugSource)
local v_u_6 = game:GetService("VoiceChatService")
local v7 = settings()
local v_u_8 = tonumber(v7:GetFVariable("NewDevConsoleMaxGraphCount")) or 60
local v_u_9 = require(v1.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local v_u_10 = v5.InExperience
local v_u_11 = v5.Party
local v_u_12 = require(script.Parent.GetFFlagVoiceDebugConsoleV2)
local function v_u_25(p13, p14, p15) -- name: computeSubscriptionBitrates
	local v16 = {}
	for _, v17 in p13 do
		local v18 = v17.audioSsrc
		if type(v18) ~= "number" or (v18 ~= v18 or v18 % 1 ~= 0) then
			continue
		end
		v16[v18] = true
		local v19 = p14[v18]
		local v20
		if v19 == nil then
			v20 = false
		else
			v20 = v19.userId == v17.userId
		end
		local v21 = v17.incomingBytes
		local v22 = v20 and v19.bytes or nil
		local v23
		if type(v21) == "number" and (type(v22) == "number" and (type(p15) == "number" and p15 > 0)) and v21 >= v22 then
			v23 = (v21 - v22) * 8 / p15 / 1000
		else
			v23 = nil
		end
		v17.incomingBitrateKbps = v23
		p14[v18] = {
			["userId"] = v17.userId,
			["bytes"] = v17.incomingBytes
		}
	end
	for v24 in p14 do
		if v16[v24] then
			continue
		end
		p14[v24] = nil
	end
end
local function v_u_34(p26, p27, p28) -- name: decorateOperationEntries
	local v29 = table.create(#p26)
	for v30, v31 in p26 do
		local v32
		if v31.timestampSeconds then
			local v33 = p28 + (v31.timestampSeconds - p27)
			v32 = os.date("%H:%M:%S", v33)
		else
			v32 = nil
		end
		v29[v30] = {
			["name"] = v31.name,
			["operationType"] = v31.operationType,
			["timestampSeconds"] = v31.timestampSeconds,
			["timestampText"] = v32
		}
	end
	return v29
end
local function v_u_38(p35) -- name: decorateRemoteOperationsPayload
	-- upvalues: (copy) v_u_34
	local v36 = os.time()
	local v37 = p35.nativeNowSeconds or 0
	return {
		["sent"] = v_u_34(p35.sent or {}, v37, v36),
		["received"] = v_u_34(p35.received or {}, v37, v36),
		["operations"] = v_u_34(p35.operations or {}, v37, v36),
		["sentCaptureEnabled"] = p35.sentCaptureEnabled == true,
		["receivedCaptureEnabled"] = p35.receivedCaptureEnabled == true,
		["opQueueCaptureEnabled"] = p35.opQueueCaptureEnabled == true
	}
end
local v_u_39 = {}
v_u_39.__index = v_u_39
function v_u_39.new() -- name: new
	-- upvalues: (copy) v_u_39, (copy) v_u_3, (copy) v_u_10
	local v40 = {}
	local v41 = v_u_39
	setmetatable(v40, v41)
	v40._statsUpdated = v_u_3.new()
	v40._statsData = {}
	v40._series = {}
	v40._connectivityData = {}
	v40._subscriptionsData = {}
	v40._remoteOperationsData = {}
	v40._prevSubscriptionBytesBySsrc = {}
	v40._isRunning = false
	v40._source = v_u_10
	v40._partyStatsData = {}
	v40._partySeries = {}
	v40._partyConnectivityData = {}
	v40._partySubscriptionsData = {}
	v40._partyRemoteOperationsData = {}
	v40._isPartyActive = false
	v40._partyPollTask = nil
	v40._partyPollGeneration = 0
	v40._prevPartyJitterBufferDelaySeconds = nil
	v40._prevPartyJitterBufferEmittedCount = nil
	v40._prevPartyIncomingBytes = nil
	v40._prevPartyOutgoingBytes = nil
	v40._prevPartySubscriptionBytesBySsrc = {}
	v40._prevBytesClock = nil
	v40._prevIncomingBytes = nil
	v40._prevOutgoingBytes = nil
	v40._prevIncomingPackets = nil
	v40._prevIncomingPacketsLost = nil
	v40._prevJitterBufferDelaySeconds = nil
	v40._prevJitterBufferEmittedCount = nil
	return v40
end
function v_u_39.Signal(p42) -- name: Signal
	return p42._statsUpdated
end
function v_u_39.getCurrentData(p43) -- name: getCurrentData
	-- upvalues: (copy) v_u_11
	if p43._source == v_u_11 then
		return p43._partyStatsData
	else
		return p43._statsData
	end
end
function v_u_39.getSeries(p44) -- name: getSeries
	-- upvalues: (copy) v_u_11
	if p44._source == v_u_11 then
		return p44._partySeries
	else
		return p44._series
	end
end
function v_u_39.getSeriesSnapshot(p45) -- name: getSeriesSnapshot
	local v46 = {}
	for v47, v48 in p45:getSeries() do
		v46[v47] = {
			["max"] = v48.max,
			["min"] = v48.min,
			["dataSet"] = v48.dataSet:clone()
		}
	end
	return v46
end
function v_u_39.isRunning(p49) -- name: isRunning
	return p49._isRunning
end
function v_u_39.getConnectivity(p50) -- name: getConnectivity
	-- upvalues: (copy) v_u_11
	if p50._source == v_u_11 then
		return p50._partyConnectivityData
	else
		return p50._connectivityData
	end
end
function v_u_39.getSource(p51) -- name: getSource
	return p51._source
end
function v_u_39.isPartyVoiceActive(p52) -- name: isPartyVoiceActive
	return p52._isPartyActive
end
function v_u_39.setSource(p53, p54) -- name: setSource
	if p53._source ~= p54 then
		p53._source = p54
		p53._statsUpdated:Fire(p53:getCurrentData())
	end
end
function v_u_39.getSubscriptions(p55) -- name: getSubscriptions
	-- upvalues: (copy) v_u_11
	return p55._source == v_u_11 and (p55._partySubscriptionsData.subscriptions or {}) or (p55._subscriptionsData.subscriptions or {})
end
function v_u_39.getRemoteOperations(p56) -- name: getRemoteOperations
	-- upvalues: (copy) v_u_11
	if p56._source == v_u_11 then
		return p56._partyRemoteOperationsData
	else
		return p56._remoteOperationsData
	end
end
function v_u_39._updateSeriesValueInto(_, p57, p58, p59, p60) -- name: _updateSeriesValueInto
	-- upvalues: (copy) v_u_2, (copy) v_u_8
	if p57[p58] then
		local v61 = p57[p58]
		local v62 = v61.max
		local v63 = v61.min
		local v64 = v61.dataSet:push_back({
			["value"] = p59,
			["time"] = p60
		})
		local v65, v66
		if v64 and (v62 == v64.value or v63 == v64.value) then
			local v67 = v61.dataSet:iterator()
			local v68 = v67:next()
			if v68 then
				v65 = v68.value
			else
				v65 = v68
			end
			if v68 then
				v66 = v68.value
			else
				v66 = v68
			end
			while v68 do
				v65 = v68.value < v65 and v65 and v65 or v68.value
				v66 = v66 < v68.value and v66 and v66 or v68.value
				v68 = v67:next()
			end
			if v62 ~= v64.value then
				v65 = v62
			end
			if v63 ~= v64.value then
				v66 = v63
			end
		else
			v66 = v63
			v65 = v62
		end
		v61.max = v65 < p59 and p59 and p59 or v65
		if v66 < p59 then
			p59 = v66 or p59
		end
		v61.min = p59
	else
		local v69 = v_u_2.new(v_u_8)
		v69:push_back({
			["value"] = p59,
			["time"] = p60
		})
		p57[p58] = {
			["max"] = p59,
			["min"] = p59,
			["dataSet"] = v69
		}
	end
end
function v_u_39._updateSeriesValue(p70, p71, p72, p73) -- name: _updateSeriesValue
	p70:_updateSeriesValueInto(p70._series, p71, p72, p73)
end
function v_u_39.start(p_u_74) -- name: start
	-- upvalues: (copy) v_u_6, (copy) v_u_12, (copy) v_u_38, (copy) v_u_25, (copy) v_u_4, (copy) v_u_10
	if v_u_6 and not p_u_74._statsListenerConnection then
		p_u_74._statsListenerConnection = v_u_6.VoiceChatStatsCollected:Connect(function()
			-- upvalues: (copy) p_u_74, (ref) v_u_6, (ref) v_u_12, (ref) v_u_38, (ref) v_u_25, (ref) v_u_4, (ref) v_u_10
			p_u_74._statsData = v_u_6:lastVoiceChatStats()
			p_u_74._connectivityData = v_u_6:lastVoiceChatConnectivity()
			p_u_74._subscriptionsData = v_u_6:lastVoiceChatSubscriptions() or {}
			local v75 = v_u_6:lastVoiceChatRemoteOperations() or {}
			local v76 = os.time()
			if v_u_12() then
				if v75.nativeNowSeconds then
					p_u_74._remoteOperationsData = v_u_38(v75)
				else
					p_u_74._remoteOperationsData = {}
				end
				local v77 = os.clock()
				local v78
				if p_u_74._prevBytesClock then
					v78 = v77 - p_u_74._prevBytesClock or nil
				else
					v78 = nil
				end
				local v79 = p_u_74._statsData
				local v80 = p_u_74._statsData.incomingBytes
				local v81 = p_u_74._prevIncomingBytes
				local v82
				if type(v80) == "number" and (type(v81) == "number" and (type(v78) == "number" and v78 > 0)) and v80 >= v81 then
					v82 = (v80 - v81) * 8 / v78 / 1000
				else
					v82 = nil
				end
				v79.incomingBitrateKbps = v82
				local v83 = p_u_74._statsData
				local v84 = p_u_74._statsData.outgoingBytes
				local v85 = p_u_74._prevOutgoingBytes
				local v86
				if type(v84) == "number" and (type(v85) == "number" and (type(v78) == "number" and v78 > 0)) and v84 >= v85 then
					v86 = (v84 - v85) * 8 / v78 / 1000
				else
					v86 = nil
				end
				v83.outgoingBitrateKbps = v86
				p_u_74._prevIncomingBytes = p_u_74._statsData.incomingBytes
				p_u_74._prevOutgoingBytes = p_u_74._statsData.outgoingBytes
				p_u_74._prevBytesClock = v77
				local v87 = p_u_74._statsData
				local v88 = p_u_74._connectivityData.sdpPublishOffer
				local v89
				if v88 and v88 ~= "" then
					local _, v90, v91, v92 = string.match(v88, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
					if v90 and (v91 and v92) then
						v89 = string.format("%s/%s/%s", v90, v91, v92)
					else
						v89 = nil
					end
				else
					v89 = nil
				end
				v87.outgoingCodec = v89
				local v93 = p_u_74._statsData
				local v94 = p_u_74._statsData.incomingPackets
				local v95 = p_u_74._prevIncomingPackets
				local v96
				if type(v94) == "number" and (type(v95) == "number" and v94 >= v95) then
					v96 = v94 - v95
				else
					v96 = nil
				end
				local v97 = p_u_74._statsData.incomingPacketsLost
				local v98 = p_u_74._prevIncomingPacketsLost
				local v99
				if type(v97) == "number" and (type(v98) == "number" and v97 >= v98) then
					v99 = v97 - v98
				else
					v99 = nil
				end
				local v100
				if type(v96) == "number" and type(v99) == "number" then
					local v101 = v96 + v99
					if v101 <= 0 then
						v100 = nil
					else
						v100 = v99 / v101 * 100
					end
				else
					v100 = nil
				end
				v93.incomingLossPercent = v100
				p_u_74._prevIncomingPackets = p_u_74._statsData.incomingPackets
				p_u_74._prevIncomingPacketsLost = p_u_74._statsData.incomingPacketsLost
				local v102 = p_u_74._statsData.jitterBufferDelayMs
				local v103 = p_u_74._statsData.jitterBufferEmittedCount
				local v104 = p_u_74._statsData
				local v105 = p_u_74._prevJitterBufferDelaySeconds
				local v106 = p_u_74._prevJitterBufferEmittedCount
				local v107
				if type(v102) == "number" and (type(v105) == "number" and (type(v103) == "number" and type(v106) == "number")) then
					local v108 = v103 - v106
					local v109 = v102 - v105
					if v108 <= 0 or v109 < 0 then
						v107 = nil
					else
						v107 = v109 * 1000 / v108
					end
				else
					v107 = nil
				end
				v104.jitterBufferDelayMs = v107
				p_u_74._prevJitterBufferDelaySeconds = v102
				p_u_74._prevJitterBufferEmittedCount = v103
				v_u_25(p_u_74._subscriptionsData.subscriptions or {}, p_u_74._prevSubscriptionBytesBySsrc, v78)
			end
			for v110, v111 in p_u_74._statsData do
				local v112 = v_u_4[v110]
				if not v112 or (not v112.plottable or type(v111) ~= "number") then
					continue
				end
				p_u_74:_updateSeriesValue(v110, v111, v76)
			end
			if p_u_74._source == v_u_10 then
				p_u_74._statsUpdated:Fire(p_u_74._statsData)
			end
		end)
		p_u_74._isRunning = true
		if v_u_12() then
			p_u_74:_startPartyPipeline()
		end
	end
end
function v_u_39._correctPartyJitterBufferDelay(p113) -- name: _correctPartyJitterBufferDelay
	local v114 = p113._partyStatsData.jitterBufferDelayMs
	local v115 = p113._partyStatsData.jitterBufferEmittedCount
	local v116 = p113._partyStatsData
	local v117 = p113._prevPartyJitterBufferDelaySeconds
	local v118 = p113._prevPartyJitterBufferEmittedCount
	local v119
	if type(v114) == "number" and (type(v117) == "number" and (type(v115) == "number" and type(v118) == "number")) then
		local v120 = v115 - v118
		local v121 = v114 - v117
		if v120 <= 0 or v121 < 0 then
			v119 = nil
		else
			v119 = v121 * 1000 / v120
		end
	else
		v119 = nil
	end
	v116.jitterBufferDelayMs = v119
	p113._prevPartyJitterBufferDelaySeconds = v114
	p113._prevPartyJitterBufferEmittedCount = v115
end
function v_u_39._correctPartyAggregateStats(p122, p123) -- name: _correctPartyAggregateStats
	-- upvalues: (copy) v_u_12
	if v_u_12() then
		local v124 = p122._partyStatsData
		local v125 = p122._partyStatsData.incomingBytes
		local v126 = p122._prevPartyIncomingBytes
		local v127
		if type(v125) == "number" and (type(v126) == "number" and (type(p123) == "number" and p123 > 0)) and v125 >= v126 then
			v127 = (v125 - v126) * 8 / p123 / 1000
		else
			v127 = nil
		end
		v124.incomingBitrateKbps = v127
		local v128 = p122._partyStatsData
		local v129 = p122._partyStatsData.outgoingBytes
		local v130 = p122._prevPartyOutgoingBytes
		local v131
		if type(v129) == "number" and (type(v130) == "number" and (type(p123) == "number" and p123 > 0)) and v129 >= v130 then
			v131 = (v129 - v130) * 8 / p123 / 1000
		else
			v131 = nil
		end
		v128.outgoingBitrateKbps = v131
		p122._prevPartyIncomingBytes = p122._partyStatsData.incomingBytes
		p122._prevPartyOutgoingBytes = p122._partyStatsData.outgoingBytes
		local v132 = p122._partyStatsData
		local v133 = p122._partyConnectivityData.sdpPublishOffer
		local v134
		if v133 and v133 ~= "" then
			local _, v135, v136, v137 = string.match(v133, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
			if v135 and (v136 and v137) then
				v134 = string.format("%s/%s/%s", v135, v136, v137)
			else
				v134 = nil
			end
		else
			v134 = nil
		end
		v132.outgoingCodec = v134
		local v138 = p122._partyStatsData
		local v139 = p122._partyStatsData.incomingPackets
		local v140 = p122._prevPartyIncomingPackets
		local v141
		if type(v139) == "number" and (type(v140) == "number" and v139 >= v140) then
			v141 = v139 - v140
		else
			v141 = nil
		end
		local v142 = p122._partyStatsData.incomingPacketsLost
		local v143 = p122._prevPartyIncomingPacketsLost
		local v144
		if type(v142) == "number" and (type(v143) == "number" and v142 >= v143) then
			v144 = v142 - v143
		else
			v144 = nil
		end
		local v145
		if type(v141) == "number" and type(v144) == "number" then
			local v146 = v141 + v144
			if v146 <= 0 then
				v145 = nil
			else
				v145 = v144 / v146 * 100
			end
		else
			v145 = nil
		end
		v138.incomingLossPercent = v145
		p122._prevPartyIncomingPackets = p122._partyStatsData.incomingPackets
		p122._prevPartyIncomingPacketsLost = p122._partyStatsData.incomingPacketsLost
	end
end
function v_u_39._startPartyPipeline(p_u_147) -- name: _startPartyPipeline
	-- upvalues: (copy) v_u_9, (copy) v_u_38, (copy) v_u_25, (copy) v_u_4, (copy) v_u_11
	if not p_u_147._partyPollTask then
		p_u_147._partyPollGeneration = p_u_147._partyPollGeneration + 1
		local v_u_148 = p_u_147._partyPollGeneration
		p_u_147._partyPollTask = task.spawn(function()
			-- upvalues: (copy) p_u_147, (copy) v_u_148, (ref) v_u_9, (ref) v_u_38, (ref) v_u_25, (ref) v_u_4, (ref) v_u_11
			local v149 = nil
			while p_u_147._isRunning and v_u_148 == p_u_147._partyPollGeneration do
				local v150, v151
				if game:GetEngineFeature("CEVGetBackgroundState") then
					v150, v151 = v_u_9:getIsBackgroundDMActive():await()
				else
					v150 = false
					v151 = false
				end
				if not p_u_147._isRunning or v_u_148 ~= p_u_147._partyPollGeneration then
					break
				end
				local v152 = p_u_147
				if v150 then
					v150 = v151 == true
				end
				v152._isPartyActive = v150
				local v153 = os.clock()
				local v154 = p_u_147._isPartyActive
				if v154 then
					v154 = not v149 or v153 - v149 >= 30
				end
				local v155
				if v154 then
					local v156, v157 = v_u_9:getPartyVoiceDebugStats():await()
					if not p_u_147._isRunning or v_u_148 ~= p_u_147._partyPollGeneration then
						break
					end
					if v156 and v157 then
						v155 = os.clock()
						local v158
						if v149 then
							v158 = v155 - v149 or nil
						else
							v158 = nil
						end
						p_u_147._partyStatsData = v157.stats or {}
						p_u_147._partyConnectivityData = v157.connectivity or {}
						p_u_147._partySubscriptionsData = v157.subscriptions or {}
						local v159 = v157.remoteOperations or {}
						p_u_147._partyRemoteOperationsData = v159.nativeNowSeconds and v_u_38(v159) or {}
						p_u_147:_correctPartyJitterBufferDelay()
						p_u_147:_correctPartyAggregateStats(v158)
						v_u_25(p_u_147._partySubscriptionsData.subscriptions or {}, p_u_147._prevPartySubscriptionBytesBySsrc, v158)
						local v160 = os.time()
						for v161, v162 in p_u_147._partyStatsData do
							local v163 = v_u_4[v161]
							if not v163 or (not v163.plottable or type(v162) ~= "number") then
								continue
							end
							p_u_147:_updateSeriesValueInto(p_u_147._partySeries, v161, v162, v160)
						end
						if p_u_147._source == v_u_11 then
							p_u_147._statsUpdated:Fire(p_u_147._partyStatsData)
						end
					else
						v155 = v149
					end
				else
					v155 = v149
				end
				task.wait(1)
				v149 = v155
			end
		end)
	end
end
function v_u_39.stop(p164) -- name: stop
	p164._isRunning = false
	if p164._statsListenerConnection then
		p164._statsListenerConnection:Disconnect()
		p164._statsListenerConnection = nil
	end
	p164._partyPollTask = nil
	p164._partyPollGeneration = p164._partyPollGeneration + 1
	p164._prevBytesClock = nil
	p164._prevIncomingBytes = nil
	p164._prevOutgoingBytes = nil
	p164._prevIncomingPackets = nil
	p164._prevIncomingPacketsLost = nil
	p164._prevJitterBufferDelaySeconds = nil
	p164._prevJitterBufferEmittedCount = nil
	p164._prevSubscriptionBytesBySsrc = {}
	p164._prevPartyIncomingBytes = nil
	p164._prevPartyOutgoingBytes = nil
	p164._prevPartyIncomingPackets = nil
	p164._prevPartyIncomingPacketsLost = nil
	p164._prevPartyJitterBufferDelaySeconds = nil
	p164._prevPartyJitterBufferEmittedCount = nil
	p164._prevPartySubscriptionBytesBySsrc = {}
end
function v_u_39._parseCodecFromSdp(p165) -- name: parseCodecFromSdp
	if p165 and p165 ~= "" then
		local _, v166, v167, v168 = string.match(p165, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
		if v166 and (v167 and v168) then
			return string.format("%s/%s/%s", v166, v167, v168)
		else
			return nil
		end
	else
		return nil
	end
end
function v_u_39._computeBitrateKbps(p169, p170, p171) -- name: computeBitrateKbps
	if type(p169) == "number" and (type(p170) == "number" and (type(p171) == "number" and p171 > 0)) then
		if p169 < p170 then
			return nil
		else
			return (p169 - p170) * 8 / p171 / 1000
		end
	else
		return nil
	end
end
function v_u_39._computeLossPercent(p172, p173) -- name: computeLossPercent
	if type(p172) == "number" and type(p173) == "number" then
		local v174 = p172 + p173
		if v174 <= 0 then
			return nil
		else
			return p173 / v174 * 100
		end
	else
		return nil
	end
end
function v_u_39._deltaSince(p175, p176) -- name: deltaSince
	if type(p175) == "number" and (type(p176) == "number" and p175 >= p176) then
		return p175 - p176
	else
		return nil
	end
end
function v_u_39._computeJitterBufferDelayMs(p177, p178, p179, p180) -- name: computeJitterBufferDelayMs
	if type(p177) == "number" and (type(p178) == "number" and (type(p179) == "number" and type(p180) == "number")) then
		local v181 = p179 - p180
		local v182 = p177 - p178
		if v181 <= 0 or v182 < 0 then
			return nil
		else
			return v182 * 1000 / v181
		end
	else
		return nil
	end
end
v_u_39._computeSubscriptionBitrates = v_u_25
function v_u_39._nativeSecondsToWallClockSeconds(p183, p184, p185) -- name: nativeSecondsToWallClockSeconds
	return p185 + (p183 - p184)
end
function v_u_39._formatWallClockTime(p186) -- name: formatWallClockTime
	return os.date("%H:%M:%S", p186)
end
v_u_39._decorateOperationEntries = v_u_34
v_u_39._decorateRemoteOperationsPayload = v_u_38
return v_u_39