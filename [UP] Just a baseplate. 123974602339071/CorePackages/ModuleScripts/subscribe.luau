-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.subscription.subscribe
local v1 = script.Parent.Parent
local v2 = v1.Parent
require(v2.LuauPolyfill)
require(v1.language.ast)
require(v1.execution.execute)
require(v1.type.schema)
require(v1.type.definition)
return {
	["subscribe"] = function(_) -- name: subscribe
		error("graphql-lua does not currently implement subscriptions")
	end,
	["createSourceEventStream"] = function(_, _, _, _, _, _, _) -- name: createSourceEventStream
		error("graphql-lua does not currently implement subscriptions")
	end
}