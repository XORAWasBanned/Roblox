-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.type.introspection
local v1 = script.Parent.Parent
local v2 = v1.jsutils
local v3 = v1.language
local v4 = v1.Parent
local v5 = require(v4.LuauPolyfill)
local v_u_6 = v5.Array
local v_u_7 = v5.Map
local v8 = v5.Object
local v_u_9 = require(v1.luaUtils.isNillish).isNotNillish
local v_u_10 = require(v2.inspect).inspect
local v_u_11 = require(v2.invariant).invariant
local v_u_12 = require(v3.printer).print
local v13 = require(v3.directiveLocation).DirectiveLocation
local v_u_14 = require(v1.utilities.astFromValue).astFromValue
require(v1.language.ast)
local v15 = require(script.Parent.scalars)
local v_u_16 = v15.GraphQLString
local v_u_17 = v15.GraphQLBoolean
local v18 = require(script.Parent.definition)
local v_u_19 = v18.GraphQLList
local v_u_20 = v18.GraphQLNonNull
local v21 = v18.GraphQLObjectType
local v22 = v18.GraphQLEnumType
local v_u_23 = v18.isScalarType
local v_u_24 = v18.isObjectType
local v_u_25 = v18.isInterfaceType
local v_u_26 = v18.isUnionType
local v_u_27 = v18.isEnumType
local v_u_28 = v18.isInputObjectType
local v_u_29 = v18.isListType
local v_u_30 = v18.isNonNullType
local v_u_31 = v18.isAbstractType
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = nil
local v_u_35 = nil
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v46 = {
	["name"] = "__Schema",
	["description"] = "A GraphQL Schema defines the capabilities of a GraphQL server. It exposes all available types and directives on the server, as well as the entry points for query, mutation, and subscription operations.",
	["fields"] = nil,
	["fields"] = function() -- name: fields
		-- upvalues: (copy) v_u_7, (copy) v_u_16, (copy) v_u_20, (copy) v_u_19, (ref) v_u_36, (ref) v_u_34
		return v_u_7.new({
			{
				"description",
				{
					["type"] = v_u_16,
					["resolve"] = function(p40) -- name: resolve
						return p40.description
					end
				}
			},
			{
				"types",
				{
					["description"] = "A list of all types supported by this server.",
					["type"] = nil,
					["resolve"] = nil,
					["type"] = v_u_20.new(v_u_19.new(v_u_20.new(v_u_36))),
					["resolve"] = function(p41) -- name: resolve
						return p41:getTypeMap():values()
					end
				}
			},
			{
				"queryType",
				{
					["description"] = "The type that query operations will be rooted at.",
					["type"] = nil,
					["resolve"] = nil,
					["type"] = v_u_20.new(v_u_36),
					["resolve"] = function(p42) -- name: resolve
						return p42:getQueryType()
					end
				}
			},
			{
				"mutationType",
				{
					["description"] = "If this server supports mutation, the type that mutation operations will be rooted at.",
					["type"] = nil,
					["resolve"] = nil,
					["type"] = v_u_36,
					["resolve"] = function(p43) -- name: resolve
						return p43:getMutationType()
					end
				}
			},
			{
				"subscriptionType",
				{
					["description"] = "If this server support subscription, the type that subscription operations will be rooted at.",
					["type"] = nil,
					["resolve"] = nil,
					["type"] = v_u_36,
					["resolve"] = function(p44) -- name: resolve
						return p44:getSubscriptionType()
					end
				}
			},
			{
				"directives",
				{
					["description"] = "A list of all directives supported by this server.",
					["type"] = nil,
					["resolve"] = nil,
					["type"] = v_u_20.new(v_u_19.new(v_u_20.new(v_u_34))),
					["resolve"] = function(p45) -- name: resolve
						return p45:getDirectives()
					end
				}
			}
		})
	end
}
local v47 = v21.new(v46)
local v53 = {
	["name"] = "__Directive",
	["description"] = "A Directive provides a way to describe alternate runtime execution and type validation behavior in a GraphQL document.\n\nIn some cases, you need to provide options to alter GraphQL\'s execution behavior in ways field arguments will not suffice, such as conditionally including or skipping a field. Directives provide this by describing additional information to the executor.",
	["fields"] = nil,
	["fields"] = function() -- name: fields
		-- upvalues: (copy) v_u_7, (copy) v_u_20, (copy) v_u_16, (copy) v_u_17, (copy) v_u_19, (ref) v_u_35, (ref) v_u_38
		return v_u_7.new({
			{
				"name",
				{
					["type"] = v_u_20.new(v_u_16),
					["resolve"] = function(p48) -- name: resolve
						return p48.name
					end
				}
			},
			{
				"description",
				{
					["type"] = v_u_16,
					["resolve"] = function(p49) -- name: resolve
						return p49.description
					end
				}
			},
			{
				"isRepeatable",
				{
					["type"] = v_u_20.new(v_u_17),
					["resolve"] = function(p50) -- name: resolve
						return p50.isRepeatable
					end
				}
			},
			{
				"locations",
				{
					["type"] = v_u_20.new(v_u_19.new(v_u_20.new(v_u_35))),
					["resolve"] = function(p51) -- name: resolve
						return p51.locations
					end
				}
			},
			{
				"args",
				{
					["type"] = v_u_20.new(v_u_19.new(v_u_20.new(v_u_38))),
					["resolve"] = function(p52) -- name: resolve
						return p52.args
					end
				}
			}
		})
	end
}
v_u_34 = v21.new(v53)
local v54 = v22.new
local v55 = {
	["name"] = "__DirectiveLocation",
	["description"] = "A Directive can be adjacent to many parts of the GraphQL language, a __DirectiveLocation describes one such possible adjacencies.",
	["values"] = nil,
	["values"] = v_u_7.new({
		{
			"QUERY",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a query operation.",
				["value"] = v13.QUERY
			}
		},
		{
			"MUTATION",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a mutation operation.",
				["value"] = v13.MUTATION
			}
		},
		{
			"SUBSCRIPTION",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a subscription operation.",
				["value"] = v13.SUBSCRIPTION
			}
		},
		{
			"FIELD",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a field.",
				["value"] = v13.FIELD
			}
		},
		{
			"FRAGMENT_DEFINITION",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a fragment definition.",
				["value"] = v13.FRAGMENT_DEFINITION
			}
		},
		{
			"FRAGMENT_SPREAD",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a fragment spread.",
				["value"] = v13.FRAGMENT_SPREAD
			}
		},
		{
			"INLINE_FRAGMENT",
			{
				["value"] = nil,
				["description"] = "Location adjacent to an inline fragment.",
				["value"] = v13.INLINE_FRAGMENT
			}
		},
		{
			"VARIABLE_DEFINITION",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a variable definition.",
				["value"] = v13.VARIABLE_DEFINITION
			}
		},
		{
			"SCHEMA",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a schema definition.",
				["value"] = v13.SCHEMA
			}
		},
		{
			"SCALAR",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a scalar definition.",
				["value"] = v13.SCALAR
			}
		},
		{
			"OBJECT",
			{
				["value"] = nil,
				["description"] = "Location adjacent to an object type definition.",
				["value"] = v13.OBJECT
			}
		},
		{
			"FIELD_DEFINITION",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a field definition.",
				["value"] = v13.FIELD_DEFINITION
			}
		},
		{
			"ARGUMENT_DEFINITION",
			{
				["value"] = nil,
				["description"] = "Location adjacent to an argument definition.",
				["value"] = v13.ARGUMENT_DEFINITION
			}
		},
		{
			"INTERFACE",
			{
				["value"] = nil,
				["description"] = "Location adjacent to an interface definition.",
				["value"] = v13.INTERFACE
			}
		},
		{
			"UNION",
			{
				["value"] = nil,
				["description"] = "Location adjacent to a union definition.",
				["value"] = v13.UNION
			}
		},
		{
			"ENUM",
			{
				["value"] = nil,
				["description"] = "Location adjacent to an enum definition.",
				["value"] = v13.ENUM
			}
		},
		{
			"ENUM_VALUE",
			{
				["value"] = nil,
				["description"] = "Location adjacent to an enum value definition.",
				["value"] = v13.ENUM_VALUE
			}
		},
		{
			"INPUT_OBJECT",
			{
				["value"] = nil,
				["description"] = "Location adjacent to an input object type definition.",
				["value"] = v13.INPUT_OBJECT
			}
		},
		{
			"INPUT_FIELD_DEFINITION",
			{
				["value"] = nil,
				["description"] = "Location adjacent to an input object field definition.",
				["value"] = v13.INPUT_FIELD_DEFINITION
			}
		}
	})
}
v_u_35 = v54(v55)
local v97 = {
	["name"] = "__Type",
	["description"] = "The fundamental unit of any GraphQL Schema is the type. There are many kinds of types in GraphQL as represented by the `__TypeKind` enum.\n\nDepending on the kind of a type, certain fields describe information about that type. Scalar types provide no information beyond a name, description and optional `specifiedByUrl`, while Enum types provide their values. Object and Interface types provide the fields they describe. Abstract types, Union and Interface, provide the Object types possible at runtime. List and NonNull types compose other types.",
	["fields"] = nil,
	["fields"] = function() -- name: fields
		-- upvalues: (copy) v_u_7, (copy) v_u_20, (ref) v_u_33, (copy) v_u_23, (ref) v_u_32, (copy) v_u_24, (copy) v_u_25, (copy) v_u_26, (copy) v_u_27, (copy) v_u_28, (copy) v_u_29, (copy) v_u_30, (copy) v_u_11, (copy) v_u_10, (copy) v_u_16, (copy) v_u_19, (ref) v_u_37, (copy) v_u_17, (copy) v_u_6, (ref) v_u_36, (copy) v_u_31, (ref) v_u_39, (ref) v_u_38
		local v56 = v_u_7.new
		local v57 = {}
		local v59 = {
			"kind",
			{
				["type"] = v_u_20.new(v_u_33),
				["resolve"] = function(p58) -- name: resolve
					-- upvalues: (ref) v_u_23, (ref) v_u_32, (ref) v_u_24, (ref) v_u_25, (ref) v_u_26, (ref) v_u_27, (ref) v_u_28, (ref) v_u_29, (ref) v_u_30, (ref) v_u_11, (ref) v_u_10
					if v_u_23(p58) then
						return v_u_32.SCALAR
					end
					if v_u_24(p58) then
						return v_u_32.OBJECT
					end
					if v_u_25(p58) then
						return v_u_32.INTERFACE
					end
					if v_u_26(p58) then
						return v_u_32.UNION
					end
					if v_u_27(p58) then
						return v_u_32.ENUM
					end
					if v_u_28(p58) then
						return v_u_32.INPUT_OBJECT
					end
					if v_u_29(p58) then
						return v_u_32.LIST
					end
					if v_u_30(p58) then
						return v_u_32.NON_NULL
					end
					v_u_11(false, ("Unexpected type: \"%s\"."):format(v_u_10(p58)))
					assert(false)
				end
			}
		}
		local v61 = {
			"name",
			{
				["type"] = v_u_16,
				["resolve"] = function(p60) -- name: resolve
					if p60.name == nil then
						return nil
					else
						return p60.name
					end
				end
			}
		}
		local v63 = {
			"description",
			{
				["type"] = v_u_16,
				["resolve"] = function(p62) -- name: resolve
					if p62.description == nil then
						return nil
					else
						return p62.description
					end
				end
			}
		}
		local v65 = {
			"specifiedByUrl",
			{
				["type"] = v_u_16,
				["resolve"] = function(p64) -- name: resolve
					if p64.specifiedByUrl == nil then
						return nil
					else
						return p64.specifiedByUrl
					end
				end
			}
		}
		local v66 = {}
		local v67 = {
			["type"] = v_u_19.new(v_u_20.new(v_u_37))
		}
		local v68 = {
			["includeDeprecated"] = {
				["type"] = nil,
				["defaultValue"] = false,
				["type"] = v_u_17
			}
		}
		v67.args = v68
		function v67.resolve(p69, p70) -- name: resolve
			-- upvalues: (ref) v_u_24, (ref) v_u_25, (ref) v_u_6
			local v71 = p70.includeDeprecated
			if v_u_24(p69) or v_u_25(p69) then
				local v72 = p69:getFields():values()
				return v71 and v72 and v72 or v_u_6.filter(v72, function(p73)
					return p73.deprecationReason == nil
				end)
			end
		end
		__set_list(v66, 1, {"fields", v67})
		local v75 = {
			"interfaces",
			{
				["type"] = v_u_19.new(v_u_20.new(v_u_36)),
				["resolve"] = function(p74) -- name: resolve
					-- upvalues: (ref) v_u_24, (ref) v_u_25
					if v_u_24(p74) or v_u_25(p74) then
						return p74:getInterfaces()
					end
				end
			}
		}
		local v79 = {
			"possibleTypes",
			{
				["type"] = v_u_19.new(v_u_20.new(v_u_36)),
				["resolve"] = function(p76, _, _, p77) -- name: resolve
					-- upvalues: (ref) v_u_31
					local v78 = p77.schema
					if v_u_31(p76) then
						return v78:getPossibleTypes(p76)
					else
						return nil
					end
				end
			}
		}
		local v80 = {}
		local v81 = {
			["type"] = v_u_19.new(v_u_20.new(v_u_39))
		}
		local v82 = {
			["includeDeprecated"] = {
				["type"] = nil,
				["defaultValue"] = false,
				["type"] = v_u_17
			}
		}
		v81.args = v82
		function v81.resolve(p83, p84) -- name: resolve
			-- upvalues: (ref) v_u_27, (ref) v_u_6
			local v85 = p84.includeDeprecated
			if v_u_27(p83) then
				local v86 = p83:getValues()
				return v85 and v86 and v86 or v_u_6.filter(v86, function(p87)
					return p87.deprecationReason == nil
				end)
			end
		end
		__set_list(v80, 1, {"enumValues", v81})
		local v88 = {}
		local v89 = {
			["type"] = v_u_19.new(v_u_20.new(v_u_38))
		}
		local v90 = {
			["includeDeprecated"] = {
				["type"] = nil,
				["defaultValue"] = false,
				["type"] = v_u_17
			}
		}
		v89.args = v90
		function v89.resolve(p91, p92) -- name: resolve
			-- upvalues: (ref) v_u_28, (ref) v_u_6
			local v93 = p92.includeDeprecated
			if v_u_28(p91) then
				local v94 = p91:getFields():values()
				return v93 and v94 and v94 or v_u_6.filter(v94, function(p95)
					return p95.deprecationReason == nil
				end)
			end
		end
		__set_list(v88, 1, {"inputFields", v89})
		__set_list(v57, 1, {v59, v61, v63, v65, v66, v75, v79, v80, v88, {
	"ofType",
	{
		["type"] = v_u_36,
		["resolve"] = function(p96) -- name: resolve
			if p96.ofType == nil then
				return nil
			else
				return p96.ofType
			end
		end
	}
}})
		return v56(v57)
	end
}
v_u_36 = v21.new(v97)
local v113 = {
	["name"] = "__Field",
	["description"] = "Object and Interface types are described by a list of Fields, each of which has a name, potentially a list of arguments, and a return type.",
	["fields"] = nil,
	["fields"] = function() -- name: fields
		-- upvalues: (copy) v_u_7, (copy) v_u_20, (copy) v_u_16, (copy) v_u_19, (ref) v_u_38, (copy) v_u_17, (copy) v_u_6, (ref) v_u_36, (copy) v_u_9
		local v98 = v_u_7.new
		local v99 = {}
		local v101 = {
			"name",
			{
				["type"] = v_u_20.new(v_u_16),
				["resolve"] = function(p100) -- name: resolve
					return p100.name
				end
			}
		}
		local v103 = {
			"description",
			{
				["type"] = v_u_16,
				["resolve"] = function(p102) -- name: resolve
					return p102.description
				end
			}
		}
		local v104 = {}
		local v105 = {
			["type"] = v_u_20.new(v_u_19.new(v_u_20.new(v_u_38)))
		}
		local v106 = {
			["includeDeprecated"] = {
				["type"] = nil,
				["defaultValue"] = false,
				["type"] = v_u_17
			}
		}
		v105.args = v106
		function v105.resolve(p107, p108) -- name: resolve
			-- upvalues: (ref) v_u_6
			if p108.includeDeprecated then
				return p107.args
			else
				return v_u_6.filter(p107.args, function(p109)
					return p109.deprecationReason == nil
				end)
			end
		end
		__set_list(v104, 1, {"args", v105})
		__set_list(v99, 1, {v101, v103, v104, {
	"type",
	{
		["type"] = v_u_20.new(v_u_36),
		["resolve"] = function(p110) -- name: resolve
			return p110.type
		end
	}
}, {
	"isDeprecated",
	{
		["type"] = v_u_20.new(v_u_17),
		["resolve"] = function(p111) -- name: resolve
			-- upvalues: (ref) v_u_9
			return v_u_9(p111.deprecationReason)
		end
	}
}, {
	"deprecationReason",
	{
		["type"] = v_u_16,
		["resolve"] = function(p112) -- name: resolve
			return p112.deprecationReason
		end
	}
}})
		return v98(v99)
	end
}
v_u_37 = v21.new(v113)
local v122 = {
	["name"] = "__InputValue",
	["description"] = "Arguments provided to Fields or Directives and the input fields of an InputObject are represented as Input Values which describe their type and optionally a default value.",
	["fields"] = nil,
	["fields"] = function() -- name: fields
		-- upvalues: (copy) v_u_7, (copy) v_u_20, (copy) v_u_16, (ref) v_u_36, (copy) v_u_14, (copy) v_u_12, (copy) v_u_17, (copy) v_u_9
		return v_u_7.new({
			{
				"name",
				{
					["type"] = v_u_20.new(v_u_16),
					["resolve"] = function(p114) -- name: resolve
						return p114.name
					end
				}
			},
			{
				"description",
				{
					["type"] = v_u_16,
					["resolve"] = function(p115) -- name: resolve
						return p115.description
					end
				}
			},
			{
				"type",
				{
					["type"] = v_u_20.new(v_u_36),
					["resolve"] = function(p116) -- name: resolve
						return p116.type
					end
				}
			},
			{
				"defaultValue",
				{
					["type"] = nil,
					["description"] = "A GraphQL-formatted string representing the default value for this input value.",
					["resolve"] = nil,
					["type"] = v_u_16,
					["resolve"] = function(p117) -- name: resolve
						-- upvalues: (ref) v_u_14, (ref) v_u_12
						local v118 = p117.type
						local v119 = v_u_14(p117.defaultValue, v118)
						if v119 then
							return v_u_12(v119)
						else
							return nil
						end
					end
				}
			},
			{
				"isDeprecated",
				{
					["type"] = v_u_20.new(v_u_17),
					["resolve"] = function(p120) -- name: resolve
						-- upvalues: (ref) v_u_9
						return v_u_9(p120.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					["type"] = v_u_16,
					["resolve"] = function(p121) -- name: resolve
						return p121.deprecationReason
					end
				}
			}
		})
	end
}
v_u_38 = v21.new(v122)
v_u_39 = v21.new({
	["name"] = "__EnumValue",
	["description"] = "One possible value for a given Enum. Enum values are unique values, not a placeholder for a string or numeric value. However an Enum value is returned in a JSON response as a string.",
	["fields"] = nil,
	["fields"] = function() -- name: fields
		-- upvalues: (copy) v_u_7, (copy) v_u_20, (copy) v_u_16, (copy) v_u_17, (copy) v_u_9
		return v_u_7.new({
			{
				"name",
				{
					["type"] = v_u_20.new(v_u_16),
					["resolve"] = function(p123) -- name: resolve
						return p123.name
					end
				}
			},
			{
				"description",
				{
					["type"] = v_u_16,
					["resolve"] = function(p124) -- name: resolve
						return p124.description
					end
				}
			},
			{
				"isDeprecated",
				{
					["type"] = v_u_20.new(v_u_17),
					["resolve"] = function(p125) -- name: resolve
						-- upvalues: (ref) v_u_9
						return v_u_9(p125.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					["type"] = v_u_16,
					["resolve"] = function(p126) -- name: resolve
						return p126.deprecationReason
					end
				}
			}
		})
	end
})
v_u_32 = v8.freeze({
	["SCALAR"] = "SCALAR",
	["OBJECT"] = "OBJECT",
	["INTERFACE"] = "INTERFACE",
	["UNION"] = "UNION",
	["ENUM"] = "ENUM",
	["INPUT_OBJECT"] = "INPUT_OBJECT",
	["LIST"] = "LIST",
	["NON_NULL"] = "NON_NULL"
})
local v127 = v22.new
local v128 = {
	["name"] = "__TypeKind",
	["description"] = "An enum describing what kind of type a given `__Type` is.",
	["values"] = nil,
	["values"] = v_u_7.new({
		{
			"SCALAR",
			{
				["value"] = nil,
				["description"] = "Indicates this type is a scalar.",
				["value"] = v_u_32.SCALAR
			}
		},
		{
			"OBJECT",
			{
				["value"] = nil,
				["description"] = "Indicates this type is an object. `fields` and `interfaces` are valid fields.",
				["value"] = v_u_32.OBJECT
			}
		},
		{
			"INTERFACE",
			{
				["value"] = nil,
				["description"] = "Indicates this type is an interface. `fields`, `interfaces`, and `possibleTypes` are valid fields.",
				["value"] = v_u_32.INTERFACE
			}
		},
		{
			"UNION",
			{
				["value"] = nil,
				["description"] = "Indicates this type is a union. `possibleTypes` is a valid field.",
				["value"] = v_u_32.UNION
			}
		},
		{
			"ENUM",
			{
				["value"] = nil,
				["description"] = "Indicates this type is an enum. `enumValues` is a valid field.",
				["value"] = v_u_32.ENUM
			}
		},
		{
			"INPUT_OBJECT",
			{
				["value"] = nil,
				["description"] = "Indicates this type is an input object. `inputFields` is a valid field.",
				["value"] = v_u_32.INPUT_OBJECT
			}
		},
		{
			"LIST",
			{
				["value"] = nil,
				["description"] = "Indicates this type is a list. `ofType` is a valid field.",
				["value"] = v_u_32.LIST
			}
		},
		{
			"NON_NULL",
			{
				["value"] = nil,
				["description"] = "Indicates this type is a non-null. `ofType` is a valid field.",
				["value"] = v_u_32.NON_NULL
			}
		}
	})
}
v_u_33 = v127(v128)
local v130 = {
	["name"] = "__schema",
	["type"] = nil,
	["description"] = "Access the current type schema of this server.",
	["args"] = nil,
	["resolve"] = nil,
	["deprecationReason"] = nil,
	["extensions"] = nil,
	["astNode"] = nil,
	["type"] = v_u_20.new(v47),
	["args"] = {},
	["resolve"] = function(_, _, _, p129) -- name: resolve
		return p129.schema
	end
}
local v134 = {
	["name"] = "__type",
	["type"] = nil,
	["description"] = "Request the type information of a single type.",
	["args"] = nil,
	["resolve"] = nil,
	["deprecationReason"] = nil,
	["extensions"] = nil,
	["astNode"] = nil,
	["type"] = v_u_36,
	["args"] = {
		{
			["name"] = "name",
			["description"] = nil,
			["type"] = nil,
			["defaultValue"] = nil,
			["deprecationReason"] = nil,
			["extensions"] = nil,
			["astNode"] = nil,
			["type"] = v_u_20.new(v_u_16)
		}
	},
	["resolve"] = function(_, p131, _, p132) -- name: resolve
		local v133 = p131.name
		return p132.schema:getType(v133)
	end
}
local v136 = {
	["name"] = "__typename",
	["type"] = nil,
	["description"] = "The name of the current Object type at runtime.",
	["args"] = nil,
	["resolve"] = nil,
	["deprecationReason"] = nil,
	["extensions"] = nil,
	["astNode"] = nil,
	["type"] = v_u_20.new(v_u_16),
	["args"] = {},
	["resolve"] = function(_, _, _, p135) -- name: resolve
		return p135.parentType.name
	end
}
local v137 = {
	v47,
	v_u_34,
	v_u_35,
	v_u_36,
	v_u_37,
	v_u_38,
	v_u_39,
	v_u_33
}
local v_u_138 = v8.freeze(v137)
return {
	["introspectionTypes"] = v_u_138,
	["isIntrospectionType"] = function(p_u_139) -- name: isIntrospectionType
		-- upvalues: (copy) v_u_6, (copy) v_u_138
		return v_u_6.some(v_u_138, function(p140)
			-- upvalues: (copy) p_u_139
			return p140.name == p_u_139.name
		end)
	end,
	["TypeNameMetaFieldDef"] = v136,
	["TypeMetaFieldDef"] = v134,
	["SchemaMetaFieldDef"] = v130,
	["TypeKind"] = v_u_32,
	["__TypeKind"] = v_u_33,
	["__Schema"] = v47,
	["__Directive"] = v_u_34,
	["__DirectiveLocation"] = v_u_35,
	["__Type"] = v_u_36,
	["__Field"] = v_u_37,
	["__InputValue"] = v_u_38,
	["__EnumValue"] = v_u_39
}