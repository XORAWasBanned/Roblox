-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.RequestOrchestrator.RequestOrchestratorData
local v_u_94 = {
	["new"] = function() -- name: new
		return {
			["now"] = tick(),
			["allTypes"] = {},
			["typeSeen"] = {},
			["batchesByType"] = {},
			["queues"] = {},
			["observedMaxByType"] = {},
			["lastBatchSizeByType"] = {},
			["cacheByType"] = {}
		}
	end,
	["observeType"] = function(p1, p2) -- name: observeType
		if p1.typeSeen[p2] then
			return nil
		end
		p1.typeSeen[p2] = true
		local v3 = p1.allTypes
		table.insert(v3, p2)
		return #p1.allTypes
	end,
	["observeTypes"] = function(p4, p5) -- name: observeTypes
		-- upvalues: (copy) v_u_94
		local v6 = {}
		for _, v7 in ipairs(p5) do
			local v8 = v_u_94.observeType(p4, v7)
			if not v8 then
				continue
			end
			table.insert(v6, v8)
		end
		return v6
	end,
	["batchesFor"] = function(p9, p10) -- name: batchesFor
		if not p9.batchesByType[p10] then
			p9.batchesByType[p10] = {}
		end
		return p9.batchesByType[p10]
	end,
	["registerBatch"] = function(p11, p12, p13) -- name: registerBatch
		-- upvalues: (copy) v_u_94
		local v14 = v_u_94.batchesFor(p11, p12)
		local v15 = p13.batchId
		v14[tostring(v15)] = {
			["state"] = "pending",
			["sentTime"] = nil,
			["settleTime"] = nil,
			["operationCount"] = 0,
			["attempts"] = nil,
			["attempts"] = {}
		}
	end,
	["openSendAttempt"] = function(p16, p17, p18) -- name: openSendAttempt
		-- upvalues: (copy) v_u_94
		local v19 = v_u_94.batchesFor(p16, p17)
		local v20 = p18.batchId
		local v21 = tostring(v20)
		local v22 = v19[v21]
		if not v22 then
			v22 = {
				["attempts"] = {}
			}
			v19[v21] = v22
		end
		v22.state = "inflight"
		local v23 = tick()
		v22.attempts = v22.attempts or {}
		local v24 = v22.attempts
		table.insert(v24, {
			["start"] = nil,
			["finish"] = nil,
			["start"] = v23
		})
		v22.sentTime = v22.sentTime or v23
		v22.operationCount = p18.operationCount or 0
	end,
	["settleBatch"] = function(p25, p26, p27) -- name: settleBatch
		local v28 = p25.batchesByType[p26]
		if v28 then
			local v29 = p27.batchId
			local v30 = v28[tostring(v29)]
			if v30 then
				local v31 = v30.attempts
				if v31 then
					v31 = v31[#v31]
				end
				if v31 and not v31.finish then
					v31.finish = tick()
				end
				v30.settleTime = tick()
				v30.state = p27.success and "success" or "failure"
				v30.httpStatus = p27.httpStatus
			end
		else
			return
		end
	end,
	["reclassifyOnRetry"] = function(p32, p33, p34) -- name: reclassifyOnRetry
		local v35 = p32.batchesByType[p33]
		if v35 then
			local v36 = p34.batchId
			local v37 = v35[tostring(v36)]
			if v37 then
				local v38 = v37.attempts
				if v38 then
					v38 = v38[#v38]
				end
				if v38 and not v38.finish then
					v38.finish = tick()
				end
				if v37.state == "pending" and not v37.sentTime then
					local v39 = p34.batchId - 1
					local v40 = v35[tostring(v39)]
					if v40 and v40.state == "failure" then
						v40.state = "retrying"
					end
				end
				v37.state = "retrying"
				v37.attemptNumber = p34.attemptNumber
			end
		else
			return
		end
	end,
	["markExhausted"] = function(p41, p42, p43) -- name: markExhausted
		local v44 = p41.batchesByType[p42]
		if v44 then
			local v45 = p43.batchId
			local v46 = v44[tostring(v45)]
			if v46 then
				local v47 = v46.attempts
				if v47 then
					v47 = v47[#v47]
				end
				if v47 and not v47.finish then
					v47.finish = tick()
				end
				v46.state = "exhausted"
				v46.settleTime = tick()
			end
		end
	end,
	["trackQueueOnCreated"] = function(p48, p49, p50) -- name: trackQueueOnCreated
		if p50.maxBatchSize then
			p48.observedMaxByType[p49] = p50.maxBatchSize
		end
		local v51 = p48.queues[p49]
		if v51 then
			v51.batchId = p50.batchId
		else
			p48.queues[p49] = {
				["batchId"] = p50.batchId,
				["ops"] = {},
				["createdTime"] = tick(),
				["retryOps"] = {}
			}
		end
	end,
	["drainQueueOnSent"] = function(p52, p53, p54) -- name: drainQueueOnSent
		local v55 = p52.queues[p53]
		local v56 = p54.operationCount or (v55 and (#v55.retryOps + #v55.ops or 0) or 0)
		p52.lastBatchSizeByType[p53] = v56
		if v55 then
			for _ = 1, v56 do
				if #v55.retryOps > 0 then
					table.remove(v55.retryOps, 1)
				else
					if #v55.ops <= 0 then
						break
					end
					table.remove(v55.ops, 1)
				end
			end
			if #v55.ops == 0 and #v55.retryOps == 0 then
				p52.queues[p53] = nil
			end
		end
	end,
	["requeueRetryOps"] = function(p57, p58, p59) -- name: requeueRetryOps
		local v60 = p57.queues[p58]
		if not v60 then
			v60 = {
				["batchId"] = p59.batchId,
				["ops"] = {},
				["createdTime"] = tick(),
				["retryOps"] = {}
			}
			p57.queues[p58] = v60
		end
		local v61 = p57.lastBatchSizeByType[p58] or (p59.operationCount or 0)
		v60.retryOps = {}
		for v62 = 1, v61 do
			local v63 = v60.retryOps
			local v64 = "retry-" .. v62
			table.insert(v63, v64)
		end
	end,
	["clearQueueOnExhausted"] = function(p65, p66) -- name: clearQueueOnExhausted
		local v67 = p65.queues[p66]
		if v67 then
			v67.retryOps = {}
			if #v67.ops == 0 then
				p65.queues[p66] = nil
			end
		end
	end,
	["enqueueOperation"] = function(p68, p69, p70) -- name: enqueueOperation
		local v71 = p68.queues[p69]
		if not v71 then
			v71 = {
				["batchId"] = p70.batchId,
				["ops"] = {},
				["createdTime"] = tick(),
				["retryOps"] = {}
			}
			p68.queues[p69] = v71
		end
		local v72 = v71.ops
		local v73 = p70.message or "?"
		table.insert(v72, v73)
	end,
	["recordCacheItemAdded"] = function(p74, p75, p76) -- name: recordCacheItemAdded
		local v77 = p74.cacheByType[p75]
		if not v77 then
			v77 = {
				["items"] = {}
			}
			p74.cacheByType[p75] = v77
		end
		local v78 = p76.message or ""
		for _, v79 in ipairs(v77.items) do
			if v79.key ~= v78 then
				continue
			end
			return
		end
		local v80 = v77.items
		table.insert(v80, {
			["key"] = nil,
			["lastHitTime"] = nil,
			["key"] = v78
		})
		if #v77.items > 48 then
			table.remove(v77.items, 1)
		end
	end,
	["recordCacheHit"] = function(p81, p82, p83) -- name: recordCacheHit
		local v84 = p81.cacheByType[p82]
		if not v84 then
			v84 = {
				["items"] = {}
			}
			p81.cacheByType[p82] = v84
		end
		local v85 = p83.message or ""
		for v86 = #v84.items, 1, -1 do
			if v84.items[v86].key ~= v85 then
				continue
			end
			v84.items[v86].lastHitTime = tick()
			return
		end
		local v87 = v84.items
		local v88 = {
			["key"] = v85,
			["lastHitTime"] = tick()
		}
		table.insert(v87, v88)
		if #v84.items > 48 then
			table.remove(v84.items, 1)
		end
	end,
	["advanceTime"] = function(p89) -- name: advanceTime
		p89.now = tick()
		local v90 = p89.now - 30
		for _, v91 in pairs(p89.batchesByType) do
			for v92, v93 in pairs(v91) do
				if not v93.settleTime or v93.settleTime >= v90 then
					continue
				end
				v91[v92] = nil
			end
		end
	end
}
return v_u_94