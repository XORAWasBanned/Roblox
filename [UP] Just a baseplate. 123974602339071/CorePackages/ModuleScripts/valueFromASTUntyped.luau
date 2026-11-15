-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.valueFromASTUntyped
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = v1.jsutils
local v4 = v1.language
local v5 = require(v2.LuauPolyfill)
local v_u_6 = v5.Array
local v_u_7 = v5.coerceToTable
local v_u_8 = require(v1.luaUtils.null)
require(v3.ObjMap)
local v_u_9 = require(v3.inspect).inspect
local v_u_10 = require(v3.invariant).invariant
local v_u_11 = require(v3.keyValMap).keyValMap
local v_u_12 = require(v4.kinds).Kind
require(v4.ast)
local function v_u_20(p13, p_u_14) -- name: valueFromASTUntyped
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_6, (copy) v_u_20, (copy) v_u_7, (copy) v_u_11, (copy) v_u_10, (copy) v_u_9
	if p13.kind == v_u_12.NULL then
		return v_u_8
	end
	if p13.kind == v_u_12.INT then
		local v15 = p13.value
		return tonumber(v15, 10)
	end
	if p13.kind == v_u_12.FLOAT then
		local v16 = p13.value
		return tonumber(v16)
	end
	if p13.kind == v_u_12.STRING or (p13.kind == v_u_12.ENUM or p13.kind == v_u_12.BOOLEAN) then
		return p13.value
	end
	if p13.kind == v_u_12.LIST then
		return v_u_6.map(p13.values, function(p17)
			-- upvalues: (ref) v_u_20, (copy) p_u_14
			return v_u_20(p17, p_u_14)
		end)
	end
	if p13.kind == v_u_12.OBJECT then
		return v_u_7(v_u_11(p13.fields, function(p18)
			return p18.name.value
		end, function(p19)
			-- upvalues: (ref) v_u_20, (copy) p_u_14
			return v_u_20(p19.value, p_u_14)
		end))
	end
	if p13.kind == v_u_12.VARIABLE then
		if p_u_14 then
			p_u_14 = p_u_14[p13.name.value]
		end
		return p_u_14
	end
	v_u_10(false, "Unexpected value node: " .. v_u_9(p13))
	error("Unexpected value node: " .. v_u_9(p13))
end
return {
	["valueFromASTUntyped"] = v_u_20
}