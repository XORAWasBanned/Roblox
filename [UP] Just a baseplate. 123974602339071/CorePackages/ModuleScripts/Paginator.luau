-- Path: CorePackages.Packages._Index.GenericPagination.GenericPagination.Paginator
local v1 = require(script.Parent.dependencies)
local v2 = v1.t
local v_u_3 = v1.LinkedList
local v_u_4 = v1.Promise
local v_u_5 = {
	["llRoot"] = nil,
	["llIndex"] = nil,
	["_isFetching"] = false
}
v_u_5.__index = v_u_5
local v_u_6 = v2.strictInterface({
	["pageSize"] = v2.number,
	["fetchWithCursor"] = v2.callback,
	["fetchInit"] = v2.callback
})
function v_u_5.new(p7)
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v8 = v_u_6
	assert(v8(p7))
	local v9 = {}
	for v10, v11 in pairs(p7) do
		v9[v10] = v11
	end
	local v12 = v_u_5
	setmetatable(v9, v12)
	v9:_init()
	return v9
end
function v_u_5._init(p_u_13) -- name: _init
	-- upvalues: (copy) v_u_3
	p_u_13._isFetching = true
	return p_u_13.fetchInit():andThen(function(p14, p15)
		-- upvalues: (copy) p_u_13, (ref) v_u_3
		p_u_13.llRoot = v_u_3.createNode()
		p_u_13.llIndex = p_u_13.llRoot
		p_u_13.llIndex:CreatePrevious(p14)
		p_u_13.llIndex:CreateNext(p15)
		p_u_13._isFetching = false
	end)
end
function v_u_5.getCurrent(p16) -- name: getCurrent
	return p16.llIndex.value or {}
end
function v_u_5.getNext(p_u_17) -- name: getNext
	-- upvalues: (copy) v_u_4
	if p_u_17._isFetching then
		return v_u_4.reject("Paginator is currently busy. Please wait.")
	end
	local v18 = p_u_17.llIndex.next.value or ""
	if v18 == "" then
		return v_u_4.reject("Next cursor is invalid")
	end
	p_u_17.llIndex = p_u_17.llIndex.next
	p_u_17._isFetching = true
	return p_u_17.fetchWithCursor(v18):andThen(function(p19, p20)
		-- upvalues: (copy) p_u_17
		p_u_17.llIndex.previous.value = p19
		if p_u_17.llIndex.next then
			p_u_17.llIndex.next.value = p20
		else
			p_u_17.llIndex:CreateNext(p20)
		end
		p_u_17._isFetching = false
	end)
end
function v_u_5.getPrevious(p_u_21) -- name: getPrevious
	-- upvalues: (copy) v_u_4
	if p_u_21._isFetching then
		return v_u_4.reject("Paginator is currently busy. Please wait.")
	end
	local v22 = p_u_21.llIndex.previous.value or ""
	if v22 == "" then
		return v_u_4.reject("Previous cursor is invalid")
	end
	p_u_21.llIndex = p_u_21.llIndex.previous
	p_u_21._isFetching = true
	return p_u_21.fetchWithCursor(v22, true):andThen(function(p23, p24)
		-- upvalues: (copy) p_u_21
		p_u_21.llIndex.next.value = p24
		if p_u_21.llIndex.previous then
			p_u_21.llIndex.previous.value = p23
		else
			p_u_21.llIndex:CreatePrevious(p23)
		end
		p_u_21._isFetching = false
	end)
end
function v_u_5.isFetching(p25) -- name: isFetching
	return p25._isFetching
end
return v_u_5