-- Path: CoreGui.RobloxGui.Modules.ErrorReporting.RateLimiter
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("RunService")
local v3 = require(v1.Packages.t)
local v_u_4 = v3.strictInterface({
	["period"] = v3.number,
	["threshold"] = v3.number,
	["processInterval"] = v3.number
})
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v7 = v_u_4
	assert(v7(p6))
	local v8 = {
		["_period"] = nil,
		["_threshold"] = nil,
		["_processInterval"] = nil,
		["_lastProcessed"] = 0,
		["_counts"] = nil,
		["_lastOccurrences"] = nil,
		["_period"] = p6.period,
		["_threshold"] = p6.threshold,
		["_processInterval"] = p6.processInterval,
		["_counts"] = {},
		["_lastOccurrences"] = {}
	}
	local v9 = v_u_5
	return setmetatable(v8, v9)
end
function v_u_5.increment(p10, p11, p12) -- name: increment
	local v13 = p12 or os.clock()
	p10._lastOccurrences[p11] = v13
	if p10._counts[p11] == nil then
		p10._counts[p11] = 1
	else
		local v14 = p10._counts
		v14[p11] = v14[p11] + 1
	end
end
function v_u_5.isRateLimited(p15, p16) -- name: isRateLimited
	local v17 = p15._counts[p16]
	local v18
	if v17 == nil then
		v18 = false
	else
		v18 = p15._threshold < v17
	end
	return v18
end
function v_u_5.startDecrementClock(p_u_19) -- name: startDecrementClock
	-- upvalues: (copy) v_u_2
	p_u_19._decrementConnection = v_u_2.Heartbeat:Connect(function()
		-- upvalues: (copy) p_u_19
		p_u_19:stepDecrementClock(os.clock())
	end)
end
function v_u_5.stepDecrementClock(p20, p21) -- name: stepDecrementClock
	if p21 - p20._lastProcessed > p20._processInterval then
		for v22, v23 in pairs(p20._lastOccurrences) do
			if p21 - v23 <= p20._period then
				continue
			end
			local v24 = p20._counts
			v24[v22] = v24[v22] - 1
			if p20._counts[v22] > 0 then
				continue
			end
			p20._counts[v22] = nil
			p20._lastOccurrences[v22] = nil
		end
		p20._lastProcessed = p21
	end
end
return v_u_5