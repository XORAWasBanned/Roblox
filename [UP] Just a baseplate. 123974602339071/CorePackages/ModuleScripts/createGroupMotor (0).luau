-- Path: CorePackages.Packages._Index.Otter-31ab8d40-1.3.7.Otter.createGroupMotor
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Collections).Object
local v_u_3 = require(v1.Signal).createSignal
local v_u_4 = require(script.Parent.AnimationStepSignal)
require(script.Parent.types)
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.start(p_u_6, p7) -- name: start
	-- upvalues: (copy) v_u_4
	if not p_u_6.__running then
		p_u_6.__connection = v_u_4:Connect(function(p8)
			-- upvalues: (copy) p_u_6
			p_u_6:step(p8)
		end)
		p_u_6.__running = true
		if p7 then
			p_u_6:step(0)
		end
	end
end
function v_u_5.stop(p9) -- name: stop
	if p9.__connection ~= nil then
		p9.__connection:Disconnect()
		p9.__running = false
	end
end
function v_u_5.step(p10, p11) -- name: step
	if not p10.__allComplete then
		local v12 = {}
		local v13 = true
		for v14, v18 in pairs(p10.__states) do
			if not v18.complete then
				local v16 = p10.__goals[v14]
				if v16 == nil then
					v18.complete = true
				else
					local v17 = v16.step(v18, p11)
					if v17 ~= nil then
						p10.__states[v14] = v17
						local v18 = v17
					end
				end
				if not v18.complete then
					v13 = false
				end
			end
			v12[v14] = v18.value
		end
		local v19 = p10.__allComplete
		p10.__allComplete = v13
		p10.__fireOnStep(v12)
		if p10.__allComplete and (not v19 and p10.__running) then
			p10:stop()
			p10.__fireOnComplete(v12)
		end
	end
end
function v_u_5.setGoal(p20, p21) -- name: setGoal
	-- upvalues: (copy) v_u_2
	p20.__goals = v_u_2.assign({}, p20.__goals, p21)
	local v22 = {}
	local v23 = false
	for v24, v25 in pairs(p21) do
		local v26 = p20.__states[v24]
		if v25.startingValue then
			v23 = true
			v26.value = v25.startingValue
			if v26.initialValue then
				v26.initialValue = v25.startingValue
			end
		end
		v22[v24] = v26.value
		if v26 == nil then
			error(("Cannot set goal for the value %s because it doesn\'t exist"):format((tostring(v24))), 2)
		end
		v26.complete = false
	end
	p20.__allComplete = false
	p20:start(v23)
end
function v_u_5.onStep(p27, p28) -- name: onStep
	local v_u_29 = p27.__onStep:subscribe(p28)
	return function()
		-- upvalues: (copy) v_u_29
		v_u_29:unsubscribe()
	end
end
function v_u_5.onComplete(p30, p31) -- name: onComplete
	local v_u_32 = p30.__onComplete:subscribe(p31)
	return function()
		-- upvalues: (copy) v_u_32
		v_u_32:unsubscribe()
	end
end
function v_u_5.destroy(p33) -- name: destroy
	p33:stop()
end
return function(p34) -- name: createGroupMotor
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	local v35 = {}
	for v36, v37 in pairs(p34) do
		v35[v36] = {
			["value"] = nil,
			["complete"] = true,
			["value"] = v37
		}
	end
	local v38, v39 = v_u_3()
	local v40, v41 = v_u_3()
	local v42 = {
		["__goals"] = nil,
		["__states"] = nil,
		["__allComplete"] = true,
		["__onComplete"] = nil,
		["__fireOnComplete"] = nil,
		["__onStep"] = nil,
		["__fireOnStep"] = nil,
		["__running"] = false,
		["__goals"] = {},
		["__states"] = v35,
		["__onComplete"] = v38,
		["__fireOnComplete"] = v39,
		["__onStep"] = v40,
		["__fireOnStep"] = v41
	}
	local v43 = v_u_5
	setmetatable(v42, v43)
	return v42
end