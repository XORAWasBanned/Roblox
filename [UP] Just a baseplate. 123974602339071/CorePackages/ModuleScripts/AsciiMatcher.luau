-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.text.AsciiMatcher
local v_u_1 = string.byte
local v_u_2 = {}
v_u_2.__index = v_u_2
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_2.new(p4) -- name: new
	-- upvalues: (copy) v_u_2
	local v5 = {
		["_set"] = p4._set
	}
	local v6 = v_u_2
	return setmetatable(v5, v6)
end
function v_u_2.matches(p7, p8) -- name: matches
	return p7._set[p8] == true
end
function v_u_2.newBuilder(p9) -- name: newBuilder
	-- upvalues: (copy) v_u_3
	return v_u_3.new(table.clone(p9._set))
end
function v_u_2.builder() -- name: builder
	-- upvalues: (copy) v_u_3
	return v_u_3.new({})
end
function v_u_2.builderMatcher(p10) -- name: builderMatcher
	-- upvalues: (copy) v_u_3
	return v_u_3.new(table.clone(p10._set))
end
function v_u_3.new(p11) -- name: new
	-- upvalues: (copy) v_u_3
	local v12 = v_u_3
	return setmetatable({
		["_set"] = p11
	}, v12)
end
function v_u_3.c(p13, p14) -- name: c
	if p14 > 127 then
		error("Can only match ASCII characters")
	end
	p13._set[p14] = true
	return p13
end
function v_u_3.anyOf(p15, p16) -- name: anyOf
	-- upvalues: (copy) v_u_1
	for v17 = 0, #p16 - 1 do
		p15:c(v_u_1(p16, v17 + 1))
	end
	return p15
end
function v_u_3.anyOfSet(p18, p19) -- name: anyOfSet
	for v20 in p19 do
		p18:c(v20)
	end
	return p18
end
function v_u_3.range(p21, p22, p23) -- name: range
	for v24 = p22, p23 do
		p21:c(v24)
	end
	return p21
end
function v_u_3.build(p25) -- name: build
	-- upvalues: (copy) v_u_2
	return v_u_2.new(p25)
end
v_u_2.Builder = v_u_3
return v_u_2