-- Path: CorePackages.Packages._Index.Otter-31ab8d40-1.3.7.Otter.createSingleMotor
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Signal).createSignal
local v_u_3 = require(script.Parent.AnimationStepSignal)
require(script.Parent.types)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.start(p_u_5) -- name: start
	-- upvalues: (copy) v_u_3
	if not p_u_5.__running then
		p_u_5.__connection = v_u_3:Connect(function(p6)
			-- upvalues: (copy) p_u_5
			p_u_5:step(p6)
		end)
		p_u_5.__running = true
		if p_u_5.__goal and p_u_5.__goal.startingValue then
			p_u_5.__state.value = p_u_5.__goal.startingValue
			if p_u_5.__state.initialValue then
				p_u_5.__state.initialValue = p_u_5.__goal.startingValue
			end
			p_u_5:step(0)
		end
	end
end
function v_u_4.stop(p7) -- name: stop
	if p7.__connection ~= nil then
		p7.__connection:Disconnect()
	end
	p7.__running = false
end
function v_u_4.step(p8, p9) -- name: step
	if p8.__state.complete then
		return
	elseif p8.__goal ~= nil then
		local v10 = p8.__goal.step(p8.__state, p9)
		if v10 ~= nil then
			p8.__state = v10
		end
		p8.__fireOnStep(p8.__state.value)
		if p8.__state.complete and p8.__running then
			p8:stop()
			p8.__fireOnComplete(p8.__state.value)
		end
	end
end
function v_u_4.setGoal(p11, p12) -- name: setGoal
	p11.__goal = p12
	p11.__state.complete = false
	p11:start()
end
function v_u_4.onStep(p13, p14) -- name: onStep
	local v_u_15 = p13.__onStep:subscribe(p14)
	return function()
		-- upvalues: (copy) v_u_15
		v_u_15:unsubscribe()
	end
end
function v_u_4.onComplete(p16, p17) -- name: onComplete
	local v_u_18 = p16.__onComplete:subscribe(p17)
	return function()
		-- upvalues: (copy) v_u_18
		v_u_18:unsubscribe()
	end
end
function v_u_4.destroy(p19) -- name: destroy
	p19:stop()
end
return function(p20) -- name: createSingleMotor
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v21, v22 = v_u_2()
	local v23, v24 = v_u_2()
	local v25 = {
		["__goal"] = nil,
		["__state"] = nil,
		["__onComplete"] = nil,
		["__fireOnComplete"] = nil,
		["__onStep"] = nil,
		["__fireOnStep"] = nil,
		["__running"] = false,
		["__state"] = {
			["value"] = nil,
			["complete"] = true,
			["value"] = p20
		},
		["__onComplete"] = v21,
		["__fireOnComplete"] = v22,
		["__onStep"] = v23,
		["__fireOnStep"] = v24
	}
	local v26 = v_u_4
	setmetatable(v25, v26)
	return v25
end