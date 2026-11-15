-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.buildASTSchema
local v_u_1 = require(script.Parent.Parent.Parent.LuauPolyfill).Array
local v_u_2 = require(script.Parent.Parent.jsutils.devAssert).devAssert
require(script.Parent.Parent.language.source)
require(script.Parent.Parent.language.ast)
local v3 = require(script.Parent.Parent.language.parser)
local v_u_4 = require(script.Parent.Parent.language.kinds).Kind
local v_u_5 = v3.parse
local v_u_6 = require(script.Parent.Parent.validation.validate).assertValidSDL
local v_u_7 = require(script.Parent.Parent.type.schema).GraphQLSchema
local v_u_8 = require(script.Parent.Parent.type.directives).specifiedDirectives
local v_u_9 = require(script.Parent.extendSchema).extendSchemaImpl
local function v_u_19(p10, p11)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_1, (copy) v_u_7
	local v12 = v_u_2
	local v13
	if p10 == nil then
		v13 = false
	else
		v13 = p10.kind == v_u_4.DOCUMENT
	end
	v12(v13, "Must provide valid Document AST.")
	if p11 ~= nil and not (p11.assumeValid or p11.assumeValidSDL) then
		v_u_6(p10)
	end
	local v14 = v_u_9({
		["description"] = nil,
		["types"] = nil,
		["directives"] = nil,
		["extensions"] = nil,
		["extensionASTNodes"] = nil,
		["assumeValid"] = false,
		["types"] = {},
		["directives"] = {},
		["extensionASTNodes"] = {}
	}, p10, p11)
	if v14.astNode == nil then
		for _, v15 in ipairs(v14.types) do
			if v15.name == "Query" then
				v14.query = v15
			elseif v15.name == "Mutation" then
				v14.mutation = v15
			else
				if v15.name ~= "Subscription" then
					continue
				end
				v14.subscription = v15
			end
		end
	end
	local v16 = v14.directives
	for _, v_u_17 in ipairs(v_u_8) do
		if not v_u_1.every(v16, function(p18)
			-- upvalues: (copy) v_u_17
			return p18.name ~= v_u_17.name
		end) then
			continue
		end
		table.insert(v16, v_u_17)
	end
	return v_u_7.new(v14)
end
return {
	["buildASTSchema"] = v_u_19,
	["buildSchema"] = function(p20, p21) -- name: buildSchema
		-- upvalues: (copy) v_u_5, (copy) v_u_19
		local v22 = v_u_5
		local v23 = {}
		local v24
		if p21 then
			v24 = p21.noLocation
		else
			v24 = nil
		end
		v23.noLocation = v24
		local v25
		if p21 then
			v25 = p21.experimentalFragmentVariables
		else
			v25 = nil
		end
		v23.experimentalFragmentVariables = v25
		local v26 = v22(p20, v23)
		local v27 = v_u_19
		local v28 = {}
		local v29
		if p21 then
			v29 = p21.assumeValidSDL
		else
			v29 = nil
		end
		v28.assumeValidSDL = v29
		local v30
		if p21 then
			v30 = p21.assumeValid
		else
			v30 = nil
		end
		v28.assumeValid = v30
		return v27(v26, v28)
	end,
	["parse"] = v_u_5
}