-- Path: CorePackages.Packages._Index.GenericPagination.GenericPagination.LinkedList
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.createNode(p2)
	-- upvalues: (copy) v_u_1
	local v3 = {
		["previous"] = nil,
		["next"] = nil,
		["value"] = nil,
		["value"] = p2
	}
	local v4 = v_u_1
	setmetatable(v3, v4)
	return v3
end
function v_u_1.CreateNext(p5, p6) -- name: CreateNext
	-- upvalues: (copy) v_u_1
	local v7 = {
		["previous"] = p5,
		["next"] = p5.next,
		["value"] = p6 or {}
	}
	if p5.next then
		p5.next.previous = v7
	end
	local v8 = v_u_1
	setmetatable(v7, v8)
	p5.next = v7
	return v7
end
function v_u_1.CreatePrevious(p9, p10) -- name: CreatePrevious
	-- upvalues: (copy) v_u_1
	local v11 = {
		["previous"] = p9.previous,
		["next"] = p9,
		["value"] = p10 or {}
	}
	if p9.previous then
		p9.previous.next = v11
	end
	local v12 = v_u_1
	setmetatable(v11, v12)
	p9.previous = v11
	return v11
end
return v_u_1