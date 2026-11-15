-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.typeFromAST
local v1 = script.Parent.Parent
local v_u_2 = require(v1.jsutils.inspect).inspect
local v_u_3 = require(v1.jsutils.invariant).invariant
local v4 = v1.language
require(v4.ast)
local v_u_5 = require(v1.language.kinds).Kind
local v6 = require(v1.type.definition)
local v_u_7 = v6.GraphQLList
local v_u_8 = v6.GraphQLNonNull
local v9 = v1.type
require(v9.schema)
local function v_u_14(p10, p11) -- name: typeFromAST
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (copy) v_u_2
	if p11.kind == v_u_5.LIST_TYPE then
		local v12 = v_u_14(p10, p11.type)
		if v12 then
			v12 = v_u_7.new(v12)
		end
		return v12
	elseif p11.kind == v_u_5.NON_NULL_TYPE then
		local v13 = v_u_14(p10, p11.type)
		if v13 then
			v13 = v_u_8.new(v13)
		end
		return v13
	else
		if p11.kind == v_u_5.NAMED_TYPE then
			return p10:getType(p11.name.value)
		end
		v_u_3(false, "Unexpected type node: " .. v_u_2(p11))
		return nil
	end
end
return {
	["typeFromAST"] = v_u_14
}