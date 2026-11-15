-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.beta.LinkResult
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.node.Node)
require(v1.parser.beta.Position)
local v_u_2 = {}
v_u_2.__index = v_u_2
v_u_2.Type = table.freeze({
	["WRAP"] = "WRAP",
	["REPLACE"] = "REPLACE"
})
function v_u_2.none() -- name: none
	return nil
end
function v_u_2.wrapTextIn(p3, p4) -- name: wrapTextIn
	-- upvalues: (copy) v_u_2
	local v5 = {
		["_type"] = nil,
		["_node"] = nil,
		["_position"] = nil,
		["_includeMarker"] = false,
		["_type"] = v_u_2.Type.WRAP,
		["_node"] = p3,
		["_position"] = p4
	}
	local v6 = v_u_2
	return setmetatable(v5, v6)
end
function v_u_2.replaceWith(p7, p8) -- name: replaceWith
	-- upvalues: (copy) v_u_2
	local v9 = {
		["_type"] = nil,
		["_node"] = nil,
		["_position"] = nil,
		["_includeMarker"] = false,
		["_type"] = v_u_2.Type.REPLACE,
		["_node"] = p7,
		["_position"] = p8
	}
	local v10 = v_u_2
	return setmetatable(v9, v10)
end
function v_u_2.includeMarker(p11) -- name: includeMarker
	p11._includeMarker = true
	return p11
end
function v_u_2.getType(p12) -- name: getType
	return p12._type
end
function v_u_2.getNode(p13) -- name: getNode
	return p13._node
end
function v_u_2.getPosition(p14) -- name: getPosition
	return p14._position
end
function v_u_2.isIncludeMarker(p15) -- name: isIncludeMarker
	return p15._includeMarker
end
return v_u_2