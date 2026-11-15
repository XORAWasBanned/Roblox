-- Path: CoreGui.RobloxGui.Modules.PlayingSounds
local v1 = game:GetService("CoreGui")
local v_u_2 = require(v1.RobloxGui.Modules.Flags.GetFFlagSoundTelemetryOsClock)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4) -- name: new
	-- upvalues: (copy) v_u_3
	local v5 = {}
	local v6 = v_u_3
	setmetatable(v5, v6)
	v5.aggregatedData = p4
	v5.sounds = {}
	return v5
end
function v_u_3.addSound(p7, p8, p9) -- name: addSound
	-- upvalues: (copy) v_u_2
	local v10 = p7.sounds[p8]
	if v10 == nil then
		if v_u_2() then
			p7.sounds[p8] = {
				["count"] = 0,
				["starttime"] = nil,
				["maxLoopCount"] = 1,
				["instances"] = nil,
				["starttime"] = os.clock(),
				["instances"] = {}
			}
		else
			p7.sounds[p8] = {
				["count"] = 0,
				["starttime"] = nil,
				["maxLoopCount"] = 1,
				["instances"] = nil,
				["starttime"] = os.time(),
				["instances"] = {}
			}
		end
		v10 = p7.sounds[p8]
	end
	if v10.instances[p9] == nil then
		v10.instances[p9] = 1
		v10.count = v10.count + 1
	end
end
function v_u_3.removeSound(p11, p12, p13) -- name: removeSound
	-- upvalues: (copy) v_u_2
	local v14 = p11.sounds[p12]
	if v14 ~= nil then
		if v14.instances[p13] then
			v14.instances[p13] = nil
			v14.count = v14.count - 1
		end
		if v14.count == 0 then
			if v_u_2() then
				local v15 = p11.aggregatedData
				local v16 = os.clock() - v14.starttime
				v15:addPlay(p12, math.round(v16), v14.maxLoopCount)
			else
				p11.aggregatedData:addPlay(p12, os.time() - v14.starttime, v14.maxLoopCount)
			end
			p11.sounds[p12] = nil
		end
	end
end
function v_u_3.loopSound(p17, p18, p19) -- name: loopSound
	local v20 = p17.sounds[p18]
	if v20 ~= nil and v20.instances[p19] ~= nil then
		local v21 = v20.instances
		v21[p19] = v21[p19] + 1
		local v22 = v20.maxLoopCount
		local v23 = v20.instances[p19]
		v20.maxLoopCount = math.max(v22, v23)
	end
end
return v_u_3