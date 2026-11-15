-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Analytics.Tracker
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new() -- name: new
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1
	return setmetatable({
		["trackers"] = {}
	}, v2)
end
function v_u_1.toggle(p3, p4) -- name: toggle
	p3[p4] = not p3[p4]
	return p3[p4]
end
function v_u_1.set(p5, p6, p7) -- name: set
	p5.trackers[p6] = p7
end
function v_u_1.get(p8, p9) -- name: get
	return p8.trackers[p9]
end
function v_u_1.reset(p10, p11) -- name: reset
	p10.trackers[p11] = nil
end
function v_u_1.startTime(p12, p13) -- name: startTime
	p12.trackers[p13] = DateTime.now().UnixTimestampMillis
end
function v_u_1.finishTime(p14, p15) -- name: finishTime
	if not p14.trackers[p15] then
		return 0
	end
	local v16 = DateTime.now().UnixTimestampMillis - p14.trackers[p15]
	p14.trackers[p15] = 0
	return v16
end
return v_u_1