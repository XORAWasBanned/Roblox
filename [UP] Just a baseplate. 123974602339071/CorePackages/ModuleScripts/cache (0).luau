-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.core.cache
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Object
local v_u_5 = v3.Boolean
local v6 = {}
require(v2.GraphQL)
local v_u_7 = require(v1.optimism).wrap
local v_u_8 = require(script.Parent.Parent.Parent.utilities).getFragmentQueryDocument
require(script.Parent.types.DataProxy)
require(script.Parent.types.Cache)
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.new() -- name: new
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_8
	local v10 = v_u_9
	local v11 = setmetatable({}, v10)
	v11.getFragmentDoc = v_u_7(v_u_8)
	return v11
end
function v_u_9.read(_, _) -- name: read
	error("not implemented abstract method")
end
function v_u_9.write(_, _) -- name: write
	error("not implemented abstract method")
end
function v_u_9.diff(_, _) -- name: diff
	error("not implemented abstract method")
end
function v_u_9.watch(_, _) -- name: watch
	error("not implemented abstract method")
end
function v_u_9.reset(_) -- name: reset
	error("not implemented abstract method")
end
function v_u_9.evict(_, _) -- name: evict
	error("not implemented abstract method")
end
function v_u_9.restore(_, _) -- name: restore
	error("not implemented abstract method")
end
function v_u_9.extract(_, _) -- name: extract
	error("not implemented abstract method")
end
function v_u_9.removeOptimistic(_, _) -- name: removeOptimistic
	error("not implemented abstract method")
end
function v_u_9.batch(p12, p13) -- name: batch
	local v14 = p13.optimistic
	local v15
	if typeof(v14) == "string" then
		v15 = p13.optimistic
	else
		local _ = p13.optimistic == false
		v15 = nil
	end
	p12:performTransaction(p13.update, v15)
end
function v_u_9.performTransaction(_, _, _) -- name: performTransaction
	error("not implemented abstract method")
end
function v_u_9.recordOptimisticTransaction(p16, p17, p18) -- name: recordOptimisticTransaction
	p16:performTransaction(p17, p18)
end
function v_u_9.transformDocument(_, p19) -- name: transformDocument
	return p19
end
function v_u_9.identify(_, _) -- name: identify end
function v_u_9.gc(_) -- name: gc
	return {}
end
function v_u_9.modify(_, _) -- name: modify
	return false
end
function v_u_9.transformForLink(_, p20) -- name: transformForLink
	return p20
end
function v_u_9.readQuery(p21, p22, p23) -- name: readQuery
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	if p23 == nil then
		p23 = p22.optimistic and true or false
	end
	return p21:read(v_u_4.assign(table.clone(p22), {
		["rootId"] = v_u_5.toJSBoolean(p22.id) and p22.id or "ROOT_QUERY",
		["optimistic"] = p23
	}))
end
function v_u_9.readFragment(p24, p25, p26) -- name: readFragment
	-- upvalues: (copy) v_u_4
	if p26 == nil then
		p26 = p25.optimistic and true or false
	end
	return p24:read(v_u_4.assign({}, p25, {
		["query"] = p24.getFragmentDoc(p25.fragment, p25.fragmentName),
		["rootId"] = p25.id,
		["optimistic"] = p26
	}))
end
function v_u_9.writeQuery(p27, p28) -- name: writeQuery
	-- upvalues: (copy) v_u_4
	local v29 = p28.id
	local v30 = p28.data
	local v31 = v_u_4.assign(table.clone(p28), {
		["id"] = v_u_4.None,
		["data"] = v_u_4.None
	})
	return p27:write(v_u_4.assign(v31, {
		["dataId"] = v29 or "ROOT_QUERY",
		["result"] = v30
	}))
end
function v_u_9.writeFragment(p32, p33) -- name: writeFragment
	-- upvalues: (copy) v_u_4
	local v34 = p33.id
	local v35 = p33.data
	local v36 = p33.fragment
	local v37 = p33.fragmentName
	local v38 = v_u_4.assign(table.clone(p33), {
		["id"] = v_u_4.None,
		["data"] = v_u_4.None,
		["fragment"] = v_u_4.None,
		["fragmentName"] = v_u_4.None
	})
	return p32:write(v_u_4.assign(v38, {
		["query"] = p32.getFragmentDoc(v36, v37),
		["dataId"] = v34,
		["result"] = v35
	}))
end
v6.ApolloCache = v_u_9
return v6