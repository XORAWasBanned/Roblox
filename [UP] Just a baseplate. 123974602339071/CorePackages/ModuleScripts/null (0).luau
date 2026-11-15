-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.null
return setmetatable({
	["__NULL_IDENTIFIER__"] = "__GRAPHQL_NULL_OBJECT__"
}, {
	["__newindex"] = nil,
	["__metatable"] = false,
	["__tostring"] = nil,
	["__newindex"] = function(_, p1, _) -- name: __newindex
		local v2 = ("%q (%s) is not a valid member of %s"):format(tostring(p1), typeof(p1), "null")
		error(v2, 2)
	end,
	["__tostring"] = function() -- name: __tostring
		return "null"
	end
})