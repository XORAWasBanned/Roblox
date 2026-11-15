-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.__tests__.toJSONDeep
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.LuauPolyfill).Array
local v_u_4 = require(v1.jsutils.isObjectLike).isObjectLike
local function v_u_10(p5) -- name: toJSONDeep
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_10
	if not v_u_4(p5) then
		return p5
	end
	local v6 = p5.toJSON
	if type(v6) == "function" then
		return p5:toJSON()
	end
	if v_u_3.isArray(p5) then
		return v_u_3.map(p5, v_u_10)
	end
	local v7 = {}
	for v8, v9 in pairs(p5) do
		v7[v8] = v_u_10(v9)
	end
	return v7
end
return {
	["toJSONDeep"] = v_u_10
}