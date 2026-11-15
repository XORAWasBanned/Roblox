-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.separateOperations
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Set
require(v1.jsutils.ObjMap)
require(v1.language.ast)
local v_u_6 = require(v1.language.kinds).Kind
local v_u_7 = require(v1.language.visitor).visit
local v_u_8 = nil
local v_u_9 = nil
local function v21(p10) -- name: separateOperations
	-- upvalues: (copy) v_u_6, (ref) v_u_8, (copy) v_u_5, (ref) v_u_9, (copy) v_u_4
	local v11 = {}
	local v12 = {}
	for _, v13 in pairs(p10.definitions) do
		local v14 = v13.kind
		if v14 == v_u_6.OPERATION_DEFINITION then
			table.insert(v11, v13)
		else
			if v14 ~= v_u_6.FRAGMENT_DEFINITION then
				continue
			end
			v12[v13.name.value] = v_u_8(v13.selectionSet)
		end
	end
	local v15 = {}
	for _, v_u_16 in pairs(v11) do
		local v_u_17 = v_u_5.new()
		for _, v18 in pairs(v_u_8(v_u_16.selectionSet)) do
			v_u_9(v_u_17, v12, v18)
		end
		v15[v_u_16.name and (v_u_16.name.value or "") or ""] = {
			["kind"] = v_u_6.DOCUMENT,
			["definitions"] = v_u_4.filter(p10.definitions, function(p19)
				-- upvalues: (copy) v_u_16, (ref) v_u_6, (copy) v_u_17
				local v20
				if p19 == v_u_16 then
					v20 = true
				elseif p19.kind == v_u_6.FRAGMENT_DEFINITION then
					v20 = v_u_17:has(p19.name.value)
				else
					v20 = false
				end
				return v20
			end)
		}
	end
	return v15
end
v_u_9 = function(p22, p23, p24) -- name: collectTransitiveDependencies
	-- upvalues: (ref) v_u_9
	if not p22:has(p24) then
		p22:add(p24)
		local v25 = p23[p24]
		if v25 ~= nil then
			for _, v26 in pairs(v25) do
				v_u_9(p22, p23, v26)
			end
		end
	end
end
v_u_8 = function(p27) -- name: collectDependencies
	-- upvalues: (copy) v_u_7
	local v_u_28 = {}
	v_u_7(p27, {
		["FragmentSpread"] = function(_, p29) -- name: FragmentSpread
			-- upvalues: (copy) v_u_28
			local v30 = v_u_28
			local v31 = p29.name.value
			table.insert(v30, v31)
		end
	})
	return v_u_28
end
return {
	["separateOperations"] = v21
}