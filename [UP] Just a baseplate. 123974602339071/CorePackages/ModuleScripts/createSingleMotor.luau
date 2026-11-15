-- Path: CorePackages.Packages._Index.Otter-31ab8d40-0.1.4.Otter.createSingleMotor
local v_u_1 = game:GetService("RunService")
local v_u_2 = require(script.Parent.createSignal)
local v_u_3 = {
	["prototype"] = {}
}
v_u_3.__index = v_u_3.prototype
function v_u_3.prototype.start(p_u_4) -- name: start
	-- upvalues: (copy) v_u_1
	if not p_u_4.__running then
		p_u_4.__connection = v_u_1.Heartbeat:Connect(function(p5)
			-- upvalues: (copy) p_u_4
			p_u_4:step(p5)
		end)
		p_u_4.__running = true
	end
end
function v_u_3.prototype.stop(p6) -- name: stop
	if p6.__connection ~= nil then
		p6.__connection:Disconnect()
	end
	p6.__running = false
end
function v_u_3.prototype.step(p7, p8) -- name: step
	local v9 = typeof(p8) == "number"
	assert(v9)
	if p7.__state.complete then
		return
	elseif p7.__goal ~= nil then
		local v10 = p7.__goal:step(p7.__state, p8)
		if v10 ~= nil then
			p7.__state = v10
		end
		p7.__onStep:fire(p7.__state.value)
		if p7.__state.complete and p7.__running then
			p7:stop()
			p7.__onComplete:fire(p7.__state.value)
		end
	end
end
function v_u_3.prototype.setGoal(p11, p12) -- name: setGoal
	p11.__goal = p12
	p11.__state.complete = false
	p11:start()
end
function v_u_3.prototype.onStep(p13, p14) -- name: onStep
	local v15 = typeof(p14) == "function"
	assert(v15)
	return p13.__onStep:subscribe(p14)
end
function v_u_3.prototype.onComplete(p16, p17) -- name: onComplete
	local v18 = typeof(p17) == "function"
	assert(v18)
	return p16.__onComplete:subscribe(p17)
end
function v_u_3.prototype.destroy(p19) -- name: destroy
	p19:stop()
end
return function(p20) -- name: createSingleMotor
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v21 = typeof(p20) == "number"
	assert(v21)
	local v22 = {
		["__goal"] = nil,
		["__state"] = nil,
		["__onComplete"] = nil,
		["__onStep"] = nil,
		["__running"] = false,
		["__state"] = {
			["value"] = nil,
			["complete"] = true,
			["value"] = p20
		},
		["__onComplete"] = v_u_2(),
		["__onStep"] = v_u_2()
	}
	local v23 = v_u_3
	setmetatable(v22, v23)
	return v22
end