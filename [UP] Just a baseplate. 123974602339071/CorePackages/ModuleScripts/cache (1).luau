-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.optimism.cache
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Map
local v3 = {}
local function v_u_4() -- name: defaultDispose end
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6, p7) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
	local v8 = p6 == nil and (1 / 0) or p6
	if p7 == nil then
		p7 = v_u_4
	end
	local v9 = v_u_5
	local v10 = setmetatable({}, v9)
	v10.map = v_u_2.new(nil)
	v10.newest = nil
	v10.oldest = nil
	v10.max = v8
	v10.dispose = p7
	return v10
end
function v_u_5.has(p11, p12) -- name: has
	return p11.map:has(p12)
end
function v_u_5.get(p13, p14) -- name: get
	local v15 = p13:getNode(p14)
	if v15 then
		return v15.value
	else
		return v15
	end
end
function v_u_5.getNode(p16, p17) -- name: getNode
	local v18 = p16.map:get(p17)
	if v18 and v18 ~= p16.newest then
		local v19 = v18.older
		local v20 = v18.newer
		if v20 then
			v20.older = v19
		end
		if v19 then
			v19.newer = v20
		end
		v18.older = p16.newest
		v18.older.newer = v18
		v18.newer = nil
		p16.newest = v18
		if v18 == p16.oldest then
			p16.oldest = v20
		end
	end
	return v18
end
function v_u_5.set(p21, p22, p23) -- name: set
	local v24 = p21:getNode(p22)
	if v24 then
		v24.value = p23
		return v24.value
	end
	local v25 = {
		["key"] = nil,
		["value"] = nil,
		["newer"] = nil,
		["older"] = nil,
		["key"] = p22,
		["value"] = p23,
		["older"] = p21.newest
	}
	if p21.newest then
		p21.newest.newer = v25
	end
	p21.newest = v25
	p21.oldest = p21.oldest or v25
	p21.map:set(p22, v25)
	return v25.value
end
function v_u_5.clean(p26) -- name: clean
	while p26.oldest and p26.map.size > p26.max do
		p26:delete(p26.oldest.key)
	end
end
function v_u_5.delete(p27, p28) -- name: delete
	local v29 = p27.map:get(p28)
	if not v29 then
		return false
	end
	if v29 == p27.newest then
		p27.newest = v29.older
	end
	if v29 == p27.oldest then
		p27.oldest = v29.newer
	end
	if v29.newer then
		v29.newer.older = v29.older
	end
	if v29.older then
		v29.older.newer = v29.newer
	end
	p27.map:delete(p28)
	p27.dispose(v29.value, p28)
	return true
end
v3.Cache = v_u_5
return v3