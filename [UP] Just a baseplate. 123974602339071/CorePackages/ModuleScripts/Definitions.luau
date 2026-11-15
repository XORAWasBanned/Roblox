-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.Definitions
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.node.DefinitionMap)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new() -- name: new
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2
	return setmetatable({
		["_definitionsByType"] = {}
	}, v3)
end
function v_u_2.addDefinitions(p4, p5) -- name: addDefinitions
	local v6 = p4:getMap(p5:getType())
	if v6 == nil then
		p4._definitionsByType[p5:getType()] = p5
	else
		v6:addAll(p5)
	end
end
function v_u_2.getDefinition(p7, p8, p9) -- name: getDefinition
	local v10 = p7:getMap(p8)
	if v10 == nil then
		return nil
	else
		return v10:get(p9)
	end
end
function v_u_2.getMap(p11, p12) -- name: getMap
	return p11._definitionsByType[p12]
end
return v_u_2