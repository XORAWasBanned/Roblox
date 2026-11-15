-- Path: CorePackages.Packages._Index.Otter-31ab8d40-0.1.4.Otter.createGroupMotor
local v_u_1 = game:GetService("RunService")
local v_u_2 = require(script.Parent.assign)
local v_u_3 = require(script.Parent.createSignal)
local v_u_4 = {
	["prototype"] = {}
}
v_u_4.__index = v_u_4.prototype
function v_u_4.prototype.start(p_u_5) -- name: start
	-- upvalues: (copy) v_u_1
	if not p_u_5.__running then
		p_u_5.__connection = v_u_1.Heartbeat:Connect(function(p6)
			-- upvalues: (copy) p_u_5
			p_u_5:step(p6)
		end)
		p_u_5.__running = true
	end
end
function v_u_4.prototype.stop(p7) -- name: stop
	if p7.__connection ~= nil then
		p7.__connection:Disconnect()
		p7.__running = false
	end
end
function v_u_4.prototype.step(p8, p9) -- name: step
	local v10 = typeof(p9) == "number"
	assert(v10)
	if not p8.__allComplete then
		local v11 = {}
		local v12 = true
		for v13, v17 in pairs(p8.__states) do
			if not v17.complete then
				local v15 = p8.__goals[v13]
				if v15 == nil then
					v17.complete = true
				else
					local v16 = v15:step(v17, p9)
					if v16 ~= nil then
						p8.__states[v13] = v16
						local v17 = v16
					end
				end
				if not v17.complete then
					v12 = false
				end
			end
			v11[v13] = v17.value
		end
		local v18 = p8.__allComplete
		p8.__allComplete = v12
		p8.__onStep:fire(v11)
		if p8.__allComplete and (not v18 and p8.__running) then
			p8:stop()
			p8.__onComplete:fire(v11)
		end
	end
end
function v_u_4.prototype.setGoal(p19, p20) -- name: setGoal
	-- upvalues: (copy) v_u_2
	local v21 = typeof(p20) == "table"
	assert(v21)
	p19.__goals = v_u_2({}, p19.__goals, p20)
	for v22 in pairs(p20) do
		local v23 = p19.__states[v22]
		if v23 == nil then
			error(("Cannot set goal for the value %s because it doesn\'t exist"):format((tostring(v22))), 2)
		end
		v23.complete = false
	end
	p19.__allComplete = false
	p19:start()
end
function v_u_4.prototype.onStep(p24, p25) -- name: onStep
	local v26 = typeof(p25) == "function"
	assert(v26)
	return p24.__onStep:subscribe(p25)
end
function v_u_4.prototype.onComplete(p27, p28) -- name: onComplete
	local v29 = typeof(p28) == "function"
	assert(v29)
	return p27.__onComplete:subscribe(p28)
end
function v_u_4.prototype.destroy(p30) -- name: destroy
	p30:stop()
end
return function(p31) -- name: createGroupMotor
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v32 = typeof(p31) == "table"
	assert(v32)
	local v33 = {}
	for v34, v35 in pairs(p31) do
		v33[v34] = {
			["value"] = nil,
			["complete"] = true,
			["value"] = v35
		}
	end
	local v36 = {
		["__goals"] = nil,
		["__states"] = nil,
		["__allComplete"] = true,
		["__onComplete"] = nil,
		["__onStep"] = nil,
		["__running"] = false,
		["__goals"] = {},
		["__states"] = v33,
		["__onComplete"] = v_u_3(),
		["__onStep"] = v_u_3()
	}
	local v37 = v_u_4
	setmetatable(v36, v37)
	return v36
end