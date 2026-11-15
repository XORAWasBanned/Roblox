-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.beta.ParsedInline
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.node.Node)
require(v1.parser.beta.Position)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.none() -- name: none
	return nil
end
function v_u_2.of(p3, p4) -- name: of
	-- upvalues: (copy) v_u_2
	local v5 = v_u_2
	return setmetatable({
		["_node"] = p3,
		["_position"] = p4
	}, v5)
end
function v_u_2.getNode(p6) -- name: getNode
	return p6._node
end
function v_u_2.getPosition(p7) -- name: getPosition
	return p7._position
end
return v_u_2