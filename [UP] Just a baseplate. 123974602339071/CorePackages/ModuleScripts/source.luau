-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.source
local v1 = script.Parent.Parent
local v_u_2 = require(v1.jsutils.inspect).inspect
local v_u_3 = require(v1.jsutils.devAssert).devAssert
local v_u_4 = require(v1.jsutils.instanceOf)
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6, p7, p8) -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_5
	v_u_3(typeof(p6) == "string", "Body must be a string. Received: " .. v_u_2(p6) .. ".")
	local v9 = {
		["body"] = p6,
		["name"] = p7 or "GraphQL request",
		["locationOffset"] = p8 or {
			["line"] = 1,
			["column"] = 1
		}
	}
	v_u_3(v9.locationOffset.line > 0, "line in locationOffset is 1-indexed and must be positive.")
	v_u_3(v9.locationOffset.column > 0, "column in locationOffset is 1-indexed and must be positive.")
	local v10 = v_u_5
	return setmetatable(v9, v10)
end
function v_u_5.__tostring(_) -- name: __tostring
	return "{table Source}"
end
function isSource(p11) -- name: isSource
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	return v_u_4(p11, v_u_5)
end
return {
	["Source"] = v_u_5,
	["isSource"] = isSource
}