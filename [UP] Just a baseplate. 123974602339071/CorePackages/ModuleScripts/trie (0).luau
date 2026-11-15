-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.wry.trie.trie
local v1 = script.Parent.Parent.Parent.Parent
require(v1.LuauPolyfill)
local v2 = {}
local function v_u_3() -- name: defaultMakeData
	return {}
end
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6) -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v7 = p5 == nil and true or p5
	if p6 == nil then
		p6 = v_u_3
	end
	local v8 = v_u_4
	local v9 = setmetatable({}, v8)
	v9.weakness = v7
	v9.makeData = p6
	return v9
end
function v_u_4.lookup(p10, ...) -- name: lookup
	return p10:lookupArray({ ... })
end
function v_u_4.lookupArray(p11, p12) -- name: lookupArray
	local v13 = p11
	for _, v14 in p12 do
		p11 = p11:getChildTrie(v14)
	end
	if not p11.data then
		p11.data = v13.makeData(table.clone(p12))
	end
	return p11.data
end
function v_u_4.getChildTrie(p15, p16) -- name: getChildTrie
	-- upvalues: (copy) v_u_4
	local v17
	if p15.weakness then
		if p15.weak == nil then
			p15.weak = setmetatable({}, {
				["__mode"] = "k"
			})
		end
		v17 = p15.weak
	else
		if p15.strong == nil then
			p15.strong = {}
		end
		v17 = p15.strong
	end
	local v18 = v17[p16]
	if not v18 then
		v18 = v_u_4.new(p15.weakness, p15.makeData)
		v17[p16] = v18
	end
	return v18
end
v2.Trie = v_u_4
return v2