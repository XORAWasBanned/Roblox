-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.ast
local v1 = script.Parent.Parent.Parent
require(v1.LuauPolyfill)
require(script.Parent.source)
require(script.Parent.tokenKind)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3, p4, p5) -- name: new
	-- upvalues: (copy) v_u_2
	local v6 = {
		["start"] = p3.start,
		["_end"] = p4._end,
		["startToken"] = p3,
		["endToken"] = p4,
		["source"] = p5
	}
	local v7 = v_u_2
	return setmetatable(v6, v7)
end
function v_u_2.toJSON(p8) -- name: toJSON
	return {
		["start"] = p8.start,
		["_end"] = p8._end
	}
end
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.new(p10, p11, p12, p13, p14, p15, p16) -- name: new
	-- upvalues: (copy) v_u_9
	local v17 = v_u_9
	return setmetatable({
		["kind"] = p10,
		["start"] = p11,
		["_end"] = p12,
		["line"] = p13,
		["column"] = p14,
		["value"] = p16,
		["prev"] = p15,
		["next"] = nil
	}, v17)
end
function v_u_9.toJSON(p18) -- name: toJSON
	return {
		["kind"] = p18.kind,
		["value"] = p18.value,
		["line"] = p18.line,
		["column"] = p18.column
	}
end
return {
	["Location"] = v_u_2,
	["Token"] = v_u_9,
	["isNode"] = function(p19) -- name: isNode
		local v20
		if typeof(p19) == "table" then
			local v21 = p19.kind
			v20 = typeof(v21) == "string"
		else
			v20 = false
		end
		return v20
	end
}