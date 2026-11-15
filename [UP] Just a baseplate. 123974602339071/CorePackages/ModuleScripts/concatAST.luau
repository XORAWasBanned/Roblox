-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.concatAST
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Array
require(script.Parent.Parent.language.ast)
function concatAST(p3) -- name: concatAST
	-- upvalues: (copy) v_u_2
	local v4 = {}
	for _, v5 in ipairs(p3) do
		v4 = v_u_2.concat(v4, v5.definitions)
	end
	return {
		["kind"] = "Document",
		["definitions"] = nil,
		["definitions"] = v4
	}
end
return {
	["concatAST"] = concatAST
}