-- Path: CorePackages.Packages._Index.EventPropagation.EventPropagation.eventPropagationEvent
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3, p4, p5, p6, p7) -- name: new
	-- upvalues: (copy) v_u_1
	local v8 = {
		["cancelled"] = false,
		["phase"] = nil,
		["currentInstance"] = nil,
		["targetInstance"] = nil,
		["eventName"] = nil,
		["synthetic"] = nil,
		["eventData"] = nil,
		["phase"] = p5,
		["currentInstance"] = p3,
		["targetInstance"] = p2,
		["eventName"] = p4,
		["synthetic"] = p6 or false
	}
	if type(p7) == "table" and not table.isfrozen(p7) then
		p7 = table.freeze(p7)
	end
	v8.eventData = p7
	local v9 = v_u_1
	setmetatable(v8, v9)
	return v8
end
function v_u_1.cancel(p10) -- name: cancel
	p10.cancelled = true
end
return v_u_1